library polymerjs.paper_input_behavior;

import 'dart:js';

/// Use `Polymer.PaperInputBehavior` to implement inputs with `<paper-input-container>`. This
/// behavior is implemented by `<paper-input>`. It exposes a number of properties from
/// `<paper-input-container>` and `<input is="iron-input">` and they should be bound in your
/// template.
/// 
/// The input element can be accessed by the `inputElement` property if you need to access
/// properties or methods that are not exposed.
abstract class PaperInputBehavior {
  JsObject js;

  /// The label for this input. Bind this to `<paper-input-container>`'s `label` property.
  String get label => js['label'];
  /// The label for this input. Bind this to `<paper-input-container>`'s `label` property.
  set label(String value) { js['label'] = value; }

  /// The value for this input. Bind this to the `<input is="iron-input">`'s `bindValue`
  /// property, or the value property of your input that is `notify:true`.
  /// 
  /// @notify
  String get value => js['value'];
  /// The value for this input. Bind this to the `<input is="iron-input">`'s `bindValue`
  /// property, or the value property of your input that is `notify:true`.
  /// 
  /// @notify
  set value(String value) { js['value'] = value; }

  /// Set to true to disable this input. Bind this to both the `<paper-input-container>`'s
  /// and the input's `disabled` property.
  /// 
  /// @default false
  bool get disabled => js['disabled'];
  /// Set to true to disable this input. Bind this to both the `<paper-input-container>`'s
  /// and the input's `disabled` property.
  /// 
  /// @default false
  set disabled(bool value) { js['disabled'] = value; }

  /// Returns true if the value is invalid. Bind this to both the `<paper-input-container>`'s
  /// and the input's `invalid` property.
  /// 
  /// @default false
  bool get invalid => js['invalid'];
  /// Returns true if the value is invalid. Bind this to both the `<paper-input-container>`'s
  /// and the input's `invalid` property.
  /// 
  /// @default false
  set invalid(bool value) { js['invalid'] = value; }

  /// Set to true to prevent the user from entering invalid input. Bind this to the
  /// `<input is="iron-input">`'s `preventInvalidInput` property.
  bool get preventInvalidInput => js['preventInvalidInput'];
  /// Set to true to prevent the user from entering invalid input. Bind this to the
  /// `<input is="iron-input">`'s `preventInvalidInput` property.
  set preventInvalidInput(bool value) { js['preventInvalidInput'] = value; }

  /// Set this to specify the pattern allowed by `preventInvalidInput`. Bind this to the
  /// `<input is="iron-input">`'s `allowedPattern` property.
  String get allowedPattern => js['allowedPattern'];
  /// Set this to specify the pattern allowed by `preventInvalidInput`. Bind this to the
  /// `<input is="iron-input">`'s `allowedPattern` property.
  set allowedPattern(String value) { js['allowedPattern'] = value; }

  /// The type of the input. The supported types are `text`, `number` and `password`. Bind this
  /// to the `<input is="iron-input">`'s `type` property.
  String get type => js['type'];
  /// The type of the input. The supported types are `text`, `number` and `password`. Bind this
  /// to the `<input is="iron-input">`'s `type` property.
  set type(String value) { js['type'] = value; }

  /// The datalist of the input (if any). This should match the id of an existing <datalist>. Bind this
  /// to the `<input is="iron-input">`'s `list` property.
  String get list => js['list'];
  /// The datalist of the input (if any). This should match the id of an existing <datalist>. Bind this
  /// to the `<input is="iron-input">`'s `list` property.
  set list(String value) { js['list'] = value; }

  /// A pattern to validate the `input` with. Bind this to the `<input is="iron-input">`'s
  /// `pattern` property.
  String get pattern => js['pattern'];
  /// A pattern to validate the `input` with. Bind this to the `<input is="iron-input">`'s
  /// `pattern` property.
  set pattern(String value) { js['pattern'] = value; }

  /// Set to true to mark the input as required. Bind this to the `<input is="iron-input">`'s
  /// `required` property.
  /// 
  /// @default false
  bool get required => js['required'];
  /// Set to true to mark the input as required. Bind this to the `<input is="iron-input">`'s
  /// `required` property.
  /// 
  /// @default false
  set required(bool value) { js['required'] = value; }

  /// The maximum length of the input value. Bind this to the `<input is="iron-input">`'s
  /// `maxlength` property.
  num get maxlength => js['maxlength'];
  /// The maximum length of the input value. Bind this to the `<input is="iron-input">`'s
  /// `maxlength` property.
  set maxlength(num value) { js['maxlength'] = value; }

