@TestOn('browser')
library test_IronAutoGrowTextarea;

import "package:test/test.dart";
import 'dart:async';
import 'dart:js';
import 'package:polymerjs/element_constructors.dart';

void main() {

  test("PolymerReady", () async {
    await Polymer.whenReady();
    expect(context["CustomElements"]["ready"], isNotNull);
  });

  group('iron-collapse', () {
    IronCollapse collapse = $$("iron-collapse");
    var delay = new Duration(milliseconds:500);
    var collapseHeight;
    test('opened attribute', () {
      expect(collapse.opened, true);
    });

    test('horizontal attribute', () {
      expect(collapse.horizontal, false);
    });

    test('default opened height', () {
      expect(new Future.delayed(delay, () {
        collapseHeight = collapse.element.getComputedStyle().height;
        return collapseHeight;
      }
      ), completion(isNot("0px")));
    });

    test('set opened to false', () {
      collapse.opened = false;
      expect(new Future.delayed(delay, () =>
      collapse.element.getComputedStyle().height
      ), completion("0px"));
    }, onPlatform: {
      "chrome" : [new Skip("TODO: investigate this")]
    });

    test('set opened to true', () {
      collapse.opened = true;
      expect(new Future.delayed(delay, () =>
      collapse.element.getComputedStyle().height
      ), completion(collapseHeight));
    });
  }, onPlatform: {
    "chrome" : [new Skip("TODO: investigate this")]
  });
}
