library polymerjs.polymer;

import 'dart:js';
import 'dart:html';

import 'package:polymerjs/jsutils.dart';
import 'package:polymerjs/polymerdom.dart';
import 'package:polymerjs/polymerbase.dart';
import 'package:polymerjs/html_element_mixin.dart';
import 'package:polymerjs/element_constructors.dart';
import 'dart:async';

export 'package:polymerjs/polymerdom.dart';
export 'package:polymerjs/dollar_functions.dart';
export 'package:polymerjs/event_details.dart';

typedef PolymerElement DartConstructor(HtmlElement element);

class Polymer extends Object {
  static final JsObject js = context['Polymer'];

  static void registerDartClass(String tagName, DartConstructor constructor) {
    tagName = tagName.toLowerCase();
    elementConstructors[tagName] = (element) => constructor(element);
  }

  static void registerElement(String tagName, JsFunction jsConstructor,
      [DartConstructor constructor]) {
    if (constructor != null) {
      registerDartClass(tagName, constructor);
    }
    new JsObject.fromBrowserObject(document).callMethod(
        'registerElement', [tagName, jsConstructor]);
  }

  static JsObject HTMLImports = context['HTMLImports'];

  /**
   * Return a `Future` that completes when Polymer element registration is
   * finished.
   */
  static Future whenReady() {
    Completer completer = new Completer();
    HTMLImports.callMethod('whenReady', [completer.complete]);
    return completer.future;
  }

  // TODO more tests
  static JsFunction call(Map constructor) =>
      context.callMethod("Polymer", [jsify(constructor)]);

  static JsFunction Class(Map constructor) =>
      context["Polymer"].callMethod("Class", [jsify(constructor)]);

  /// Polymer provides a custom API for manipulating DOM such that local DOM and
  /// light DOM trees are properly maintained. These methods and properties have
  /// the same signatures as their standard DOM equivalents, except that properties
  /// and methods that return a list of nodes return an Array, not a NodeList.
  ///
  /// Note: All DOM manipulation must use this API, as opposed to DOM API directly
  /// on nodes.
  ///
  /// Using these node mutation APIs when manipulating children ensures that
  /// shady DOM can distribute content elements dynamically. If you change
  /// attributes or classes that could affect distribution without using the
  /// Polymer.dom API, call distributeContent on the host element to force it
  /// to update its distribution.
  ///
  /// Other resources: https://www.polymer-project.org/1.0/docs/devguide/local-dom.html
  static PolymerDom dom(Node node) => new PolymerDom(node);

  /// Re-evaluates and applies custom CSS properties based on dynamic changes,
  /// such as adding or removing classes in this element's local DOM.
  static updateStyles() => context["Polymer"].callMethod("updateStyles");
}

class WebElement extends Object with JsMixin, HtmlElementMixin {
  final HtmlElement element;

  JsObject js;

  WebElement(String tag, [String typeExtension])
      : this.from(new Element.tag(tag, typeExtension));

  // This is needed to avoid the following issue:
  // https://github.com/dart-lang/sdk/issues/23661
  WebElement.tag(String tag) : this(tag);
  WebElement.extension(String tag, String typeExtension)
      : this(tag, typeExtension);

  WebElement.from(this.element) {
    js = new JsObject.fromBrowserObject(element);
  }

  WebElement.fromJsObject(JsObject jsHTMLElement) :
      this.from(htmlElementFromJsElement(jsHTMLElement));

  void appendTo(HtmlElement parent) {
    parent.append(element);
  }

  bool hasAttribute(String name) => element.attributes.containsKey(name);

  void toggleAttribute(String name, [bool value]) {
    if (value == null) value = !element.attributes.containsKey(name);

    if (value) {
      element.setAttribute(name, '');
    } else {
      element.attributes.remove(name);
    }
  }

  String getAttribute(String name) => element.getAttribute(name);

  void setAttribute(String name, [String value = '']) =>
      element.setAttribute(name, value);

  String clearAttribute(String name) => element.attributes.remove(name);
}

class PolymerElement extends WebElement with PolymerBase {

  Map<String, Stream> _eventStreams = {};

  PolymerElement(String tag, [String typeExtension])
      : super.extension(tag, typeExtension);

  PolymerElement.from(HtmlElement element) : super.from(element);

  PolymerElement.fromConstructor(JsFunction constructor, [List args])
      : super.fromJsObject(new JsObject(constructor, args));

  // This is needed to avoid the following issue:
  // https://github.com/dart-lang/sdk/issues/23661
  PolymerElement.tag(String tag) : this(tag);
  PolymerElement.extension(String tag, String typeExtension)
      : this(tag, typeExtension);

  Stream on(String eventName, {Function converter, bool sync: false}) {
    if (!_eventStreams.containsKey(eventName)) {
      StreamController controller = new StreamController.broadcast(sync: sync);
      _eventStreams[eventName] = controller.stream;
      element.on[eventName].listen((e) {
        controller.add(converter == null ? e : converter(e));
      });
    }

    return _eventStreams[eventName];
  }

  Stream get onTap => on('tap');

  Stream get onDown => on('down');


  @override
  dynamic operator [](String propertyName) {
    var property = js[propertyName];
    if (propertyName.contains(".")) {
      property = get(propertyName);
    }
    if (property is JsFunction) {
      return functionFromJs(property, thisArg: js);
    }
    return property;
  }

  @override
  void operator []=(String propertyName, dynamic value) {
    if (propertyName.contains(".")) {
      set(propertyName, value);
    } else {
      js[propertyName] = value;
    }
  }

  dynamic get root => this["root"];

  Map<String, HtmlElement> get $ => this[r'$'];

  /// The user can directly modify a Polymer element's custom style property by
  /// setting key-value pairs in `customStyle` on the element and then calling
  /// `updateStyles.
  JsObject get customStyle => this["customStyle"];
}
