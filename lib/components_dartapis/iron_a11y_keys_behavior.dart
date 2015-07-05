library polymerjs.iron_a11y_keys_behavior;

import 'dart:js';
import 'package:polymerjs/jsutils.dart';

/// `Polymer.IronA11yKeysBehavior` provides a normalized interface for processing
/// keyboard commands that pertain to [WAI-ARIA best practices](http:www.w3.orgTRwai-aria-practices#kbd_general_binding).
/// The element takes care of browser differences with respect to Keyboard events
/// and uses an expressive syntax to filter key presses.
/// 
/// Use the `keyBindings` prototype property to express what combination of keys
/// will trigger the event to fire.
/// 
/// Use the `key-event-target` attribute to set up event handlers on a specific
/// node.
/// The `keys-pressed` event will fire when one of the key combinations set with the
/// `keys` property is pressed.
abstract class IronA11yKeysBehavior {
  JsObject js;

  /// The HTMLElement that will be firing relevant KeyboardEvents.
  Map get keyEventTarget => dartify(js['keyEventTarget']);
  /// The HTMLElement that will be firing relevant KeyboardEvents.
  set keyEventTarget(Map value) { js['keyEventTarget'] = jsify(value); }

  /// Can be used to imperatively add a key binding to the implementing
  /// element. This is the imperative equivalent of declaring a keybinding
  /// in the `keyBindings` prototype property.
  void addOwnKeyBinding(eventString, handlerName) => js.callMethod('addOwnKeyBinding', [eventString, handlerName]);

  /// When called, will remove all imperatively-added key bindings.
  void removeOwnKeyBindings() => js.callMethod('removeOwnKeyBindings', []);

}