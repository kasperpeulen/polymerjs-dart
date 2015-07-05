import 'package:polymerjs/element_constructors.dart';

void main() {
  new PaperItem()
    ..text = "hello world"
    ..appendTo(document.body);

  PaperToolbar toolbar = new PaperToolbar()..appendTo(document.body);

  toolbar.on('tap').listen((e) {
    print(1);
  });

  Polymer.dom(toolbar.element).append(new SpanElement()
    ..text = "hello"
    ..classes.add('title'));
  toolbar.justify = 'end';

  PaperMaterial material = $$('paper-material');

  material.text = "a";
}
