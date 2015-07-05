library polymerjs.paper_radio_button;

import 'dart:html';
import 'package:polymerjs/polymer.dart';
import 'iron_a11y_keys_behavior.dart';
import 'iron_button_state.dart';
import 'iron_control_state.dart';
import 'paper_inky_focus_behavior.dart';

/// `paper-radio-button` is a button that can be either checked or unchecked.
/// User can tap the radio button to check it.  But it cannot be unchecked by
/// tapping once checked.
/// 
/// Use `paper-radio-group` to group a set of radio buttons.  When radio buttons
/// are inside a radio group, only one radio button in the group can be checked.
/// 
/// Example:
/// 
///     <paper-radio-button></paper-radio-button>
/// 
/// ### Styling
/// 
/// The following custom properties and mixins are available for styling:
/// 
/// Custom property | Description | Default
/// ----------------|-------------|----------
/// `--paper-radio-button-unchecked-color` | Radio button color when the input is not checked | `--primary-text-color`
/// `--paper-radio-button-unchecked-ink-color` | Selected/focus ripple color when the input is not checked | `--primary-text-color`
/// `--paper-radio-button-checked-color` | Radio button color when the input is checked | `--default-primary-color`
/// `--paper-radio-button-checked-ink-color` | Selected/focus ripple color when the input is checked | `--default-primary-color`
/// `--paper-radio-button-label-color` | Label color | `--primary-text-color`
/// 
class PaperRadioButton extends PolymerElement with IronA11yKeysBehavior, IronButtonState, IronControlState, PaperInkyFocusBehavior {
  PaperRadioButton() : super.tag('paper-radio-button');
  PaperRadioButton.from(HtmlElement element) : super.from(element);

  /// Gets or sets the state, `true` is checked and `false` is unchecked.
  /// 
  /// @reflectToAttribute
  /// 
  /// @notify
  /// 
  /// @default false
  bool get checked => js['checked'];
  /// Gets or sets the state, `true` is checked and `false` is unchecked.
  /// 
  /// @reflectToAttribute
  /// 
  /// @notify
  /// 
  /// @default false
  set checked(bool value) { js['checked'] = value; }

  /// If true, the button toggles the active state with each tap or press
  /// of the spacebar.
  /// 
  /// @reflectToAttribute
  /// 
  /// @default true
  bool get toggles => js['toggles'];
  /// If true, the button toggles the active state with each tap or press
  /// of the spacebar.
  /// 
  /// @reflectToAttribute
  /// 
  /// @default true
  set toggles(bool value) { js['toggles'] = value; }

}