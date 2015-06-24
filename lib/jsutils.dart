library polymerjs.jsutils;

import 'dart:js';
import 'dart:html';
import 'package:polymerjs/polymer.dart';
import 'package:polymerjs/event_details.dart';

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
  if (js is HtmlElement) {
    String name = js.tagName.toLowerCase();
    if (!name.contains("-") && js.getAttribute('is') == null) {
      return js;
    }
    if (constructorFromString.containsKey(name)) {
      return constructorFromString[name](js);
    }
    return new PolymerElement.from(js);
  }
  if (js is JsArray) {
    return js.map((item) => dartify(item)).toList();
  }
  if (js is JsFunction) {
    if (dartTypeFromJs.containsKey(js)) {
      return dartTypeFromJs[js];
    }
    return functionFromJs(js);
  }
  if (js is CustomEvent){
    if (js.type == "track") {
      return new TrackDetail(new JsObject.fromBrowserObject(js)["detail"], js);
    }
    if (js.type == "tap") {
      return new TapDetail(new JsObject.fromBrowserObject(js)["detail"], js);
    }
    if (js.type == 'down') {
      return new DownDetail(new JsObject.fromBrowserObject(js)["detail"], js);
    }
    if (js.type == 'up') {
      return new UpDetail(new JsObject.fromBrowserObject(js)["detail"], js);
    }
    return js;
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

dynamic jsify(Object dartObject) {
  if (dartObject == null) {
    return null;
  } else if (dartObject is JsObject) {
    return dartObject;
  } else if (dartObject is List) {
    return new JsArray.from(dartObject.map((item) => jsify(item)));
  } else if (dartObject is Map<String, dynamic>) {
    JsObject jsObject = new JsObject(context["Object"]);
    dartObject.forEach((key, value) {
      jsObject[key] = jsify(value);
    });
    return jsObject;
  } else if (dartObject is Type) {
    return jsTypeFromDart[dartObject];
  } else if (dartObject is Function) {
    return new JsFunction.withThis((HtmlElement element,
                                    [p1, p2, p3, p4, p5, p6, p7, p8, p9, p10]) {
      List args = [element, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10];
      args.removeWhere((e) => e == null);
      args = args.map(dartify).toList();
      while (argCount(dartObject) < args.length) {
        args.removeLast();
      }
      while (argCount(dartObject) > args.length) {
        args.add(null);
      }
      return Function.apply(dartObject, args);
    });
  }
  return dartObject;
}

int argCount(Function f) {
  if (f is Func0) return 0;
  if (f is Func1) return 1;
  if (f is Func2) return 2;
  if (f is Func3) return 3;
  if (f is Func4) return 4;
  if (f is Func5) return 5;
  if (f is Func6) return 6;
  if (f is Func7) return 7;
  if (f is Func7) return 8;
  if (f is Func7) return 9;
  if (f is Func7) return 10;
  throw 'not supported for more that 10 args';
}
typedef Func0();
typedef Func1(p1);
typedef Func2(p1,p2);
typedef Func3(p1,p2,p3);
typedef Func4(p1,p2,p3,p4);
typedef Func5(p1,p2,p3,p4,p5);
typedef Func6(p1,p2,p3,p4,p6);
typedef Func7(p1,p2,p3,p4,p6,p7);
typedef Func8(p1,p2,p3,p4,p6,p7,p8);
typedef Func9(p1,p2,p3,p4,p6,p7,p8,p9);
typedef Func10(p1,p2,p3,p4,p6,p7,p8,p9,p10);

HtmlElement htmlElementFromJsElement(JsObject jsHTMLElement) {
  context['hack_to_convert_jsobject_to_html_element'] = jsHTMLElement;
  Element element = context['hack_to_convert_jsobject_to_html_element'];
  context.deleteProperty('hack_to_convert_jsobject_to_html_element');
  return element;
}

