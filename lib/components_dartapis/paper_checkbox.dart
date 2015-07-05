library polymerjs.paper_checkbox;

import 'dart:html';
import 'package:polymerjs/polymer.dart';
import 'iron_a11y_keys_behavior.dart';
import 'iron_button_state.dart';
import 'iron_control_state.dart';
import 'paper_inky_focus_behavior.dart';

/// `paper-checkbox` is a button that can be either checked or unchecked.  User
/// can tap the checkbox to check or uncheck it.  Usually you use checkboxes
/// to allow user to select multiple options from a set.  If you have a single
/// ON/OFF option, avoid using a single checkbox and use `paper-toggle-button`
/// instead.
/// 
/// Example:
/// 
///     <paper-checkbox>label</paper-checkbox>
/// 
///     <paper-checkbox checked> label</paper-checkbox>
/// 
/// ### Styling
/// 
/// The following custom properties and mixins are available for styling:
/// 
/// Custom property | Description | Default
/// ----------------|-------------|----------
/// `--paper-checkbox-unchecked-color` | Checkbox color when the input is not checked | `--primary-text-color`
/// `--paper-checkbox-unchecked-ink-color` | Selected/focus ripple color when the input is not checked | `--primary-text-color`
/// `--paper-checkbox-checked-color` | Checkbox color when the input is checked | `--default-primary-color`
/// `--paper-checkbox-checked-ink-color` | Selected/focus ripple color when the input is checked | `--default-primary-color`
/// `--paper-checkbox-label-color` | Label color | `--primary-text-color`
/// 
class PaperCheckbox extends PolymerElement with IronA11yKeysBehavior, IronButtonState, IronControlState, PaperInkyFocusBehavior {
  PaperCheckbox() : super.tag('paper-checkbox');
  PaperCheckbox.from(HtmlElement element) : super.from(element);

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