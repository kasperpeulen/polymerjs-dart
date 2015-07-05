library polymerjs.iron_control_state;

import 'dart:js';

abstract class IronControlState {
  JsObject js;

  /// If true, the element currently has focus.
  /// 
  /// @reflectToAttribute
  /// 
  /// @notify
  /// 
  /// @readOnly
  /// 
  /// @default false
  bool get focused => js['focused'];

  /// If true, the user cannot interact with this element.
  /// 
  /// @reflectToAttribute
  /// 
  /// @notify
  /// 
  /// @default false
  bool get disabled => js['disabled'];
  /// If true, the user cannot interact with this element.
  /// 
  /// @reflectToAttribute
  /// 
  /// @notify
  /// 
  /// @default false
  set disabled(bool value) { js['disabled'] = value; }

}