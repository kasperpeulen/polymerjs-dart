library polymerjs.polymer;

import 'dart:js';
import 'dart:html';

import 'package:polymerjs/polymerdom.dart';
export 'package:polymerjs/polymerdom.dart';

class Polymer extends Object {
  static final JsObject js = context['Polymer'];

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
}

/// Finds the first descendant element of this document that matches the
/// specified group of selectors.
HtmlElement $(String selectors) => querySelector(selectors);
