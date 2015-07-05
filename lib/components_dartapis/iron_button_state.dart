library polymerjs.iron_button_state;

import 'dart:js';

abstract class IronButtonState {
  JsObject js;

  /// If true, the user is currently holding down the button.
  /// 
  /// @reflectToAttribute
  /// 
  /// @readOnly
  /// 
  /// @default false
  bool get pressed => js['pressed'];

  /// If true, the button toggles the active state with each tap or press
  /// of the spacebar.
  /// 
  /// @reflectToAttribute
  /// 
  /// @default false
  bool get toggles => js['toggles'];
  /// If true, the button toggles the active state with each tap or press
  /// of the spacebar.
  /// 
  /// @reflectToAttribute
  /// 
  /// @default false
  set toggles(bool value) { js['toggles'] = value; }

  /// If true, the button is a toggle and is currently in the active state.
  /// 
  /// @reflectToAttribute
  /// 
  /// @notify
  /// 
  /// @default false
  bool get active => js['active'];
  /// If true, the button is a toggle and is currently in the active state.
  /// 
  /// @reflectToAttribute
  /// 
  /// @notify
  /// 
  /// @default false
  set active(bool value) { js['active'] = value; }

  /// True if the element is currently being pressed by a "pointer," which
  /// is loosely defined as mouse or touch input (but specifically excluding
  /// keyboard input).
  /// 
  /// @readOnly
  /// 
  /// @default false
  bool get pointerDown => js['pointerDown'];

  /// True if the input device that caused the element to receive focus
  /// was a keyboard.
  /// 
  /// @readOnly
  bool get receivedFocusFromKeyboard => js['receivedFocusFromKeyboard'];

}