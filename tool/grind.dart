library polymerjs.grind;

import 'package:grinder/grinder.dart';

const dartium = 'dartium';
const chrome = 'chrome';
const firefox = 'firefox';
const safari = 'safari';

const macPlatforms = const ['dartium,firefox,chrome,safari'];

const PolymerDom = 'test/polymer_dom_test.dart';
const PolymerBase = 'test/polymer_base_test.dart';
const PolymerCall = 'test/polymer_call_test.dart';
const DollarFunctions = 'test/dollar_functions_test.dart';

const allFiles = const [
  PolymerDom,
  PolymerBase,
  PolymerCall,
  DollarFunctions
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
