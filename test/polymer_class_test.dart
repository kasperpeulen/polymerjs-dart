@TestOn('browser')
library polymerjs.polymer_class_test;

import 'dart:html';
import 'package:test/test.dart';
import 'package:polymerjs/polymer.dart';

class HelloWorld extends PolymerElement {
  HelloWorld() : super('hello-world');

  HelloWorld.from(HtmlElement element) : super.from(element);

  String get hello => this['hello'];
  void set hello(String value) {
    this['hello'] = value;
  }
}

void main() {
  test('Polymer.registerElement', () {
    var constructor = Polymer.Class({
      'is': 'hello-world',
      'properties': {
        'hello': String
      },
      'ready': (HelloWorld self) => self.hello = "Hello world!"
    });
    Polymer.registerElement(
        'hello-world', constructor, (e) => new HelloWorld.from(e));
    new HelloWorld()..appendTo(document.body);
    HelloWorld helloWorld = $$('hello-world');
    expect(helloWorld.hello, 'Hello world!');
  });
}

