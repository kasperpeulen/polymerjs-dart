library polymerjs.iron_validatable_behavior;

import 'dart:js';

/// Use `Polymer.IronValidatableBehavior` to implement an element that validates user input.
/// 
/// ### Accessiblity
/// 
/// Changing the `invalid` property, either manually or by calling `validate()` will update the
/// `aria-invalid` attribute.
abstract class IronValidatableBehavior {
  JsObject js;

  /// Namespace for this validator.
  /// 
  /// @default 'validator'
  String get validatorType => js['validatorType'];
  /// Namespace for this validator.
  /// 
  /// @default 'validator'
  set validatorType(String value) { js['validatorType'] = value; }

  /// Name of the validator to use.
  String get validator => js['validator'];
  /// Name of the validator to use.
  set validator(String value) { js['validator'] = value; }

  /// True if the last call to `validate` is invalid.
  /// 
  /// @reflectToAttribute
  /// 
  /// @notify
  /// 
  /// @default false
  bool get invalid => js['invalid'];
  /// True if the last call to `validate` is invalid.
  /// 
  /// @reflectToAttribute
  /// 
  /// @notify
  /// 
  /// @default false
  set invalid(bool value) { js['invalid'] = value; }

  void hasValidator() => js.callMethod('hasValidator', []);

  /// @param {Object} values Passed to the validator's `validate()` function.
  void validate(Map values) => js.callMethod('validate', [values]);

}