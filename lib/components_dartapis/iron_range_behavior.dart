library polymerjs.iron_range_behavior;

import 'dart:js';

/// `iron-range-behavior` provides the behavior for something with a minimum to maximum range.
abstract class IronRangeBehavior {
  JsObject js;

  /// The number that represents the current value.
  /// 
  /// @reflectToAttribute
  /// 
  /// @notify
  /// 
  /// @default 0
  num get value => js['value'];
  /// The number that represents the current value.
  /// 
  /// @reflectToAttribute
  /// 
  /// @notify
  /// 
  /// @default 0
  set value(num value) { js['value'] = value; }

  /// The number that indicates the minimum value of the range.
  /// 
  /// @notify
  /// 
  /// @default 0
  num get min => js['min'];
  /// The number that indicates the minimum value of the range.
  /// 
  /// @notify
  /// 
  /// @default 0
  set min(num value) { js['min'] = value; }

  /// The number that indicates the maximum value of the range.
  /// 
  /// @notify
  /// 
  /// @default 100
  num get max => js['max'];
  /// The number that indicates the maximum value of the range.
  /// 
  /// @notify
  /// 
  /// @default 100
  set max(num value) { js['max'] = value; }

  /// Specifies the value granularity of the range's value.
  /// 
  /// @notify
  /// 
  /// @default 1
  num get step => js['step'];
  /// Specifies the value granularity of the range's value.
  /// 
  /// @notify
  /// 
  /// @default 1
  set step(num value) { js['step'] = value; }

  /// Returns the ratio of the value.
  /// 
  /// @notify
  /// 
  /// @readOnly
  /// 
  /// @default 0
  num get ratio => js['ratio'];

}