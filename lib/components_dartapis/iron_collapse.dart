library polymerjs.iron_collapse;

import 'dart:html';
import 'package:polymerjs/polymer.dart';

/// `iron-collapse` creates a collapsible block of content.  By default, the content
/// will be collapsed.  Use `opened` or `toggle()` to show/hide the content.
/// 
///     <button on-click="{{toggle}}">toggle collapse</button>
/// 
///     <iron-collapse id="collapse">
///       <div>Content goes here...</div>
///     </iron-collapse>
/// 
///     ...
/// 
///     toggle: function() {
///       this.$.collapse.toggle();
///     }
/// 
/// `iron-collapse` adjusts the height/width of the collapsible element to show/hide
/// the content.  So avoid putting padding/margin/border on the collapsible directly,
/// and instead put a div inside and style that.
/// 
///     <style>
///       .collapse-content {
///         padding: 15px;
///         border: 1px solid #dedede;
///       }
///     </style>
/// 
///     <iron-collapse>
///       <div class="collapse-content">
///         <div>Content goes here...</div>
///       </div>
///     </iron-collapse>
/// 
class IronCollapse extends PolymerElement {
  IronCollapse() : super.tag('iron-collapse');
  IronCollapse.from(HtmlElement element) : super.from(element);

  /// If true, the orientation is horizontal; otherwise is vertical.
  /// 
  /// @default false
  bool get horizontal => js['horizontal'];
  /// If true, the orientation is horizontal; otherwise is vertical.
  /// 
  /// @default false
  set horizontal(bool value) { js['horizontal'] = value; }

  /// Set opened to true to show the collapse element and to false to hide it.
  /// 
  /// @notify
  /// 
  /// @default false
  bool get opened => js['opened'];
  /// Set opened to true to show the collapse element and to false to hide it.
  /// 
  /// @notify
  /// 
  /// @default false
  set opened(bool value) { js['opened'] = value; }

  /// Toggle the opened state.
  void toggle() => js.callMethod('toggle', []);

}