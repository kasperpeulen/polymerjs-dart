@TestOn('browser')
library polymerjs.iron_autogrow_textarea_test;

import "package:test/test.dart";
import 'dart:async';
import 'dart:js';
import 'dart:html';
import 'package:polymerjs/element_constructors.dart';


void main() {
  Stream stream = window.on['WebComponentsReady'];


  test("PolymerReady", () async {
    await Polymer.whenReady();
    expect(context["CustomElements"]["ready"], isNotNull);
  });

  group("iron-autogrow-textarea", () {
    test('setting bindValue sets textarea value', () {
      IronAutogrowTextarea autogrow = $$('#basic');
      var textarea = autogrow.textarea;
      autogrow.bindValue = 'batman';
      expect(textarea.value, autogrow.bindValue);
    });

    test('can set an initial bindValue', () {
      IronAutogrowTextarea autogrow = $$('#has-bindValue');
      expect(autogrow.textarea.value, 'foobar');
    });


    test('can set an initial number of rows', () {
      IronAutogrowTextarea autogrow = $$("#rows");
      expect(autogrow.textarea.rows, 3);
    });

    test('adding rows grows the textarea', () {
      IronAutogrowTextarea autogrow = $$('#basic');
      int initialHeight = autogrow.offsetHeight;

      autogrow.bindValue = 'batman\nand\nrobin';
      int finalHeight = autogrow.offsetHeight;
      expect(finalHeight > initialHeight, isTrue);
    });

    test('removing rows shrinks the textarea', () {
      IronAutogrowTextarea autogrow = $$('#basic');
      autogrow.bindValue = 'batman\nand\nrobin';
      int initialHeight = autogrow.offsetHeight;

      autogrow.bindValue = 'batman';
      int finalHeight = autogrow.offsetHeight;
      expect(finalHeight < initialHeight, isTrue);
    });
  });
}