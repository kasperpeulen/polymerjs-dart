library polymerjs.iron_resizable_behavior;

import 'dart:html';
import 'package:polymerjs/jsutils.dart';
import 'dart:js';

/// `IronResizableBehavior` is a behavior that can be used in Polymer elements to
/// coordinate the flow of resize events between "resizers" (elements that control the
/// size or hidden state of their children) and "resizables" (elements that need to be
/// notified when they are resized or un-hidden by their parents in order to take
/// action on their new measurements).
/// Elements that perform measurement should add the `IronResizableBehavior` behavior to
/// their element definition and listen for the `iron-resize` event on themselves.
/// This event will be fired when they become showing after having been hidden,
/// when they are resized explicitly by another resizable, or when the window has been
/// resized.
/// Note, the `iron-resize` event is non-bubbling.
abstract class IronResizableBehavior {
  JsObject js;

  /// The closest ancestor element that implements `IronResizableBehavior`.
  Map get parentResizable => dartify(js['_parentResizable']);
  /// The closest ancestor element that implements `IronResizableBehavior`.
  set parentResizable(Map value) { js['_parentResizable'] = jsify(value); }

  /// True if this element is currently notifying its descedant elements of
  /// resize.
  /// 
  /// @default false
  bool get notifyingDescendant => js['_notifyingDescendant'];
  /// True if this element is currently notifying its descedant elements of
  /// resize.
  /// 
  /// @default false
  set notifyingDescendant(bool value) { js['_notifyingDescendant'] = value; }

  /// Can be called to manually notify a resizable and its descendant
  /// resizables of a resize change.
  void notifyResize() => js.callMethod('notifyResize', []);

  /// Used to assign the closest resizable ancestor to this resizable
  /// if the ancestor detects a request for notifications.
  void assignParentResizable(parentResizable) => js.callMethod('assignParentResizable', [parentResizable]);

  /// Used to remove a resizable descendant from the list of descendants
  /// that should be notified of a resize change.
  void stopResizeNotificationsFor(target) => js.callMethod('stopResizeNotificationsFor', [target]);

  /// This method can be overridden to filter nested elements that should or
  /// should not be notified by the current element. Return true if an element
  /// should be notified, or false if it should not be notified.
  /// @param {HTMLElement} element A candidate descendant element that
  /// implements `IronResizableBehavior`.
  /// @return {boolean} True if the `element` should be notified of resize.
  bool resizerShouldNotify(HtmlElement element) => js.callMethod('resizerShouldNotify', [element]);

}