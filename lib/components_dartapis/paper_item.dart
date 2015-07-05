library polymerjs.paper_item;

import 'dart:html';
import 'package:polymerjs/polymer.dart';

/// `<paper-item>` is a non-interactive list item. By default, it is a horizontal flexbox.
/// 
///     <paper-item>Item</paper-item>
/// 
/// Use this element with `<paper-item-body>` to make Material Design styled two-line and three-line
/// items.
/// 
///     <paper-item>
///       <paper-item-body two-line>
///         <div>Show your status</div>
///         <div secondary>Your status is visible to everyone</div>
///       </paper-item-body>
///       <iron-icon icon="warning"></iron-icon>
///     </paper-item>
/// 
/// ### Styling
/// 
/// The following custom properties and mixins are available for styling:
/// 
/// Custom property | Description | Default
/// ----------------|-------------|----------
/// `--paper-item-min-height` | Minimum height of the item | `48px`
/// `--paper-item`            | Mixin applied to the item  | `{}`
/// 
/// ### Accessibility
/// 
/// This element has `role="listitem"` by default. Depending on usage, it may be more appropriate to set
/// `role="menuitem"`, `role="menuitemcheckbox"` or `role="menuitemradio"`.
/// 
///     <paper-item role="menuitemcheckbox">
///       <paper-item-body>
///         Show your status
///       </paper-item-body>
///       <paper-checkbox></paper-checkbox>
///     </paper-item>
/// 
class PaperItem extends PolymerElement {
  PaperItem() : super.tag('paper-item');
  PaperItem.from(HtmlElement element) : super.from(element);

}