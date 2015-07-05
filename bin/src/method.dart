library polymerjs.method;

import 'matchers.dart';
import 'common.dart';

class Method {
  String name;
  String dartName;
  List<String> lines;
  List<String> dartDoc;
  List<String> output = [];
  RegExp commentChars = new RegExp(r'[\&*|\*/|\/\*\*]');
  String rawargs;
  String type = 'void';
  List<String> args;

  Method(String rawDocs, this.name, this.rawargs) {

    dartDoc = rawDocs
        .replaceAll(commentChars, '')
        .trim()
        .split('\n')
        .map((e) => e.trim())
        .toList();

    dartDoc.removeWhere((e) => e == "" || e.contains('@method'));
    dartDoc.removeWhere((e) => e.contains('@return'));












    dartName = name.replaceAll('_', '');









    args = rawargs.split(',');
    args = args.map((arg) => arg.trim()).toList();
    parsePragmas();
    writeOutput();
  }

  void parsePragmas() {
    for (String line in dartDoc) {
      if (Matchers.pragma.hasMatch(line)) {
        Match m = Matchers.pragma.firstMatch(line);
        String pragma = m.group(1);
        String info = m.group(2);
        switch (pragma) {
          case 'param':
            if (!Matchers.param.hasMatch(info)) break;
            Match m = Matchers.param.firstMatch(info);
            String paramName = m[2];
            String jsType = m[1];
            String dartType = typeFromString[jsType];
            if (dartType == null) dartType = 'dynamic';
            int index =
                args.indexOf(args.firstWhere((arg) => arg == paramName));
            args[index] = '$dartType ${args[index]}';
            break;
          case 'returns':
          case 'return':
            if (!Matchers.returns.hasMatch(info)) break;
            Match m = Matchers.returns.firstMatch(info);
            String jsType = m[1];
            type = typeFromString[jsType];
            if (type == null) type = 'dynamic';
            break;
        }
      }
    }
  }

  void writeOutput() {
    dartDoc.forEach((s) => output.add('  /// $s'));
    String argsWithType = args.join(', ');
    String body = () {
      if (type == 'Map') {
        return 'dartify(js.callMethod(\'${name}\', [$rawargs]))';
      }
      return 'js.callMethod(\'${name}\', [$rawargs])';
    }();
    output.add('  $type ${dartName}($argsWithType) => $body;');
    output.add('');
  }
}
