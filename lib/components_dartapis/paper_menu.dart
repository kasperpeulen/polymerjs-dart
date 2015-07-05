library polymerjs.paper_menu;

import 'dart:html';
import 'package:polymerjs/polymer.dart';
import 'iron_selectable_behavior.dart';
import 'iron_multi_selectable_behavior.dart';
import 'iron_a11y_keys_behavior.dart';
import 'iron_menu_behavior.dart';

/// `<paper-menu>` implements an accessible menu control with Material Design styling. The focused item
/// is highlighted, and the selected item has bolded text.
/// 
///     <paper-menu>
///       <paper-item>Item 1</paper-item>
///       <paper-item>Item 2</paper-item>
///     </paper-menu>
/// 
/// Make a multi-select menu with the `multi` attribute. Items in a multi-select menu can be deselected,
/// and multiple item can be selected.
/// 
///     <paper-menu multi>
///       <paper-item>Item 1</paper-item>
///       <paper-item>Item 2</paper-item>
///     </paper-menu>
/// 
/// ### Styling
/// 
/// The following custom properties and mixins are available for styling:
/// 
/// Custom property | Description | Default
/// ----------------|-------------|----------
/// `--paper-menu-background-color`   | Menu background color                                            | `--primary-background-color`
/// `-paper-menu-color`               | Menu foreground color                                            | `--primary-text-color`
/// `--paper-menu-disabled-color`     | Foreground color for a disabled item                             | `--disabled-text-color`
/// `--paper-menu`                    | Mixin applied to the menu                                        | `{}`
/// `--paper-menu-selected-item`      | Mixin applied to the selected item                               | `{}`
/// `--paper-menu-focused-item`       | Mixin applied to the focused item                                | `{}`
/// `--paper-menu-focused-item-after` | Mixin applied to the ::after pseudo-element for the focused item | `{}`
/// 
/// ### Accessibility
/// 
/// `<paper-menu>` has `role="menu"` by default. A multi-select menu will also have
/// `aria-multiselectable` set. It implements key bindings to navigate through the menu with the up and
/// down arrow keys, esc to exit the menu, and enter to activate a menu item. Typing the first letter
/// of a menu item will also focus it.
/// 
class PaperMenu extends PolymerElement with IronSelectableBehavior, IronMultiSelectableBehavior, IronA11yKeysBehavior, IronMenuBehavior {
  PaperMenu() : super.tag('paper-menu');
  PaperMenu.from(HtmlElement element) : super.from(element);

}