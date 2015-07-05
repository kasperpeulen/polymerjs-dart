library polymerjs.iron_iconset_svg;

import 'dart:html';
import 'package:polymerjs/polymer.dart';

class IronIconsetSvg extends PolymerElement {
  IronIconsetSvg() : super.tag('iron-iconset-svg');
  IronIconsetSvg.from(HtmlElement element) : super.from(element);

  /// The name of the iconset.
  String get name => js['name'];
  /// The name of the iconset.
  set name(String value) { js['name'] = value; }

  /// The size of an individual icon. Note that icons must be square.
  /// 
  /// @default 24
  num get size => js['size'];
  /// The size of an individual icon. Note that icons must be square.
  /// 
  /// @default 24
  set size(num value) { js['size'] = value; }

  /// Construct an array of all icon names in this iconset.
  /// @return {!Array} Array of icon names.
  dynamic getIconNames() => js.callMethod('getIconNames', []);

  /// Applies an icon to the given element.
  /// An svg icon is prepended to the element's shadowRoot if it exists,
  /// otherwise to the element itself.
  /// @param {Element} element Element to which the icon is applied.
  /// @param {string} iconName Name of the icon to apply.
  /// @return {Element} The svg element which renders the icon.
  Element applyIcon(Element element, String iconName) => js.callMethod('applyIcon', [element, iconName]);

  /// Remove an icon from the given element by undoing the changes effected
  /// by `applyIcon`.
  /// @param {Element} element The element from which the icon is removed.
  void removeIcon(Element element) => js.callMethod('removeIcon', [element]);

  /// When name is changed, register iconset metadata
  void nameChanged() => js.callMethod('_nameChanged', []);

  /// Create a map of child SVG elements by id.
  /// @return {!Object} Map of id's to SVG elements.
  dynamic createIconMap() => js.callMethod('_createIconMap', []);

  /// Produce installable clone of the SVG element matching `id` in this
  /// iconset, or `undefined` if there is no matching element.
  /// @return {Element} Returns an installable clone of the SVG element
  /// matching `id`.
  Element cloneIcon(id) => js.callMethod('_cloneIcon', [id]);

  /// @param {Element} sourceSvg
  /// @param {number} size
  /// @return {Element}
  Element prepareSvgClone(Element sourceSvg, num size) => js.callMethod('_prepareSvgClone', [sourceSvg, size]);

}