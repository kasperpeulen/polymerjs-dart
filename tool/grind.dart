library polymerjs.grind;

import 'package:grinder/grinder.dart';

const dartium = 'dartium';
const chrome = 'chrome';
const firefox = 'firefox';
const safari = 'safari';

const macPlatforms = const ['dartium,firefox,chrome,safari'];

const PolymerDom = 'test/PolymerDom_test.dart';
const PolymerBase = 'test/PolymerBase_test.dart';

const allFiles = const [
  PolymerDom,
  PolymerBase
];

main(args) => grind(args);

@Task('Install and update bower')
bower() {
  run('bower', arguments: ['install']);
  run('bower', arguments: ['update']);
}

@DefaultTask('Test')
@Depends('bower')
test() =>
    new TestRunner().test(
        files: allFiles,
        platformSelector: macPlatforms);
