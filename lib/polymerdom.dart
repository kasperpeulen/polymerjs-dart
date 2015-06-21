library polymerjs.polymerdom;

import 'dart:js';
import 'dart:html';

import 'package:polymerjs/jsutils.dart';
import 'package:polymerjs/polymer.dart';

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
class PolymerDom extends Object with JsMixin {
  final JsObject js;

  final Node node;

  /// The insert, append, and remove operations are transacted lazily in certain
  /// cases for performance. In order to interrogate the dom (e.g. offsetHeight,
  /// getComputedStyle, etc.) immediately after one of these operations, call
  /// PolymerDom.flush() first.
  static void flush() => context["Polymer"]["dom"].callMethod("flush");

  PolymerDom(node)
      : js = Polymer.js.callMethod('dom', [node]),
        this.node = node;

  /// Calling appendChild where the parent is a custom Polymer element adds the
  /// node to the light DOM of the element.
  ///
  /// In order to append into the shadow root of a custom element, use
  /// `this.root` as the parent.
  ///
  /// The appendChild method is transacted lazily in certain cases for
  /// performance. In order to interrogate the dom (e.g. offsetHeight,
  /// getComputedStyle, etc.) immediately after one of these operations, call
  /// PolymerDom.flush() first.
  Node appendChild(node) => this['appendChild'](node);

  /// Read-only property that returns a live list of child nodes of the given element.
  ///
  /// The list also includes e.g. text nodes and comments. To skip them, use
  /// `this.children` instead.
  List<Node> get childNodes => this['childNodes'];

  /// Read-only property that returns a live `List` of the child elements of
  /// `this`. The list doesn't include text nodes and comments.
  List<HtmlElement> get children => this['children'];

  // TODO: add docs
  PolymerClassList get classList => new PolymerClassList(this);

  /// Read-only property that returns the node's first child in the tree, or
  /// null if the node is childless.
  Node get firstChild => this["firstChild"];

  /// Read-only property that returns the object's first child Element, or null
  /// if there are no child elements.
  HtmlElement get firstElementChild => this["firstElementChild"];

  /// Sometimes it’s necessary to access the elements which have been distributed
  /// to a given <content> insertion point or to know to which <content> a given
  /// node has been distributed. The getDistributedNodes and
  /// getDestinationInsertionPoints methods, respectively, provide this information.
  List<Node> getDestinationInsertionPoints() =>
      this["getDestinationInsertionPoints"]();

  /// Sometimes it’s necessary to access the elements which have been distributed
  /// to a given <content> insertion point or to know to which <content> a given
  /// node has been distributed. The getDistributedNodes and
  /// getDestinationInsertionPoints methods, respectively, provide this information.
  List<Node> getDistributedNodes() => this["getDistributedNodes"]();

  // TODO: find out what this does
  getOwnerRoot() => this["getOwnerRoot"]();

  /// Sets or gets the HTML syntax describing the element's descendants.
  String get innerHTML => this["innerHTML"];
  /// Sets or gets the HTML syntax describing the element's descendants.
  void set innerHTML(String value) {
    this["innerHTML"] = value;
  }

  /// Calling `insertBefore` where parent is a custom Polymer element adds the
  /// node to the light DOM of the element.
  ///
  /// In order to insert into the shadow root of a custom element, use
  /// `this.root` as the parent.
  ///
  /// The insertBefore method is transacted lazily in certain cases for
  /// performance. In order to interrogate the dom (e.g. offsetHeight,
  /// getComputedStyle, etc.) immediately after one of these operations, call
  /// PolymerDom.flush() first.
  ///
  /// [node] The node to insert
  ///
  /// [refNode] the reference node to insert [node] before
  /// If [refNode] is null, this method wil act like `this.appendChild(node)`.
  Node insertBefore(Node node, [Node refNode]) =>
      this["insertBefore"](node, refNode);

