library polymerjs.paper_fab;

import 'dart:html';
import 'package:polymerjs/polymer.dart';
import 'iron_a11y_keys_behavior.dart';
import 'iron_button_state.dart';
import 'iron_control_state.dart';
import 'paper_button_behavior.dart';

/// Material Design: <a href="http://www.google.com/design/spec/components/buttons.html">Button</a>
/// 
/// `paper-fab` is a floating action button. It contains an image placed in the center and
/// comes in two sizes: regular size and a smaller size by applying the attribute `mini`. When
/// the user touches the button, a ripple effect emanates from the center of the button.
/// 
/// You may import `iron-icons` to use with this element, or provide a URL to a custom icon.
/// See `iron-iconset` for more information about how to use a custom icon set.
/// 
/// Example:
/// 
///     <link href="path/to/iron-icons/iron-icons.html" rel="import">
/// 
///     <paper-fab icon="add"></paper-fab>
///     <paper-fab mini icon="favorite"></paper-fab>
///     <paper-fab src="star.png"></paper-fab>
/// 
/// 
/// ### Styling
/// 
/// The following custom properties and mixins are available for styling:
/// 
/// Custom property | Description | Default
/// ----------------|-------------|----------
/// `--paper-fab-background` | The background color of the button | `--accent-color`
/// `--paper-fab-keyboard-focus-background` | The background color of the button when focused | `--paper-pink-900`
/// `--paper-fab-disabled-background` | The background color of the button when it's disabled | `--paper-grey-300`
/// `--paper-fab-disabled-text` | The text color of the button when it's disabled | `--paper-grey-500`
/// `--paper-fab` | Mixin applied to the button | `{}`
/// `--paper-fab-mini` | Mixin applied to a mini button | `{}`
/// `--paper-fab-disabled` | Mixin applied to a disabled button | `{}`
/// 
class PaperFab extends PolymerElement with IronA11yKeysBehavior, IronButtonState, IronControlState, PaperButtonBehavior {
  PaperFab() : super.tag('paper-fab');
  PaperFab.from(HtmlElement element) : super.from(element);

  /// The URL of an image for the icon. If the src property is specified,
  /// the icon property should not be.
  /// 
  /// @default ''
  String get src => js['src'];
  /// The URL of an image for the icon. If the src property is specified,
  /// the icon property should not be.
  /// 
  /// @default ''
  set src(String value) { js['src'] = value; }

  /// Specifies the icon name or index in the set of icons available in
  /// the icon's icon set. If the icon property is specified,
  /// the src property should not be.
  /// 
  /// @default ''
  String get icon => js['icon'];
  /// Specifies the icon name or index in the set of icons available in
  /// the icon's icon set. If the icon property is specified,
  /// the src property should not be.
  /// 
  /// @default ''
  set icon(String value) { js['icon'] = value; }

  /// Set this to true to style this is a "mini" FAB.
  /// 
  /// @default false
  bool get mini => js['mini'];
  /// Set this to true to style this is a "mini" FAB.
  /// 
  /// @default false
  set mini(bool value) { js['mini'] = value; }

}