/// Finds the first descendant element of this document that matches the
/// specified group of selectors.

import 'dart:html';
import 'package:polymerjs/polymer.dart';

/// This is a shortcut for `querySelector`.
///
/// Finds the first descendant element of this document that matches the
/// specified group of selectors.
HtmlElement $(String selectors) => querySelector(selectors);

/// This is a shortcut for `new PolymerElement.from(querySelector(...))`.
///
/// If the custom element is associated with a special dart class that extends
/// `PolymerElement`, then the constructor of that class will be used.
///
/// Finds the first descendant element of this document that matches the
/// specified group of selectors.
WebElement $$(String selectors) {
  HtmlElement element = $(selectors);
  if (element == null) {
    return null;
  }
  String name = element.tagName.toLowerCase();
  // if element is not a custom element, return a web element
  if (!name.contains("-") && element.getAttribute('is') == null) {
    return new WebElement.from(element);
  }
  // search for a specific constructor
  if (constructorFromString.containsKey(name)) {
    return constructorFromString[name](element);
  }
  return new PolymerElement.from(element);
}
