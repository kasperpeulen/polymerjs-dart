import 'dart:html';

// TODO add a couple of the most common used properties and methods here

abstract class HtmlElementMixin {
  HtmlElement element;

  dynamic operator [](String propertyName);

  void operator []=(String propertyName, dynamic value);

  /// This property returns a CssStyleDeclaration object that
  /// represents the element's style attribute.
  CssStyleDeclaration get style => element.style;

   /// The set of CSS classes applied to this element.
   ///
   /// This set makes it easy to add, remove or toggle the classes applied to
   /// this element.
   ///
   /// <pre><code>
   ///     element.classes.add('selected');
   ///     element.classes.toggle('isOnline');
   ///     element.classes.remove('selected');
   /// </code></pre>
  CssClassSet get classes => element.classes;

  /// All text within this node and its decendents.
  ///
  /// See also: [Node.textContent](https://developer.mozilla.org/en-US/docs/Web/API/Node.textContent) from MDN.
  String get text => element.text;

  /**
   * All attributes on this element.
   *
   * Any modifications to the attribute map will automatically be applied to
   * this element.
   *
   * This only includes attributes which are not in a namespace
   * (such as 'xlink:href'), additional attributes can be accessed via
   * [getNamespacedAttributes].
   */
  Map<String, String> get attributes => element.attributes;

   /// All text within this node and its decendents.
   ///
   /// See also: [Node.textContent](https://developer.mozilla.org/en-US/docs/Web/API/Node.textContent) from MDN.
  set text(String value) => element.text = value;

  /// The id property represents the element's identifier, reflecting the id
  /// global attribute.
  ///
  /// It must be unique in a document, and is often used to retrieve the element.
  /// Other common usages of id include using the element's ID as a selector when
  /// styling the document with CSS.
  String get id => element.id;

  /// The id property represents the element's identifier, reflecting the id
  /// global attribute.
  ///
  /// It must be unique in a document, and is often used to retrieve the element.
  /// Other common usages of id include using the element's ID as a selector when
  /// styling the document with CSS.
  set id(String value) => element.id = value;

  /// The innerHTML property gets the HTML syntax describing the element's
  /// descendants.
  String get innerHtml => element.innerHtml;

  /// For setting the innerHtml, the native dom `innerHTML` property is used.
  /// see this bug: https://github.com/dart-lang/sdk/issues/23666
  void set innerHtml(String html) {
    this["innerHTML"] = html;
  }

  /**
   * The set of all CSS values applied to this element, including inherited
   * and default values.
   *
   * The computedStyle contains values that are inherited from other
   * sources, such as parent elements or stylesheets. This differs from the
   * [style] property, which contains only the values specified directly on this
   * element.
   *
   * See also:
   *
   * * [CSS Inheritance and Cascade](http://docs.webplatform.org/wiki/tutorials/inheritance_and_cascade)
   * * [Pseudo-elements](http://docs.webplatform.org/wiki/css/selectors/pseudo-elements)
   */
  CssStyleDeclaration get computedStyle => element.getComputedStyle();

  /// The offsetHeight read-only property is the height of the element including
  /// vertical padding and borders, in pixels, as an integer.
  int get offsetHeight => element.offsetHeight;

  /**
   * Adds a node to the end of the child [nodes] list of this node.
   *
   * If the node already exists in this document, it will be removed from its
   * current parent node, then added to this node.
   *
   * This method is more efficient than `nodes.add`, and is the preferred
   * way of appending a child node.
   */
  Node append(Node newChild) => element.append(newChild);
}
