library polymerjs.paper_header_panel;

import 'dart:html';
import 'package:polymerjs/jsutils.dart';
import 'package:polymerjs/polymer.dart';

/// `paper-header-panel` contains a header section and a content panel section.
/// 
/// __Important:__ The `paper-header-panel` will not display if its parent does not have a height.
/// 
/// Using layout classes, you can make the `paper-header-panel` fill the screen
/// 
///     <body class="fullbleed layout vertical">
///       <paper-header-panel class="flex">
///         <paper-toolbar>
///           <div>Hello World!</div>
///         </paper-toolbar>
///       </paper-header-panel>
///     </body>
/// 
/// Special support is provided for scrolling modes when one uses a paper-toolbar or equivalent for the
/// header section.
/// 
/// Example:
/// 
///     <paper-header-panel>
///       <paper-toolbar>Header</paper-toolbar>
///       <div>Content goes here...</div>
///     </paper-header-panel>
/// 
/// If you want to use other than `paper-toolbar` for the header, add `paper-header` class to that
/// element.
/// 
/// Example:
/// 
///     <paper-header-panel>
///       <div class="paper-header">Header</div>
///       <div>Content goes here...</div>
///     </paper-header-panel>
/// 
/// To have the content fit to the main area, use the `fit` class.
/// 
///     <paper-header-panel>
///       <div class="paper-header">standard</div>
///       <div class="fit">content fits 100% below the header</div>
///     </paper-header-panel>
/// 
/// Modes
/// 
/// Controls header and scrolling behavior. Options are `standard`, `seamed`, `waterfall`, `waterfall-tall`, `scroll` and
/// `cover`. Default is `standard`.
/// 
/// Mode | Description
/// ----------------|-------------
/// `standard` | The header is a step above the panel. The header will consume the panel at the point of entry, preventing it from passing through to the opposite side.
/// `seamed` | The header is presented as seamed with the panel.
/// `waterfall` | Similar to standard mode, but header is initially presented as seamed with panel, but then separates to form the step.
/// `waterfall-tall` | The header is initially taller (`tall` class is added to the header). As the user scrolls, the header separates (forming an edge) while condensing (`tall` class is removed from the header).
/// `scroll` | The header keeps its seam with the panel, and is pushed off screen.
/// `cover` | The panel covers the whole `paper-header-panel` including the header. This allows user to style the panel in such a way that the panel is partially covering the header.
/// 
/// Example:
/// 
///     <paper-header-panel mode="waterfall">
///       <div class="paper-header">standard</div>
///       <div class="content fit">content fits 100% below the header</div>
///     </paper-header-panel>
/// 
/// 
/// Styling header panel:
/// 
/// To change the shadow that shows up underneath the header:
/// 
///     paper-header-panel {
///       --paper-header-panel-shadow: {
///           height: 6px;
///           bottom: -6px;
///           box-shadow: inset 0px 5px 6px -3px rgba(0, 0, 0, 0.4);
///       };
///     }
/// 
/// To change the panel container in different modes:
/// 
///     paper-slider {
///       --paper-header-panel-standard-container: {
///         border: 1px solid gray;
///       };
/// 
///       --paper-header-panel-cover-container: {
///         border: 1px solid gray;
///       };
/// 
///       --paper-header-panel-waterfall-container: {
///         border: 1px solid gray;
///       };
/// 
///       --paper-header-panel-waterfall-tall-container: {
///         border: 1px solid gray;
///       };
///     }
/// 
class PaperHeaderPanel extends PolymerElement {
  PaperHeaderPanel() : super.tag('paper-header-panel');
  PaperHeaderPanel.from(HtmlElement element) : super.from(element);

  /// Controls header and scrolling behavior. Options are
  /// `standard`, `seamed`, `waterfall`, `waterfall-tall`, `scroll` and
  /// `cover`. Default is `standard`.
  /// 
  /// `standard`: The header is a step above the panel. The header will consume the
  /// panel at the point of entry, preventing it from passing through to the
  /// opposite side.
  /// 
  /// `seamed`: The header is presented as seamed with the panel.
  /// 
  /// `waterfall`: Similar to standard mode, but header is initially presented as
  /// seamed with panel, but then separates to form the step.
  /// 
  /// `waterfall-tall`: The header is initially taller (`tall` class is added to
  /// the header).  As the user scrolls, the header separates (forming an edge)
  /// while condensing (`tall` class is removed from the header).
  /// 
  /// `scroll`: The header keeps its seam with the panel, and is pushed off screen.
  /// 
  /// `cover`: The panel covers the whole `paper-header-panel` including the
  /// header. This allows user to style the panel in such a way that the panel is
  /// partially covering the header.
  /// 
  /// <paper-header-panel mode="cover">
  /// <paper-toolbar class="tall">
  /// <core-icon-button icon="menu"><core-icon-button>
  /// <paper-toolbar>
  /// <div class="content"><div>
  /// <paper-header-panel>
  /// 
  /// @reflectToAttribute
  /// 
  /// @default 'standard'
  String get mode => js['mode'];
  /// Controls header and scrolling behavior. Options are
  /// `standard`, `seamed`, `waterfall`, `waterfall-tall`, `scroll` and
  /// `cover`. Default is `standard`.
  /// 
  /// `standard`: The header is a step above the panel. The header will consume the
  /// panel at the point of entry, preventing it from passing through to the
  /// opposite side.
  /// 
  /// `seamed`: The header is presented as seamed with the panel.
  /// 
  /// `waterfall`: Similar to standard mode, but header is initially presented as
  /// seamed with panel, but then separates to form the step.
  /// 
  /// `waterfall-tall`: The header is initially taller (`tall` class is added to
  /// the header).  As the user scrolls, the header separates (forming an edge)
  /// while condensing (`tall` class is removed from the header).
  /// 
  /// `scroll`: The header keeps its seam with the panel, and is pushed off screen.
  /// 
  /// `cover`: The panel covers the whole `paper-header-panel` including the
  /// header. This allows user to style the panel in such a way that the panel is
  /// partially covering the header.
  /// 
  /// <paper-header-panel mode="cover">
  /// <paper-toolbar class="tall">
  /// <core-icon-button icon="menu"><core-icon-button>
  /// <paper-toolbar>
  /// <div class="content"><div>
  /// <paper-header-panel>
  /// 
  /// @reflectToAttribute
  /// 
  /// @default 'standard'
  set mode(String value) { js['mode'] = value; }

  /// If true, the drop-shadow is always shown no matter what mode is set to.
  /// 
  /// @default false
  bool get shadow => js['shadow'];
  /// If true, the drop-shadow is always shown no matter what mode is set to.
  /// 
  /// @default false
  set shadow(bool value) { js['shadow'] = value; }

  /// The class used in waterfall-tall mode.  Change this if the header
  /// accepts a different class for toggling height, e.g. "medium-tall"
  /// 
  /// @default 'tall'
  String get tallClass => js['tallClass'];
  /// The class used in waterfall-tall mode.  Change this if the header
  /// accepts a different class for toggling height, e.g. "medium-tall"
  /// 
  /// @default 'tall'
  set tallClass(String value) { js['tallClass'] = value; }

  /// If true, the scroller is at the top
  /// 
  /// @readOnly
  /// 
  /// @default true
  bool get atTop => js['atTop'];

  /// Returns the header element
  Map get header => dartify(js['header']);

  /// Returns the scrollable element.
  Map get scroller => dartify(js['scroller']);

  /// Returns true if the scroller has a visible shadow.
  bool get visibleShadow => js['visibleShadow'];

}