@TestOn('browser')
library polymerjs.dollar_functions_test;

import 'package:test/test.dart';

import 'package:polymerjs/polymer.dart';

void main() {
  test("custom-element", () {
    expect($$('custom-element'), new isInstanceOf<PolymerElement>());
  });

  test('type extension', () {
    expect($$('input'), new isInstanceOf<PolymerElement>());
  });

  test('web element', () {
    expect($$('div') is PolymerElement, false);
    expect($$('div'), new isInstanceOf<WebElement>());
  });

}