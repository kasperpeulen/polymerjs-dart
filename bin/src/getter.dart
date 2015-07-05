library polymerjs.getter;

import 'matchers.dart';
import 'common.dart';

class Getter {
  String name;
  List<String> lines;
  List<String> dartDoc;
  List<String> output = [];
  String type = 'dynamic';

  Getter(String rawdocs, this.name) {
    dartDoc = rawdocs.replaceAll(Matchers.commentChars, '').trim().split('\n');
    dartDoc = dartDoc.map((e) => e.trim()).toList();
    dartDoc.removeWhere((e) => e == "" || e.contains('@property'));
    parsePragmas();
    dartDoc.removeWhere((e) => e.contains('@type'));
    writeOutput();
  }

  void parsePragmas() {
    for (String line in dartDoc) {
      if (Matchers.pragma.hasMatch(line)) {
        Match m = Matchers.pragma.firstMatch(line);
        String pragma = m.group(1);
        String info = m.group(2);
        switch (pragma) {
          case 'type':
            String jsType = info.trim();
            type = typeFromString[jsType];
            if (type == null) {
              type = 'dynamic';
            }
            break;
        }
      }
    }
  }

  void writeOutput() {
    dartDoc.forEach((s) => output.add('  /// $s'));
    String body = (){
      if (type == 'Map') {
        return 'dartify(js[\'${name}\'])';
      }
      return 'js[\'${name}\']';
    }();
    output.add('  ${type} get ${name} => $body;');
    output.add('');
  }
}
