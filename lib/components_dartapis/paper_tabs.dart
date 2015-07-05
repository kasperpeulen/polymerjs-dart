library polymerjs.paper_tabs;

import 'dart:html';
import 'package:polymerjs/polymer.dart';
import 'iron_resizable_behavior.dart';
import 'iron_menu_behavior.dart';
import 'iron_menubar_behavior.dart';

/// `paper-tabs` makes it easy to explore and switch between different views or functional aspects of
/// an app, or to browse categorized data sets.
/// 
/// Use `selected` property to get or set the selected tab.
/// 
/// Example:
/// 
///     <paper-tabs selected="0">
///       <paper-tab>TAB 1</paper-tab>
///       <paper-tab>TAB 2</paper-tab>
///       <paper-tab>TAB 3</paper-tab>
///     </paper-tabs>
/// 
/// See <a href="#paper-tab">paper-tab</a> for more information about
/// `paper-tab`.
/// 
/// A common usage for `paper-tabs` is to use it along with `iron-pages` to switch
/// between different views.
/// 
///     <paper-tabs selected="{{selected}}">
///       <paper-tab>Tab 1</paper-tab>
///       <paper-tab>Tab 2</paper-tab>
///       <paper-tab>Tab 3</paper-tab>
///     </paper-tabs>
/// 
///     <iron-pages selected="{{selected}}">
///       <div>Page 1</div>
///       <div>Page 2</div>
///       <div>Page 3</div>
///     </iron-pages>
/// 
/// 
/// To use links in tabs, add `link` attribute to `paper-tab` and put an `<a>`
/// element in `paper-tab`.
/// 
/// Example:
/// 
///     <paper-tabs selected="0">
///       <paper-tab link>
///         <a href="#link1" class="horizontal center-center layout">TAB ONE</a>
///       </paper-tab>
///       <paper-tab link>
///         <a href="#link2" class="horizontal center-center layout">TAB TWO</a>
///       </paper-tab>
///       <paper-tab link>
///         <a href="#link3" class="horizontal center-center layout">TAB THREE</a>
///       </paper-tab>
///     </paper-tabs>
/// 
/// ### Styling
/// 
/// The following custom properties and mixins are available for styling:
/// 
/// Custom property | Description | Default
/// ----------------|-------------|----------
/// `--paper-tabs-selection-bar-color` | Color for the selection bar | `--paper-yellow-a100`
/// `--paper-tabs` | Mixin applied to the tabs | `{}`
/// 
class PaperTabs extends PolymerElement with IronResizableBehavior, IronMenuBehavior, IronMenubarBehavior {
  PaperTabs() : super.tag('paper-tabs');
  PaperTabs.from(HtmlElement element) : super.from(element);

  /// If true, ink ripple effect is disabled.
  /// 
  /// @default false
  bool get noink => js['noink'];
  /// If true, ink ripple effect is disabled.
  /// 
  /// @default false
  set noink(bool value) { js['noink'] = value; }

  /// If true, the bottom bar to indicate the selected tab will not be shown.
  /// 
  /// @default false
  bool get noBar => js['noBar'];
  /// If true, the bottom bar to indicate the selected tab will not be shown.
  /// 
  /// @default false
  set noBar(bool value) { js['noBar'] = value; }

  /// If true, the slide effect for the bottom bar is disabled.
  /// 
  /// @default false
  bool get noSlide => js['noSlide'];
  /// If true, the slide effect for the bottom bar is disabled.
  /// 
  /// @default false
  set noSlide(bool value) { js['noSlide'] = value; }

  /// If true, tabs are scrollable and the tab width is based on the label width.
  /// 
  /// @default false
  bool get scrollable => js['scrollable'];
  /// If true, tabs are scrollable and the tab width is based on the label width.
  /// 
  /// @default false
  set scrollable(bool value) { js['scrollable'] = value; }

  /// If true, dragging on the tabs to scroll is disabled.
  /// 
  /// @default false
  bool get disableDrag => js['disableDrag'];
  /// If true, dragging on the tabs to scroll is disabled.
  /// 
  /// @default false
  set disableDrag(bool value) { js['disableDrag'] = value; }

  /// If true, scroll buttons (leftright arrow) will be hidden for scrollable tabs.
  /// 
  /// @default false
  bool get hideScrollButtons => js['hideScrollButtons'];
  /// If true, scroll buttons (leftright arrow) will be hidden for scrollable tabs.
  /// 
  /// @default false
  set hideScrollButtons(bool value) { js['hideScrollButtons'] = value; }

  /// If true, the tabs are aligned to bottom (the selection bar appears at the top).
  /// 
  /// @default false
  bool get alignBottom => js['alignBottom'];
  /// If true, the tabs are aligned to bottom (the selection bar appears at the top).
  /// 
  /// @default false
  set alignBottom(bool value) { js['alignBottom'] = value; }

  /// Gets or sets the selected element. The default is to use the index of the item.
  /// 
  /// @notify
  String get selected => js['selected'];
  /// Gets or sets the selected element. The default is to use the index of the item.
  /// 
  /// @notify
  set selected(String value) { js['selected'] = value; }

}