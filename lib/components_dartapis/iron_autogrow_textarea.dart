library polymerjs.iron_autogrow_textarea;

import 'dart:html';
import 'package:polymerjs/polymer.dart';
import 'iron_validatable_behavior.dart';
import 'iron_control_state.dart';

/// `iron-autogrow-textarea` is an element containing a textarea that grows in height as more
/// lines of input are entered. Unless an explicit height or the `maxRows` property is set, it will
/// never scroll.
/// 
/// Example:
/// 
///     <iron-autogrow-textarea id="a1">
///       <textarea id="t1"></textarea>
///     </iron-autogrow-textarea>
/// 
/// Because the `textarea`'s `value` property is not observable, you should use
/// this element's `bind-value` instead for imperative updates.
/// 
class IronAutogrowTextarea extends PolymerElement with IronValidatableBehavior, IronControlState {
  IronAutogrowTextarea() : super.tag('iron-autogrow-textarea');
  IronAutogrowTextarea.from(HtmlElement element) : super.from(element);

  /// Use this property instead of `value` for two-way data binding.
  String get bindValue => js['bindValue'];
  /// Use this property instead of `value` for two-way data binding.
  set bindValue(String value) { js['bindValue'] = value; }

  /// The initial number of rows.
  /// 
  /// @default 1
  num get rows => js['rows'];
  /// The initial number of rows.
  /// 
  /// @default 1
  set rows(num value) { js['rows'] = value; }

  /// The maximum number of rows this element can grow to until it
  /// scrolls. 0 means no maximum.
  /// 
  /// @default 0
  num get maxRows => js['maxRows'];
  /// The maximum number of rows this element can grow to until it
  /// scrolls. 0 means no maximum.
  /// 
  /// @default 0
  set maxRows(num value) { js['maxRows'] = value; }

  /// Bound to the textarea's `autocomplete` attribute.
  /// 
  /// @default 'off'
  String get autocomplete => js['autocomplete'];
  /// Bound to the textarea's `autocomplete` attribute.
  /// 
  /// @default 'off'
  set autocomplete(String value) { js['autocomplete'] = value; }

  /// Bound to the textarea's `autofocus` attribute.
  /// 
  /// @default 'off'
  String get autofocus => js['autofocus'];
  /// Bound to the textarea's `autofocus` attribute.
  /// 
  /// @default 'off'
  set autofocus(String value) { js['autofocus'] = value; }

  /// Bound to the textarea's `inputmode` attribute.
  String get inputmode => js['inputmode'];
  /// Bound to the textarea's `inputmode` attribute.
  set inputmode(String value) { js['inputmode'] = value; }

  /// Bound to the textarea's `name` attribute.
  String get name => js['name'];
  /// Bound to the textarea's `name` attribute.
  set name(String value) { js['name'] = value; }

  /// Bound to the textarea's `placeholder` attribute.
  String get placeholder => js['placeholder'];
  /// Bound to the textarea's `placeholder` attribute.
  set placeholder(String value) { js['placeholder'] = value; }

  /// Bound to the textarea's `readonly` attribute.
  String get readonly => js['readonly'];
  /// Bound to the textarea's `readonly` attribute.
  set readonly(String value) { js['readonly'] = value; }

  /// Set to true to mark the textarea as required.
  bool get required => js['required'];
  /// Set to true to mark the textarea as required.
  set required(bool value) { js['required'] = value; }

  /// The maximum length of the input value.
  num get maxlength => js['maxlength'];
  /// The maximum length of the input value.
  set maxlength(num value) { js['maxlength'] = value; }

  /// Returns the underlying textarea.
  dynamic get textarea => js['textarea'];

}