library polymerjs.grind;

import 'package:grinder/grinder.dart';
import 'dart:io';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:path/path.dart' as path;

const dartium = 'dartium';
const chrome = 'chrome';
const firefox = 'firefox';
const safari = 'safari';

const macPlatforms = const [
  dartium,
  chrome,
  firefox,
  safari
];

main(args) => grind(args);

@Task('Install and update bower')
bower() {
  run('bower', arguments: ['install']);
  run('bower', arguments: ['update']);
}

@DefaultTask('Test')
//@Depends('bower')
@Depends('prepare-tests-for-test-runner')
test() {
  new TestRunner().test(platformSelector: macPlatforms);
}

@Task("Serve polymerjs examples.")
examples() {
  run("pub", arguments: ["get"],
  runOptions: new RunOptions(workingDirectory: "polymerjs_examples"));
  run("bower", arguments: ["install"],
  runOptions: new RunOptions(workingDirectory: "polymerjs_examples"));
  runAsync("pub", arguments: ["serve"],
  runOptions: new RunOptions(workingDirectory: "polymerjs_examples"));
}

TestScriptReplacer testScriptReplacer = new TestScriptReplacer();

@Task("Prepare Tests For Debugging")
prepareTestsForDebugging() {
  testScriptReplacer.replaceAllLinksWithScript();
}

@Task("Preprare Tests For Test Runner")
prepareTestsForTestRunner() {
  testScriptReplacer.replaceAllScriptsWithLink();
}

class TestScriptReplacer {

  List<File> testFiles;

  TestScriptReplacer({this.testFiles}) {
    if (testFiles == null) findTestFiles();
  }

  void replaceAllScriptsWithLink() => testFiles.forEach(replaceScriptWithLink);

  void replaceAllLinksWithScript() => testFiles.forEach(replaceLinkWithScript);


  void replaceLinkWithScript(File testFile) {
    Document doc = parse(testFile.readAsStringSync());
    String htmlPath = path.relative(testFile.path, from: testFile.parent.path);
    String dartPath = '${htmlPath.substring(0, htmlPath.lastIndexOf('.'))}.dart';
    Element link = doc.querySelector("link[href='$dartPath']");
    if (link == null) return;
    Element script = new Element.tag('script')
      ..attributes.addAll({'type': 'application/dart', 'src': dartPath});
    link.replaceWith(script);
    testFile.writeAsStringSync(doc.outerHtml);
  }

  void replaceScriptWithLink(File testFile) {
    Document doc = parse(testFile.readAsStringSync());
    String parentPath = testFile.parent.path;
    String htmlPath = path.relative(testFile.path, from: parentPath);
    String dartPath = '${htmlPath.substring(0, htmlPath.lastIndexOf('.'))}.dart';
    Element script = doc.querySelector("script[src='$dartPath']");
    if (script == null) return;
    Element link = new Element.tag('link')
      ..attributes.addAll({'rel': 'x-dart-test', 'href': dartPath});
    script.replaceWith(link);
    testFile.writeAsStringSync(doc.outerHtml);
  }

  void findTestFiles() {
    testFiles = new Directory('test')
        .listSync(recursive: true, followLinks: false)
        .map((entry) {
      if (entry.path.endsWith("_test.html")) {
        return entry;
      }
    }).toList();
    testFiles.removeWhere((e) => e == null);
  }
}