  /// Read-only property that returns the last child of the node. If its parent
  /// is an element, then the child is generally an element node, a text node,
  /// or a comment node. It returns null if there are no child elements.
  Node get lastChild => this["lastChild"];

  /// Read-only property  that returns the object's last child `Element` or null
  /// if there are no child elements.
  HtmlElement get lastElementChild => this["lastElementChild"];

  /// Read-only property that returns the node immediately following the specified
  /// one in its parent's childNodes list, or null if the specified node is the
  /// last node in that list.
  Node get nextSibling => this["nextSibling"];

  /// Read-only property returns the element immediately following the specified
  /// one in its parent's children list, or null if the specified element is the
  /// last one in the list.
  HtmlElement get nextElementSibling => this["nextElementSibling"];

  /// Read-only property that returns the parent of the specified node in the
  /// DOM tree.
  Node get parentNode => this["parentNode"];

  /// Read-only property returns the Element immediately prior to the specified
  /// one in its parent's children list, or null if the specified element is the
  /// first one in the list.
  HtmlElement get previousElementSibling => this["previousElementSibling"];

  /// Read-only property that returns the node immediately preceding the specified
  /// one in its parent's childNodes list, or null if the specified node is the
  /// first in that list.
  Node get previousSibling => this["previousSibling"];

  /// Returns a list of nodes distributed within this element. These can be
  /// dom children or elements distributed to children that are insertion
  /// points.
  List<HtmlElement> queryDistributedElements(String selectors) =>
      this["queryDistributedElements"](selectors);

  /// Returns the first element within the document that matches the specified
  /// group of selectors.
  HtmlElement querySelector(String selectors) =>
      this["querySelector"](selectors);

  /// Returns a non-live NodeList of all elements descended from the element on
  /// which it is invoked that match the specified group of CSS selectors.
  List<HtmlElement> querySelectorAll(String selectors) =>
      this["querySelectorAll"](selectors);

  /// Removes an attribute from the the element.
  void removeAttribute(String name) => this["removeAttribute"](name);

  /// Removes the given `node` from the element's `lightChildren`.
  /// This method also performs dom composition.
  ///
  /// The removeChild method is transacted lazily in certain cases for
  /// performance. In order to interrogate the dom (e.g. offsetHeight,
  /// getComputedStyle, etc.) immediately after one of these operations, call
  /// PolymerDom.flush() first.
  Node removeChild(Node node) => this["removeChild"](node);

  /// Replaces one child node of the specified element with another.
  Node replaceChild(Node newChild, Node oldChild) =>
      this["replaceChild"](newChild, oldChild);

  /// Adds a new attribute or changes the value of an existing attribute on the
  /// element.
  void setAttribute(String name, String value) =>
      this["setAttribute"](name, value);

  /// Represents the text content of a node and its descendants.
  String get textContent => this["textContent"];
  /// Represents the text content of a node and its descendants.
  void set textContent(String value) {
    this["textContent"] = value;
  }
}

// TODO: add docs
class PolymerClassList extends Object with JsMixin {
  final PolymerDom domApi;

  final HtmlElement node;

  final JsObject js;

  PolymerClassList(PolymerDom host)
      : domApi = host,
        node = host.node,
        js = host["classList"];

  /// Adds a class to an element's list of classes. If [value] already exists in
  /// the element's list of classes, it will not add the class again.
  add(String value) => this["add"](value);

  /// Adds a list of classes to an element's list of classes. If a class already
  /// exists in the element's list of classes, it will not add the class again.
  addAll(Iterable<String> values) => js.callMethod("add", values);

  /// Removes a class from an element's list of classes. If class does not
  /// exist in the element's list of classes, it will not throw an error or
  /// exception.
  remove(String value) => this["remove"](value);

  /// Toggles the existence of a class in an element's list of classes. If
  /// [shouldAdd] is true, this method will act the same as `this.add`.
  toggle(String value, [bool shouldAdd]) => this["toggle"](value, shouldAdd);
}