  /// The error message to display when the input is invalid. Bind this to the
  /// `<paper-input-error>`'s content, if using.
  String get errorMessage => js['errorMessage'];
  /// The error message to display when the input is invalid. Bind this to the
  /// `<paper-input-error>`'s content, if using.
  set errorMessage(String value) { js['errorMessage'] = value; }

  /// Set to true to show a character counter.
  /// 
  /// @default false
  bool get charCounter => js['charCounter'];
  /// Set to true to show a character counter.
  /// 
  /// @default false
  set charCounter(bool value) { js['charCounter'] = value; }

  /// Set to true to disable the floating label. Bind this to the `<paper-input-container>`'s
  /// `noLabelFloat` property.
  /// 
  /// @default false
  bool get noLabelFloat => js['noLabelFloat'];
  /// Set to true to disable the floating label. Bind this to the `<paper-input-container>`'s
  /// `noLabelFloat` property.
  /// 
  /// @default false
  set noLabelFloat(bool value) { js['noLabelFloat'] = value; }

  /// Set to true to always float the label. Bind this to the `<paper-input-container>`'s
  /// `alwaysFloatLabel` property.
  /// 
  /// @default false
  bool get alwaysFloatLabel => js['alwaysFloatLabel'];
  /// Set to true to always float the label. Bind this to the `<paper-input-container>`'s
  /// `alwaysFloatLabel` property.
  /// 
  /// @default false
  set alwaysFloatLabel(bool value) { js['alwaysFloatLabel'] = value; }

  /// Set to true to auto-validate the input value. Bind this to the `<paper-input-container>`'s
  /// `autoValidate` property.
  /// 
  /// @default false
  bool get autoValidate => js['autoValidate'];
  /// Set to true to auto-validate the input value. Bind this to the `<paper-input-container>`'s
  /// `autoValidate` property.
  /// 
  /// @default false
  set autoValidate(bool value) { js['autoValidate'] = value; }

  /// Name of the validator to use. Bind this to the `<input is="iron-input">`'s `validator`
  /// property.
  String get validator => js['validator'];
  /// Name of the validator to use. Bind this to the `<input is="iron-input">`'s `validator`
  /// property.
  set validator(String value) { js['validator'] = value; }

  /// Bind this to the `<input is="iron-input">`'s `autocomplete` property.
  /// 
  /// @default 'off'
  String get autocomplete => js['autocomplete'];
  /// Bind this to the `<input is="iron-input">`'s `autocomplete` property.
  /// 
  /// @default 'off'
  set autocomplete(String value) { js['autocomplete'] = value; }

  /// Bind this to the `<input is="iron-input">`'s `autofocus` property.
  bool get autofocus => js['autofocus'];
  /// Bind this to the `<input is="iron-input">`'s `autofocus` property.
  set autofocus(bool value) { js['autofocus'] = value; }

  /// Bind this to the `<input is="iron-input">`'s `inputmode` property.
  String get inputmode => js['inputmode'];
  /// Bind this to the `<input is="iron-input">`'s `inputmode` property.
  set inputmode(String value) { js['inputmode'] = value; }

  /// Bind this to the `<input is="iron-input">`'s `minlength` property.
  num get minlength => js['minlength'];
  /// Bind this to the `<input is="iron-input">`'s `minlength` property.
  set minlength(num value) { js['minlength'] = value; }

  /// Bind this to the `<input is="iron-input">`'s `name` property.
  String get name => js['name'];
  /// Bind this to the `<input is="iron-input">`'s `name` property.
  set name(String value) { js['name'] = value; }

  /// A placeholder string in addition to the label. If this is set, the label will always float.
  /// 
  /// @default ''
  String get placeholder => js['placeholder'];
  /// A placeholder string in addition to the label. If this is set, the label will always float.
  /// 
  /// @default ''
  set placeholder(String value) { js['placeholder'] = value; }

  /// Bind this to the `<input is="iron-input">`'s `readonly` property.
  /// 
  /// @default false
  bool get readonly => js['readonly'];
  /// Bind this to the `<input is="iron-input">`'s `readonly` property.
  /// 
  /// @default false
  set readonly(bool value) { js['readonly'] = value; }

  /// Bind this to the `<input is="iron-input">`'s `size` property.
  num get size => js['size'];
  /// Bind this to the `<input is="iron-input">`'s `size` property.
  set size(num value) { js['size'] = value; }

  /// Returns a reference to the input element.
  dynamic get inputElement => js['inputElement'];

  /// Validates the input element and sets an error style if needed.
  void validate() => js.callMethod('validate', []);

  /// Restores the cursor to its original position after updating the value.
  /// @param {string} newValue The value that should be saved.
  void updateValueAndPreserveCaret(String newValue) => js.callMethod('updateValueAndPreserveCaret', [newValue]);

}