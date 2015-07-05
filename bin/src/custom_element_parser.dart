library polymerjs.custom_element_parser;

import 'method.dart';
import 'property.dart';
import 'behavior.dart';
import 'parsermixin.dart';
import 'matchers.dart';

import 'package:html/dom.dart' as Html;
import 'package:html/parser.dart' as Html;
import 'getter.dart';
import 'dart:io';
import 'dart:collection';

class CustomElementParser extends Object with PolymerParserMixin {
  File file;
  String input;
  String name;
  List<String> dartDoc;
  List<Method> methods = [];
  List<Property> properties = [];
  List<Behavior> behaviors = [];
  List<Getter> getters = [];
  List<String> output = [];

  Html.Document document;

  CustomElementParser(this.name, this.input, this.file) {
    document = Html.parse(input);
    parseBehaviors();
    parseDoc();
    parseProperties();
    parseMethods();
    writeOutput();
  }

  void parseBehaviors() {
    if (Matchers.behavior.hasMatch(input)) {
      Match m = Matchers.behavior.firstMatch(input);
      List<String> rawBehaviors = m.group(1).split(',');
      rawBehaviors =
          rawBehaviors.map((l) => l.trim().replaceAll('Polymer.', '')).toList();
      rawBehaviors.removeWhere((l) => l.isEmpty);
      for (String name in rawBehaviors) {
        Behavior behavior = new Behavior(this, name);
        behaviors.add(behavior);
      }
    }
    behaviors = behaviors.toSet().toList();
  }

  void parseDoc() {
    RegExp htmlComment = new RegExp(r'<!--([\s\S]*?)-->');
    for (var m in htmlComment.allMatches(input)) {
      if (m.group(1).contains('@element') || m.group(1).contains('@class')) {
        dartDoc = m.group(1).trim().split('\n');
        dartDoc.removeWhere((s) => s.startsWith('@'));
      }
    }
    if (dartDoc == null) {
      try {
        Match m = htmlComment.allMatches(input).toList()[1];
        dartDoc = m.group(1).trim().split('\n');
        dartDoc.removeWhere((s) => s.startsWith('@'));
      } on Error {
        dartDoc = [];
      }
    }
  }

  void writeOutput() {
    output.add('library polymerjs.${nameUnderscore};');
    output.add('');
    output.add('import \'dart:html\';');
    output.add('import \'package:polymerjs/polymer.dart\';');
    behaviors.forEach((b) {
      output.add('import \'${b.nameUnderscore}.dart\';');
    });
    output.add('');
    writeDoc();
    writeConstructors();
    output.add('');
    writeProperties();
    writeGetters();
    writeMethods();
    output.add('}');

    if (output.any((e) => e.contains(new RegExp(r'dartify|jsify')))) {
      output.insert(3, 'import \'package:polymerjs/jsutils.dart\';');
    }
  }

  void writeConstructors() {
    String className = nameCamelCase;
    String mixins = () {
      if (behaviors.isEmpty) {
        return '';
      }
      return ' with ' +
          IterableBase.iterableToFullString(
              behaviors.map((b) => b.nameCamelCase))
              .replaceAll('(', '')
              .replaceAll(')', '');
    }();
    output.add('class $className extends PolymerElement$mixins {');
    output.add('  $className() : super.tag(\'$name\');');
    output.add('  $className.from(HtmlElement element) : super.from(element);');
  }

  String get nameCamelCase {
    return name
        .split('-')
        .map((e) => e[0].toUpperCase() + e.substring(1))
        .toList()
        .join();
  }

  String toString() => name;
}
