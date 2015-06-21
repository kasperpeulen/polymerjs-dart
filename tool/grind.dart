import 'package:grinder/grinder.dart';

const dartium = 'dartium';
const chrome = 'chrome';
const firefox = 'firefox';
const safari = 'safari';

const allPlatforms = const ['dartium,firefox,chrome,safari'];

const PolymerDom = 'test/PolymerDom_test.dart';

const allFiles = const [
  PolymerDom
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
        platformSelector: allPlatforms);
