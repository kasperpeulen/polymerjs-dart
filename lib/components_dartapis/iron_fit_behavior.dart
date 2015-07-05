library polymerjs.iron_fit_behavior;

import 'dart:js';
import 'package:polymerjs/jsutils.dart';

/// Polymer.IronFitBehavior fits an element in another element using `max-height` and `max-width`, and
/// optionally centers it in the window or another element.
/// 
/// The element will only be sized andor positioned if it has not already been sized andor positioned
/// by CSS.
/// 
/// CSS properties                Action
/// ------------------------------------------------------------------------
/// `position` set                Element is not centered horizontally or vertically
/// `top` or `bottom` set         Element is not vertically centered
/// `left` or `right` set         Element is not horizontally centered
/// `max-height` or `height` set  Element respects `max-height` or `height`
/// `max-width` or `width` set    Element respects `max-width` or `width`
abstract class IronFitBehavior {
  JsObject js;

  /// The element that will receive a `max-height``width`. By default it is the same as `this`,
  /// but it can be set to a child element. This is useful, for example, for implementing a
  /// scrolling region inside the element.
  Map get sizingTarget => dartify(js['sizingTarget']);
  /// The element that will receive a `max-height``width`. By default it is the same as `this`,
  /// but it can be set to a child element. This is useful, for example, for implementing a
  /// scrolling region inside the element.
  set sizingTarget(Map value) { js['sizingTarget'] = jsify(value); }

  /// The element to fit `this` into.
  /// 
  /// @default window
  Map get fitInto => dartify(js['fitInto']);
  /// The element to fit `this` into.
  /// 
  /// @default window
  set fitInto(Map value) { js['fitInto'] = jsify(value); }

  /// Set to true to auto-fit on attach.
  /// 
  /// @default false
  bool get autoFitOnAttach => js['autoFitOnAttach'];
  /// Set to true to auto-fit on attach.
  /// 
  /// @default false
  set autoFitOnAttach(bool value) { js['autoFitOnAttach'] = value; }

  Map get fitInfo => dartify(js['_fitInfo']);
  set fitInfo(Map value) { js['_fitInfo'] = jsify(value); }

  /// Fits and optionally centers the element into the window, or `fitInfo` if specified.
  void fit() => js.callMethod('fit', []);

  /// Memoize information needed to position and size the target element.
  void discoverInfo() => js.callMethod('_discoverInfo', []);

  /// Resets the target element's position and size constraints, and clear
  /// the memoized data.
  void resetFit() => js.callMethod('resetFit', []);

  /// Equivalent to calling `resetFit()` and `fit()`. Useful to call this after the element,
  /// the window, or the `fitInfo` element has been resized.
  void refit() => js.callMethod('refit', []);

  /// Constrains the size of the element to the window or `fitInfo` by setting `max-height`
  /// andor `max-width`.
  void constrain() => js.callMethod('constrain', []);

  /// Centers horizontally and vertically if not already positioned. This also sets
  /// `position:fixed`.
  void center() => js.callMethod('center', []);

}