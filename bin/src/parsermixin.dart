library polymerjs.parsermixin;

import 'property.dart';
import 'method.dart';
import 'matchers.dart';
import 'getter.dart';

abstract class PolymerParserMixin {
  String input;
  String name;
  List<Method> methods;
  List<Property> properties;
  List<Getter> getters;
  List<String> output;
  List<String> dartDoc;

  String get nameUnderscore => name.replaceAll('-', '_');

  void parseProperties() {

    RegExp propertiesUntilEnd = Matchers.propertiesUntilEnd;
    if (!propertiesUntilEnd.hasMatch(input)) return;
    List<String> lines =
        propertiesUntilEnd.firstMatch(input).group(2).split('\n');
    lines = lines.map((lines) => lines.trim()).toList();
    String joined = lines.join('\n');

    for (Match m in Matchers.property.allMatches(joined)) {
      var rawDocs = m.group(1) != null ? m.group(1) : m.group(4);
      var propName = m.group(2) != null ? m.group(2) : m.group(5);
      if (propName == 'listeners') continue;
      var rawInfo = m.group(3) != null ? m.group(3) : m.group(6);
      properties.add(new Property(propName, rawDocs, rawInfo));
    }

    for (Match m in Matchers.getter.allMatches(joined)) {
      var rawDocs = m[1];
      var propName = m[2];
      getters.add(new Getter(rawDocs, propName));
    }
  }

  void parseMethods() {
    for (Match m in Matchers.method.allMatches(input)) {
      var rawDoc = m.group(1);
      var rawName = m.group(2);
      var rawArgs = m.group(3);
      methods.add(new Method(rawDoc, rawName, rawArgs));
    }
  }

  void writeDoc() {
    dartDoc.forEach((e) => output.add('/// $e'));
  }

  void writeProperties() {
    for (Property prop in properties) {
      prop.output.forEach((l) => output.add(l));
    }
  }

  void writeMethods() {
    for (Method method in methods) {
      method.output.forEach((s) => output.add(s));
    }
  }

  void writeGetters() {
    for (Getter getter in getters) {
      getter.output.forEach((l) => output.add(l));
    }
  }
}
