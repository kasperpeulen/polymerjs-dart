@TestOn('browser')

// TODO make this work in safari...
library polymerjs.event_details_test;

import 'dart:html';
import 'dart:js';

import 'package:test/test.dart';

import 'package:polymerjs/polymer.dart';
import 'package:polymerjs/iron/iron_test_helpers.dart';
import 'dart:async';

void main() {
  Stream webComponentsReadyStream = window.on['WebComponentsReady'];
  PolymerElement eventListener;

  test("WebComponentsReady", () {
    // if webcomponents are not yet ready, wait until they are ready
    if (context["CustomElements"]["ready"] == null) {
      webComponentsReadyStream.listen(expectAsync(
              (_) => expect(context["CustomElements"]["ready"], isNotNull)));
    }
  });

  test('setup', () {
    Polymer.call({
      'is': 'event-listener',
      'listeners': {
        'tap': 'tap',
        'down': 'down',
        'up': 'up',
        'track': 'track'
      },
      'tap': (PolymerElement self, TapDetail e) {
        self['checkTypeDetail'] = e is TapDetail;
        self['checkTypeX'] = e.x is int;
        self['checkTypeY'] =  e.y is int;
        self.element.text = "I'm tapped!";
      },
      'down': (PolymerElement self, DownDetail e) {
        self['checkTypeDetail'] = e is DownDetail;
        self['checkTypeX'] = e.x is int;
        self['checkTypeY'] =  e.y is int;
        self.element.text = "I'm down!";
      },
      'up': (PolymerElement self, UpDetail e) {
        self['checkTypeDetail'] = e is UpDetail;
        self['checkTypeX'] = e.x is int;
        self['checkTypeY'] =  e.y is int;
        self.element.text = "I'm up!";
      },
      'track': (PolymerElement self, TrackDetail e) {
        self['checkTypeDetail'] = e is TrackDetail;
        self['checkTypeX'] = e.x is int;
        self['checkTypeY'] =  e.y is int;
        self.element.text = "I'm tracked at ${[e.ddx, e.ddy, e.state]}!";
      }
    });
    eventListener = new PolymerElement('event-listener')
      ..appendTo(document.body);
  });


  group('tap',(){
    test('text', () {
      MockInteractions.tap($('event-listener'));
      expect(eventListener.element.text, 'I\'m tapped!');
    });
    test('check type x', () {
      expect(eventListener['checkTypeX'], true);
    });
    test('check type y', () {
      expect(eventListener['checkTypeY'], true);
    });
    test('check type Detail', () {
      expect(eventListener['checkTypeDetail'], true);
    });
  });

  group('down',(){
    test('text', () {
      MockInteractions.down($('event-listener'));
      expect(eventListener.element.text, 'I\'m down!');
    });

    test('check type x', () {
      expect(eventListener['checkTypeX'], true);
    });

    test('check type y', () {
      expect(eventListener['checkTypeY'], true);
    });

    test('check type Detail', () {
      expect(eventListener['checkTypeDetail'], true);
    });
  });

  group('up',(){
    test('text', () {
      MockInteractions.up($('event-listener'));
      expect(eventListener.element.text, 'I\'m up!');
    });

    test('check type x', () {
      expect(eventListener['checkTypeX'], true);
    });

    test('check type y', () {
      expect(eventListener['checkTypeY'], true);
    });

    test('check type Detail', () {
      expect(eventListener['checkTypeDetail'], true);
    });
  });

  group('track',(){
    test('text', () {
      MockInteractions.track($('event-listener'));
      expect(eventListener.element.text, 'I\'m tracked at [0, 0, end]!');
    });

    test('check type x', () {
      expect(eventListener['checkTypeX'], true);
    });

    test('check type y', () {
      expect(eventListener['checkTypeY'], true);
    });

    test('check type Detail', () {
      expect(eventListener['checkTypeDetail'], true);
    });
  });
}

