library polymerjs.behavior;

import 'dart:io';
import 'property.dart';
import 'method.dart';
import 'matchers.dart';
import 'parsermixin.dart';
import 'custom_element_manager.dart';
import 'custom_element_parser.dart';
import 'getter.dart';
import 'package:html/dom.dart' as Html;
import 'package:html/parser.dart' as Html;

class Behavior extends Object with PolymerParserMixin {
  CustomElementParser parser;
  String name;
  String nameCamelCase;
  String filePath;
  File file;
  String input;
  Html.Document document;

  List<String> dartDoc;
  List<Behavior> behaviors = [];
  List<Method> methods = [];
  List<Property> properties = [];
  List<Getter> getters = [];
  List<String> output = [];

  Behavior(this.parser, this.nameCamelCase) {
    name = () {
      String name = nameCamelCase.replaceAllMapped(
          new RegExp(r'([A-Z][a-z0-9]+)'), (m) => '${m[1].toLowerCase()}-');
      return name.substring(0, name.length - 1);
    }();
    file = findBehaviorFile(this);
    input = file.readAsStringSync();
    document = Html.parse(input);
    parseBehaviors();
    parseDoc();
    parseMethods();
    parseProperties();
    writeOutput();
  }

  void parseBehaviors() {
    if (Matchers.behaviorInBehavior(nameCamelCase).hasMatch(input)) {
      Match m = Matchers.behaviorInBehavior(nameCamelCase).firstMatch(input);
      List<String> rawBehaviors = m.group(1).split(',');
      rawBehaviors =
          rawBehaviors.map((l) => l.trim().replaceAll('Polymer.', '')).toList();
      rawBehaviors.removeWhere((l) => l.isEmpty);

      // for example remove PaperButtonBehaviorImpl when it is already defined
      // in the file itself
      rawBehaviors.removeWhere(
          (l) => 'Polymer.$l'.allMatches(input).length >= 2 &&
              input.contains('Polymer.$l = {'));
      for (String name in rawBehaviors) {
        Behavior behavior = new Behavior(parser, name);
        parser.behaviors.add(behavior);
      }
    }
  }

  void parseDoc() {
    for (var m in Matchers.scriptDocs.allMatches(input)) {
      if (m.group(1).contains('@polymerBehavior')) {
        dartDoc = m.group(1).trim().split('\n');
        dartDoc = dartDoc
            .join('\n')
            .replaceAll(Matchers.commentChars, '')
            .trim()
            .split('\n');
        dartDoc = dartDoc.map((e) => e.trim()).toList();
        dartDoc.removeWhere((s) => s.startsWith('@'));
        if (dartDoc.isNotEmpty && dartDoc.last.isEmpty) {
          dartDoc.removeLast();
        }
      }
    }
  }

  writeOutput() {
    output.add('library polymerjs.${nameUnderscore};');
    output.add('');
    output.add('import \'dart:js\';');
    output.add('');
    writeDoc();
    writeConstructors();
    output.add('');
    writeProperties();
    writeGetters();
    writeMethods();
    output.add('}');

    if (output.any((e) => e.contains('HtmlElement'))) {
      output.insert(2, 'import \'dart:html\';');
    }

    if (output.any((e) => e.contains(new RegExp(r'dartify|jsify')))) {
      output.insert(3, 'import \'package:polymerjs/jsutils.dart\';');
    }

  }

  void writeConstructors() {
    String className = nameCamelCase;
    output.add('abstract class $className {');
    output.add('  JsObject js;');
  }

  bool operator==(Behavior other) => name == other.name;

  int get hashCode => name.hashCode;

  String toString() => name;
}
