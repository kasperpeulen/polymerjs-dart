library polymerjs.parser;

import 'dart:io';

import 'src/behavior.dart';
import 'src/custom_element_parser.dart';
import 'src/custom_element_manager.dart' as CustomElementManager;

main() {
  // iterate over all custom elements specified in bower.json
  CustomElementManager.files.forEach((name, readFile) {

    // setup the parser
    String input = readFile.readAsStringSync();
    CustomElementParser parser = new CustomElementParser(name, input, readFile);
    CustomElementManager.parsers[name] = parser;

    // write the dart apis
    File writeFile = new File('${CustomElementManager.outputDir.path}/${parser.nameUnderscore}.dart');
    CustomElementManager.outputDir.createSync();
    writeFile.writeAsStringSync(parser.output.join('\n'));

    // write behaviors classes
    parser.behaviors.forEach((Behavior b) {

      File file = new File('${CustomElementManager.outputDir.path}/${b.nameUnderscore}.dart');
      file.writeAsStringSync(b.output.join('\n'));
    });
  });

  // write to custom_element_constructors.dart
  File writeFile = new File('lib/element_constructors.dart');
  writeFile.writeAsStringSync(
      CustomElementManager.elementConstructorsOutput.join('\n'));
}
