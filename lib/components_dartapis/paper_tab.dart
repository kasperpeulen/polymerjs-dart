library polymerjs.paper_tab;

import 'dart:html';
import 'package:polymerjs/polymer.dart';
import 'iron_control_state.dart';

/// `paper-tab` is styled to look like a tab.  It should be used in conjunction with
/// `paper-tabs`.
/// 
/// Example:
/// 
///     <paper-tabs selected="0">
///       <paper-tab>TAB 1</paper-tab>
///       <paper-tab>TAB 2</paper-tab>
///       <paper-tab>TAB 3</paper-tab>
///     </paper-tabs>
/// 
/// ### Styling
/// 
/// The following custom properties and mixins are available for styling:
/// 
/// Custom property | Description | Default
/// ----------------|-------------|----------
/// `--paper-tab-ink` | Ink color | `--paper-yellow-a100`
/// `--paper-tab` | Mixin applied to the tab | `{}`
/// `--paper-tab-content` | Mixin applied to the tab content | `{}`
class PaperTab extends PolymerElement with IronControlState {
  PaperTab() : super.tag('paper-tab');
  PaperTab.from(HtmlElement element) : super.from(element);

  /// If true, ink ripple effect is disabled.
  /// 
  /// @default false
  bool get noink => js['noink'];
  /// If true, ink ripple effect is disabled.
  /// 
  /// @default false
  set noink(bool value) { js['noink'] = value; }

}