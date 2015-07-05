library polymerjs.iron_multi_selectable_behavior;

import 'dart:js';

abstract class IronMultiSelectableBehavior {
  JsObject js;

  /// If true, multiple selections are allowed.
  /// 
  /// @default false
  /// 
  /// @observer 'multiChanged'
  bool get multi => js['multi'];
  /// If true, multiple selections are allowed.
  /// 
  /// @default false
  /// 
  /// @observer 'multiChanged'
  set multi(bool value) { js['multi'] = value; }

  /// Gets or sets the selected elements. This is used instead of `selected` when `multi`
  /// is true.
  /// 
  /// @notify
  List get selectedValues => js['selectedValues'];
  /// Gets or sets the selected elements. This is used instead of `selected` when `multi`
  /// is true.
  /// 
  /// @notify
  set selectedValues(List value) { js['selectedValues'] = value; }

  /// Returns an array of currently selected items.
  /// 
  /// @notify
  /// 
  /// @readOnly
  List get selectedItems => js['selectedItems'];

  /// Selects the given value. If the `multi` property is true, then the selected state of the
  /// `value` will be toggled; otherwise the `value` will be selected.
  /// @param {string} value the value to select.
  void select(String value) => js.callMethod('select', [value]);

}