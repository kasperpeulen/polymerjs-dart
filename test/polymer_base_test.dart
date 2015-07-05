@TestOn('browser')
library polymerjs.polymerbase_test;

import 'dart:html';
import 'dart:js';

import 'package:test/test.dart';

import 'package:polymerjs/polymer.dart';
import 'dart:async';

PolymerElement polymerElement;
PolymerElement drawerPanel;
PolymerElement paperItem;

void main() {
  paperItem = $$('paper-item');

  test("PolymerReady", () async {
    await Polymer.whenReady();
    expect(context["CustomElements"]["ready"], isNotNull);
  });


  group('deserialize', () {
    test('int', () {
      expect(paperItem.deserialize('1', int), 1);
    });
    test("List", () {
      expect(paperItem.deserialize('[1,"hello"]', List), [1, 'hello']);
    });
    test("Map", () {
      expect(paperItem.deserialize('{"1":1,"2":2}', Map)['1'], 1);
      expect(paperItem.deserialize('{"1":1,"2":2}', Map), {'1': 1, '2': 2});
    });
    test("bool", () {
      expect(paperItem.deserialize('true', Map), true);
    });
  });

  test("elementMatches", () => expect(paperItem.elementMatches('paper-item'), true));

  test("getContentChildNodes", () {
    expect(paperItem.getContentChildNodes()[1], $('paper-item div'));
  });

  test("getContentChildren",
      () => expect(paperItem.getContentChildren(), [$('paper-item div')]));

  group("get", () {
    test("", () => expect(paperItem.get('properties'), paperItem["properties"]));
    test("nonsense returns null", () => expect(paperItem.get('nonsense'), null));
  });

  group("customStyle && updateStyles", () {
    test("", () async {
      expect(paperItem.element.getComputedStyle().minHeight, "48px");
      paperItem.customStyle["--paper-item-min-height"] = "60px";
      paperItem.updateStyles();
      new Future(() {
        expect(paperItem.element.getComputedStyle().minHeight, "60px");
      });
    }, skip: "Bug in polymer js see https://github.com/Polymer/polymer/issues/1851.");

    test("workaround", () async {
      expect(paperItem.element.getComputedStyle().minHeight, "48px");
      paperItem.customStyle["--paper-item-min-height"] = "60px";
      Polymer.updateStyles();
      new Future(() {
        expect(paperItem.element.getComputedStyle().minHeight, "60px");
      });
    });
  });
  
  polymerElement = $$('iron-pages');
  drawerPanel = $$('paper-drawer-panel');

  test('behaviors', () => expect(polymerElement.behaviors.length, 2));
  test('listeners', () => expect(drawerPanel.listeners.length, 4));
  test('properties', () => expect(drawerPanel.properties.length, 16));
  test(r'$$', () {
    expect(drawerPanel.$$('div'), new isInstanceOf<DivElement>());
  });

}
