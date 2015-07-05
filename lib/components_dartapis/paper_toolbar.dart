library polymerjs.paper_toolbar;

import 'dart:html';
import 'package:polymerjs/polymer.dart';

/// `paper-toolbar` is a horizontal bar containing items that can be used for
/// label, navigation, search and actions.  The items place inside the
/// `paper-toolbar` are projected into a `class="horizontal center layout"` container inside of
/// `paper-toolbar`'s Shadow DOM.  You can use flex attributes to control the items'
/// sizing.
/// 
/// Example:
/// 
///     <paper-toolbar>
///       <paper-icon-button icon="menu" on-tap="menuAction"></paper-icon-button>
///       <div class="title">Title</div>
///       <paper-icon-button icon="more-vert" on-tap="moreAction"></paper-icon-button>
///     </paper-toolbar>
/// 
/// `paper-toolbar` has a standard height, but can made be taller by setting `tall`
/// class on the `paper-toolbar`.  This will make the toolbar 3x the normal height.
/// 
///     <paper-toolbar class="tall">
///       <paper-icon-button icon="menu"></paper-icon-button>
///     </paper-toolbar>
/// 
/// Apply `medium-tall` class to make the toolbar medium tall.  This will make the
/// toolbar 2x the normal height.
/// 
///     <paper-toolbar class="medium-tall">
///       <paper-icon-button icon="menu"></paper-icon-button>
///     </paper-toolbar>
/// 
/// When `tall`, items can pin to either the top (default), middle or bottom.  Use
/// `middle` class for middle content and `bottom` class for bottom content.
/// 
///     <paper-toolbar class="tall">
///       <paper-icon-button icon="menu"></paper-icon-button>
///       <div class="middle title">Middle Title</div>
///       <div class="bottom title">Bottom Title</div>
///     </paper-toolbar>
/// 
/// For `medium-tall` toolbar, the middle and bottom contents overlap and are
/// pinned to the bottom.  But `middleJustify` and `bottomJustify` attributes are
/// still honored separately.
/// 
/// ### Styling
/// 
/// The following custom properties and mixins are available for styling:
/// 
/// Custom property | Description | Default
/// ----------------|-------------|----------
/// `--paper-toolbar-background` | Toolbar background color     | `--default-primary-color`
/// `--paper-toolbar-color`      | Toolbar foreground color     | `--text-primary-color`
/// `--paper-toolbar`            | Mixin applied to the toolbar | `{}`
/// 
/// ### Accessibility
/// 
/// `<paper-toolbar>` has `role="toolbar"` by default. Any elements with the class `title` will
/// be used as the label of the toolbar via `aria-labelledby`.
/// 
class PaperToolbar extends PolymerElement {
  PaperToolbar() : super.tag('paper-toolbar');
  PaperToolbar.from(HtmlElement element) : super.from(element);

  /// Controls how the items are aligned horizontally when they are placed
  /// at the bottom.
  /// Options are `start`, `center`, `end`, `justified` and `around`.
  /// 
  /// @default ''
  String get bottomJustify => js['bottomJustify'];
  /// Controls how the items are aligned horizontally when they are placed
  /// at the bottom.
  /// Options are `start`, `center`, `end`, `justified` and `around`.
  /// 
  /// @default ''
  set bottomJustify(String value) { js['bottomJustify'] = value; }

  /// Controls how the items are aligned horizontally.
  /// Options are `start`, `center`, `end`, `justified` and `around`.
  /// 
  /// @default ''
  String get justify => js['justify'];
  /// Controls how the items are aligned horizontally.
  /// Options are `start`, `center`, `end`, `justified` and `around`.
  /// 
  /// @default ''
  set justify(String value) { js['justify'] = value; }

  /// Controls how the items are aligned horizontally when they are placed
  /// in the middle.
  /// Options are `start`, `center`, `end`, `justified` and `around`.
  /// 
  /// @default ''
  String get middleJustify => js['middleJustify'];
  /// Controls how the items are aligned horizontally when they are placed
  /// in the middle.
  /// Options are `start`, `center`, `end`, `justified` and `around`.
  /// 
  /// @default ''
  set middleJustify(String value) { js['middleJustify'] = value; }

}