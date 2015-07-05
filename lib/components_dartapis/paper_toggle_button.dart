library polymerjs.paper_toggle_button;

import 'dart:html';
import 'package:polymerjs/polymer.dart';
import 'iron_a11y_keys_behavior.dart';
import 'iron_button_state.dart';
import 'iron_control_state.dart';
import 'paper_inky_focus_behavior.dart';

/// `paper-toggle-button` provides a ON/OFF switch that user can toggle the state
/// by tapping or by dragging the switch.
/// 
/// Example:
/// 
///     <paper-toggle-button></paper-toggle-button>
/// 
/// ### Styling
/// 
/// The following custom properties and mixins are available for styling:
/// 
/// Custom property | Description | Default
/// ----------------|-------------|----------
/// `--paper-toggle-button-unchecked-bar-color` | Slider color when the input is not checked | `#000000`
/// `--paper-toggle-button-unchecked-button-color` | Button color when the input is not checked | `--paper-grey-50`
/// `--paper-toggle-button-unchecked-ink-color` | Selected/focus ripple color when the input is not checked | `--dark-primary-color`
/// `--paper-toggle-button-checked-bar-color` | Slider button color when the input is checked | `--google-green-500`
/// `--paper-toggle-button-checked-button-color` | Button color when the input is checked | `--google-green-500`
/// `--paper-toggle-button-checked-ink-color` | Selected/focus ripple color when the input is checked | `--google-green-500`
/// 
class PaperToggleButton extends PolymerElement with IronA11yKeysBehavior, IronButtonState, IronControlState, PaperInkyFocusBehavior {
  PaperToggleButton() : super.tag('paper-toggle-button');
  PaperToggleButton.from(HtmlElement element) : super.from(element);

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