@TestOn('browser')
library polymerjs.polymer_call_test;

import 'dart:html';
import 'package:test/test.dart';
import 'package:polymerjs/polymer.dart';

void main() {
  test('setting text in ready', () {
    Polymer.call({
      'is': 'hello-world',
      'ready': (PolymerElement self) {
        self.element.text = "Hello world";
      }
    });
    new PolymerElement('hello-world')..appendTo(document.body);
    expect($$('hello-world').element.text, 'Hello world');
  });

  test('setting innerHtml in ready', () {
    Polymer.call({
      'is': 'hello-world2',
      'ready': (PolymerElement self) {
        self.element.innerHtml = "Hello world";
      }
    });
    new PolymerElement('hello-world2')..appendTo(document.body);
    expect($$('hello-world2').element.innerHtml, 'Hello world');
  }, skip: "fails see https://github.com/dart-lang/sdk/issues/23666");

  test('custom constructor', () {
    var CustomConstructor = Polymer.call({
      'is': 'custom-constructor',
      'factoryImpl': (self, foo, bar) {
        self['foo'] = foo;
        self['configureWithBar']('bar');
      },
      'configureWithBar': (self, bar) {
        self['bar'] = bar;
      }
    });
    new PolymerElement.fromConstructor(CustomConstructor, ['foo', 'bar'])
      ..appendTo(document.body);
    expect($$('custom-constructor')['foo'], 'foo');
    expect($$('custom-constructor')['bar'], 'bar');
  });

  test('input type extension', () {
    var MyInput = Polymer.call({
      "is": "extend-input",
      "extends": "input",
      "created": (PolymerElement self) {
        self.element.style.border = "1px solid red";
      }
    });

    var el1 = new PolymerElement.fromConstructor(MyInput)
      ..appendTo(document.body);
    expect(el1.element, new isInstanceOf<InputElement>());
    expect(el1.element.style.border, "1px solid red");

    var el2 = new PolymerElement('input', 'extend-input')
      ..appendTo(document.body);
    expect(el2.element, new isInstanceOf<InputElement>());
    expect(el2.element.style.border, "1px solid red");
  });

  test('dart class', () {
    Polymer.registerDartClass(
        'hello-world3', (element) => new HelloWorld3.from(element));
    Polymer.call({
      'is': 'hello-world3',
      'properties': {
        'hello': String
      },
      'ready': (HelloWorld3 self) {
        self.hello = 'Hello world 3!';
      }
    });

    new HelloWorld3()..appendTo(document.body);
    HelloWorld3 helloWorld = $$('hello-world3');
    expect(helloWorld.hello, 'Hello world 3!');
  });
}

class HelloWorld3 extends PolymerElement {
  HelloWorld3() : super('hello-world3');

  HelloWorld3.from(HtmlElement element) : super.from(element);

  String get hello => this['hello'];
  void set hello(String value) {
    this['hello'] = value;
  }
}
