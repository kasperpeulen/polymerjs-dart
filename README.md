# polymerjs-dart

This package provides a thin wrapper for polymer.js 1.0. The syntax is very close
to polymer.js:

```dart
import 'package:polymerjs/polymer.dart';

void main() {
  Polymer.call({
    'is': 'hello-world',
    'ready': (PolymerElement self) {
      self.text = "Hello world";
    }
  });
  new PolymerElement('hello-world')
    ..appendTo(document.body);
}
```

There are many other examples in the [polymerjs_examples directory](https://github.com/kasperpeulen/polymerjs-dart/tree/master/polymerjs_examples).

##Roadmap

* 0.1.0: Making it possible to create polymer custom-elements, with a very light wrapper
* 0.2.0: Porting all paper and iron elements
* 0.3.0: Providing other ways to create custom elements. Maybe some syntax like:

```dart
  new Polymer(
    is: 'hello-world',
    properties: {
      'hello' : new Property(
        type: String,
        value: "hello world"
      )
    },
    ready: ... etc
  );
```
