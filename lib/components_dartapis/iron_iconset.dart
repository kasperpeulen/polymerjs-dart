library polymerjs.iron_iconset;

import 'dart:html';
import 'package:polymerjs/jsutils.dart';
import 'package:polymerjs/polymer.dart';

/// The `iron-iconset` element allows users to define their own icon sets.
/// The `src` property specifies the url of the icon image. Multiple icons may
/// be included in this image and they may be organized into rows.
/// The `icons` property is a space separated list of names corresponding to the
/// icons. The names must be ordered as the icons are ordered in the icon image.
/// Icons are expected to be square and are the size specified by the `size`
/// property. The `width` property corresponds to the width of the icon image
/// and must be specified if icons are arranged into multiple rows in the image.
/// 
/// All `iron-iconset` elements are available for use by other `iron-iconset`
/// elements via a database keyed by id. Typically, an element author that wants
/// to support a set of custom icons uses a `iron-iconset` to retrieve
/// and use another, user-defined iconset.
/// 
/// Example:
/// 
///     <iron-iconset id="my-icons" src="my-icons.png" width="96" size="24"
///         icons="location place starta stopb bus car train walk">
///     </iron-iconset>
/// 
/// This will automatically register the icon set "my-icons" to the iconset
/// database.  To use these icons from within another element, make a
/// `iron-iconset` element and call the `byId` method to retrieve a
/// given iconset. To apply a particular icon to an element, use the
/// `applyIcon` method. For example:
/// 
///     iconset.applyIcon(iconNode, 'car');
/// 
/// Themed icon sets are also supported. The `iron-iconset` can contain child
/// `property` elements that specify a theme with an offsetX and offsetY of the
/// theme within the icon resource. For example.
/// 
///     <iron-iconset id="my-icons" src="my-icons.png" width="96" size="24"
///         icons="location place starta stopb bus car train walk">
///       <property theme="special" offsetX="256" offsetY="24"></property>
///     </iron-iconset>
/// 
/// Then a themed icon can be applied like this:
/// 
///     iconset.applyIcon(iconNode, 'car', 'special');
/// 
class IronIconset extends PolymerElement {
  IronIconset() : super.tag('iron-iconset');
  IronIconset.from(HtmlElement element) : super.from(element);

  /// The URL of the iconset image.
  String get src => js['src'];
  /// The URL of the iconset image.
  set src(String value) { js['src'] = value; }

  /// The name of the iconset.
  String get name => js['name'];
  /// The name of the iconset.
  set name(String value) { js['name'] = value; }

  /// The width of the iconset image. This must only be specified if the
  /// icons are arranged into separate rows inside the image.
  /// 
  /// @default 0
  num get width => js['width'];
  /// The width of the iconset image. This must only be specified if the
  /// icons are arranged into separate rows inside the image.
  /// 
  /// @default 0
  set width(num value) { js['width'] = value; }

  /// A space separated list of names corresponding to icons in the iconset
  /// image file. This list must be ordered the same as the icon images
  /// in the image file.
  String get icons => js['icons'];
  /// A space separated list of names corresponding to icons in the iconset
  /// image file. This list must be ordered the same as the icon images
  /// in the image file.
  set icons(String value) { js['icons'] = value; }

  /// The size of an individual icon. Note that icons must be square.
  /// 
  /// @default 24
  num get size => js['size'];
  /// The size of an individual icon. Note that icons must be square.
  /// 
  /// @default 24
  set size(num value) { js['size'] = value; }

  /// The horizontal offset of the icon images in the inconset src image.
  /// This is typically used if the image resource contains additional images
  /// beside those intended for the iconset.
  /// 
  /// @default 0
  num get offsetX => js['_offsetX'];
  /// The horizontal offset of the icon images in the inconset src image.
  /// This is typically used if the image resource contains additional images
  /// beside those intended for the iconset.
  /// 
  /// @default 0
  set offsetX(num value) { js['_offsetX'] = value; }

  /// The vertical offset of the icon images in the inconset src image.
  /// This is typically used if the image resource contains additional images
  /// beside those intended for the iconset.
  /// 
  /// @default 0
  num get offsetY => js['_offsetY'];
  /// The vertical offset of the icon images in the inconset src image.
  /// This is typically used if the image resource contains additional images
  /// beside those intended for the iconset.
  /// 
  /// @default 0
  set offsetY(num value) { js['_offsetY'] = value; }

  /// Array of fully-qualified names of icons in this set.
  /// 
  /// @notify
  List get iconNames => js['iconNames'];
  /// Array of fully-qualified names of icons in this set.
  /// 
  /// @notify
  set iconNames(List value) { js['iconNames'] = value; }

  /// Applies an icon to the given element as a css background image. This
  /// method does not size the element, and it's usually necessary to set
  /// the element's height and width so that the background image is visible.
  /// @param {Element} element The element to which the icon is applied.
  /// @param {StringNumber} icon The name or index of the icon to apply.
  /// @param {String} theme (optional) The name or index of the icon to apply.
  /// @param {Number} scale (optional, defaults to 1) Icon scaling factor.
  void applyIcon(Element element, dynamic icon, String theme, num scale) => js.callMethod('applyIcon', [element, icon, theme, scale]);

  /// Remove an icon from the given element by undoing the changes effected
  /// by `applyIcon`.
  /// @param {Element} element The element from which the icon is removed.
  void removeIcon(Element element) => js.callMethod('removeIcon', [element]);

  /// Returns an object containing `offsetX` and `offsetY` properties which
  /// specify the pixel location in the iconset's src file for the given
  /// `icon` and `theme`. It's uncommon to call this method. It is useful,
  /// for example, to manually position a css backgroundImage to the proper
  /// offset. It's more common to use the `applyIcon` method.
  /// @param {StringNumber} identifier The name of the icon or the index of
  /// the icon within in the icon image.
  /// @param {String} theme The name of the theme.
  /// @returns {Object} An object specifying the offset of the given icon
  /// within the icon resource file; `offsetX` is the horizontal offset and
  /// `offsetY` is the vertical offset. Both values are in pixel units.
  Map getThemedOffset(dynamic identifier, String theme) => dartify(js.callMethod('_getThemedOffset', [identifier, theme]));

}