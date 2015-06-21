library polymerjs.jsutils;

import 'dart:js';
import 'dart:html';

/// Add this class as mixin to your object. You need to implement the js field.
///
/// `object["jsproperty"]` will act like `object.js["jsproperty"]`
///
/// `object["jsfunction"](arg)` will act like `object.js.callMethod("jsfunction", [arg])`
abstract class JsMixin {
  JsObject js;

  dynamic operator [](String propertyName) {
    var property = js[propertyName];

    // if the property is a JsFunction, convert it to a dart function with a
    // maximum of 10 parameters, all parameters are optional
    if (property is JsFunction) {
      return ([p1, p2, p3, p4, p5, p6, p7, p8, p9, p10]) => js.callMethod(
          propertyName, [p1, p2, p3, p4, p5, p6, p7, p8, p9, p10]);
    }
    return property;
  }

  void operator []=(String propertyName, dynamic value) {
    js[propertyName] = value;
  }
}
