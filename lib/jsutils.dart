library polymerjs.jsutils;

import 'dart:js';
import 'dart:html';
import 'package:polymerjs/polymer.dart';

/// Add this class as mixin to your object. You need to implement the js field.
///
/// `object['jsproperty']` will act like `object.js['jsproperty']`
///
/// `object['jsfunction'](arg)` will act like `object.js.callMethod('jsfunction', [arg])`
abstract class JsMixin {
  JsObject js;

  dynamic operator [](String propertyName) {
    var property = js[propertyName];

    // if the property is a JsFunction, convert it to a dart function with a
    // maximum of 10 parameters, all parameters are optional
    if (property is JsFunction) {
      return functionFromJs(property, thisArg: js);
    }
    return property;
  }

  void operator []=(String propertyName, dynamic value) {
    js[propertyName] = value;
  }
}

dynamic dartify(js) {
  if (js is JsArray) {
    return js.map((item) => dartify(item)).toList();
  }
  if (js is JsFunction) {
    if (dartTypeFromJs.containsKey(js)) {
      return dartTypeFromJs[js];
    }
    return functionFromJs(js);
  }
  if (js is JsObject) {
    if (js['constructor'] != context['Object']) return js;
    var dartMap = {};
    var keys = context['Object'].callMethod('keys', [js]);
    for (var key in keys) {
      dartMap[key] = dartify(js[key]);
    }
    return dartMap;
  }
  return js;
}

Function functionFromJs(JsFunction jsFunction, {thisArg}) {
  return ([p1, p2, p3, p4, p5, p6, p7, p8, p9, p10]) {
    return jsFunction.apply([p1, p2, p3, p4, p5, p6, p7, p8, p9, p10],
        thisArg: thisArg);
  };
}

Map<Type, JsFunction> jsTypeFromDart = {
  int: context['Number'],
  double: context['Number'],
  num: context['Number'],
  bool: context["Boolean"],
  String: context["String"],
  List: context["Array"],
  DateTime: context["DateTime"],
  Map: context["Object"],
  JsObject: context["Object"],
  Function: context["JsFunction"]
};

Map<JsFunction, Type> dartTypeFromJs = {
  context['Number']: num,
  context["Boolean"]: bool,
  context["String"]: String,
  context["Array"]: List,
  context["DateTime"]: DateTime,
  context["Object"]: Map,
  context["JsFunction"]: Function
};
