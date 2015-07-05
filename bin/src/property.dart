library polymerjs.property;

import 'matchers.dart';
import 'common.dart';

class Property {
  String name;
  String dartName;
  List<String> doc;
  String value;
  String observer;
  String type = 'String';
  bool notify = false;
  bool reflectToAttribute = false;
  bool readOnly = false;
  List<String> output = [];

  Property(this.name, String rawdocs, String rawinfo) {
    // TODO what to do with private variables ?
    dartName = name.replaceAll('_', '');
    parseInfo(rawinfo);
    parseDocs(rawdocs);
    writeOutput();
  }

  void parseDocs(String rawdocs) {
    doc = rawdocs.replaceAll(Matchers.commentChars, '').trim().split('\n');
    doc = doc.map((e) => e.trim()).toList();
    doc.removeWhere((l) => l.startsWith("@attribute"));
    doc.removeWhere((l) => l.startsWith("@default"));
    doc.removeWhere((l) => l.startsWith("@type"));
    if (!doc.isEmpty && doc.last.isEmpty) {
      doc.removeLast();
    }
    if (reflectToAttribute) doc.addAll(['', '@reflectToAttribute']);
    if (notify) doc.addAll(['', '@notify']);
    if (readOnly) doc.addAll(['', '@readOnly']);
    if (value != null) doc.addAll(['', '@default $value']);
    if (observer != null && !observer.contains('_')) doc
        .addAll(['', '@observer $observer']);
  }

  void parseInfo(String rawinfo) {
    List<String> lines = rawinfo.split('\n');
    lines.removeWhere((s) => s.isEmpty || !s.contains(":"));
    lines = lines.map((s) => s.replaceAll(',', '')).toList();

    for (String line in lines) {
      String key = line.substring(0, line.indexOf(':'));
      String value = line.substring(line.indexOf(':') + 1).trim();
      switch (key) {
        case 'type':
          type = typeFromString[value];
          break;
        case 'value':
          if (value == 'function() {') {
            this.value = null;
          } else {
            this.value = value;
          }
          break;
        case 'notify':
          notify = value == 'true';
          break;
        case 'reflectToAttribute':
          reflectToAttribute = value == 'true';
          break;
        case 'readOnly':
          readOnly = value == 'true';
          break;
        case 'observer':
          observer = value;
          break;
        default:
          break;
      }
    }
  }

  void writeOutput() {
    writeGetter();
    if (!readOnly) {
      writeSetter();
    }
    output.add('');
  }

  void writeGetter() {
    doc.forEach((s) => output.add('  /// $s'));
    String body = (){
      if (type == 'Map') {
        return 'dartify(js[\'${name}\'])';
      }
      return 'js[\'${name}\']';
    }();
    output.add('  ${type} get ${dartName} => $body;');
  }

  void writeSetter() {
    doc.forEach((s) => output.add('  /// $s'));
    String body = (){
      if (type == 'Map') {
        return 'js[\'${name}\'] = jsify(value)';
      }
      return 'js[\'${name}\'] = value';
    }();
    output.add('  set ${dartName}(${type} value) { $body; }');
  }
}

