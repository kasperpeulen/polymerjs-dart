library polymerjs.custom_element_manager;

import 'package:html/dom.dart' as Html;
import 'package:html/parser.dart' as Html;
import 'dart:convert';
import 'dart:io';
import 'behavior.dart';
import 'custom_element_parser.dart';
import 'package:grinder/grinder.dart';

Map<String, CustomElementParser> parsers = {};

/// The directory specified in .bowerrc. If not specified, we use
/// `lib/components` as default.
Directory get inputDir {
  Directory dir = new Directory(_inputPath);
  if (!dir.existsSync()) {
    run('bower', arguments: ['install']);
    run('bower', arguments: ['update']);
  }
  return dir;
}

/// The output directory is by default `lib/components_dartapis`.
Directory get outputDir {
  Directory dir = new Directory('${inputDir.path}_dartapis');
  if (!dir.existsSync()) {
    dir.createSync();
  }
  return dir;
}

/// A map with the custom element names as keys. And the associated files as values.
Map<String, File> get files {
  Map map = new Map.fromIterable(_customElements, value: (name) {
    // first try the file in the most obvious place
    File file = new File('${inputDir.path}/$name/$name.html');
    if (!file.existsSync()) {
      file = _findFile('$name.html');
    }
    // filter fake custom elements such as iron-test-helpers
    if (!file.readAsStringSync().contains('Polymer({')) {
      return null;
    }
    return file;
  });
  // filter out null values
  map.keys.where((key) => map[key] == null).toList().forEach(map.remove);
  return map;
}

File findBehaviorFile(Behavior behavior) {
  List<Html.Element> imports =
  behavior.parser.document.querySelectorAll('link[rel=import]');

  List<String> hrefs = imports.map((link) => link.attributes['href']).toList();
  for (String href in hrefs) {
    String nameWithoutBehavior = behavior.nameCamelCase.toLowerCase().replaceAll('behavior', '');
    if (href.toLowerCase().replaceAll('-', '').contains(nameWithoutBehavior)) {
      if (href.startsWith('..')) {
        href = href.replaceAll('..', '');
        String filePath = '${inputDir.path}$href';
        return new File(filePath);
      } else {
        String filePath = '${behavior.parser.file.parent.path}/$href';
        return new File(filePath);
      }
    }
  }
  Directory dir = inputDir;
  List<FileSystemEntity> allFiles = dir.listSync(recursive: true);
  for (FileSystemEntity file in allFiles) {
    if (file.path.endsWith('${behavior.name}.html')) {
      return file;
    }
    if (file.path.endsWith('html')) {
      if (file.path
      .endsWith('${behavior.name.replaceAll('-behavior', '')}.html')) {
        return file;
      }
    }
  }
  throw 'Oh noes! No matching file found for ${behavior.name}';
}

List<String> get elementConstructorsOutput {
  String pathToComponents = () {
    String dir = outputDir.path;
    if (dir.contains('lib')) {
      return 'package:polymerjs/${dir.replaceAll('lib/', '')}';
    } else {
      return '/${dir}';
    }
  }();

  List<String> output = []
    ..add('library polymerjs.element_constructors;')
    ..add('')
    ..add('export \'dart:html\';')
    ..add('export \'package:polymerjs/polymer.dart\';')
    ..add('')
    ..add('Map<String, Function> elementConstructors = {');

  parsers.forEach((String name, CustomElementParser parser) {
    output.insert(
        4, 'import \'${pathToComponents}/${parser.nameUnderscore}.dart\';');
    output.insert(
        4, 'export \'${pathToComponents}/${parser.nameUnderscore}.dart\';');
    output.add(
        '  \'$name\' : (element) => new ${parser.nameCamelCase}.from(element),');
  });

  output.add('};');

  return output;
}

String get _inputPath {
  // if .bowerrc doesn't exist create it, and set the dir to lib/components
  File bowerrcFile = new File('.bowerrc');
  if (!bowerrcFile.existsSync()) {
    bowerrcFile.writeAsStringSync(
        ['{', '  "directory": "lib/components"', '}'].join('\n'));
  }
  Map json = JSON.decode(bowerrcFile.readAsStringSync());
  return json['directory'];
}

/// Returns the map of bower dependencies.
Map<String, String> get _dependencies {
  File bowerFile = new File('bower.json');
  if (!bowerFile.existsSync()) throw 'Oh noes! I couldn\'t find bower.json.';
  Map json = JSON.decode(bowerFile.readAsStringSync());
  return json['dependencies'];
}

/// Filters the bower dependencies and returns a list of the names of the
/// components.
///
/// * The polymer dependency is removed, as it is no custom element.
/// * If paper-tabs is present, paper-tab is added to the list.
/// * This list also contain fake custom elements such as iron-test-helpers.
List<String> get _customElements {
  List<String> customElements = [];
  _dependencies.forEach((k, v) {
    if (k.toLowerCase() == 'polymer') return;
    customElements.add(k);
    if (k == 'paper-tabs') {
      customElements.add('paper-tab');
    }
  });
  return customElements;
}

File _findFile(String name) {
  Directory dir = inputDir;
  List<FileSystemEntity> allFiles = dir.listSync(recursive: true);
  for (FileSystemEntity file in allFiles) {
    if (file.path.endsWith(name)) {
      return file;
    }
  }
  run('bower', arguments: ['install']);
  run('bower', arguments: ['update']);

  allFiles = dir.listSync(recursive: true);
  for (FileSystemEntity file in allFiles) {
    if (file.path.endsWith(name)) {
      return file;
    }
  }

  throw 'Oh noes! No matching file found for ${name}';
}
