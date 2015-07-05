library polymerjs.paper_drawer_panel;

import 'dart:html';
import 'package:polymerjs/polymer.dart';

/// `paper-drawer-panel` contains a drawer panel and a main panel.  The drawer
/// and the main panel are side-by-side with drawer on the left.  When the browser
/// window size is smaller than the `responsiveWidth`, `paper-drawer-panel`
/// changes to narrow layout.  In narrow layout, the drawer will be stacked on top
/// of the main panel.  The drawer will slide in/out to hide/reveal the main
/// panel.
/// 
/// Use the attribute `drawer` to indicate that the element is the drawer panel and
/// `main` to indicate that the element is the main panel.
/// 
/// Example:
/// 
///     <paper-drawer-panel>
///       <div drawer> Drawer panel... </div>
///       <div main> Main panel... </div>
///     </paper-drawer-panel>
/// 
/// The drawer and the main panels are not scrollable.  You can set CSS overflow
/// property on the elements to make them scrollable or use `paper-header-panel`.
/// 
/// Example:
/// 
///     <paper-drawer-panel>
///       <paper-header-panel drawer>
///         <paper-toolbar></paper-toolbar>
///         <div> Drawer content... </div>
///       </paper-header-panel>
///       <paper-header-panel main>
///         <paper-toolbar></paper-toolbar>
///         <div> Main content... </div>
///       </paper-header-panel>
///     </paper-drawer-panel>
/// 
/// An element that should toggle the drawer will automatically do so if it's
/// given the `paper-drawer-toggle` attribute.  Also this element will automatically
/// be hidden in wide layout.
/// 
/// Example:
/// 
///     <paper-drawer-panel>
///       <paper-header-panel drawer>
///         <paper-toolbar>
///           <div>Application</div>
///         </paper-toolbar>
///         <div> Drawer content... </div>
///       </paper-header-panel>
///       <paper-header-panel main>
///         <paper-toolbar>
///           <paper-icon-button icon="menu" paper-drawer-toggle></paper-icon-button>
///           <div>Title</div>
///         </paper-toolbar>
///         <div> Main content... </div>
///       </paper-header-panel>
///     </paper-drawer-panel>
/// 
/// To position the drawer to the right, add `right-drawer` attribute.
/// 
///     <paper-drawer-panel right-drawer>
///       <div drawer> Drawer panel... </div>
///       <div main> Main panel... </div>
///     </paper-drawer-panel>
/// 
/// Styling paper-drawer-panel:
/// 
/// To change the main container:
///   paper-drawer-panel {
///     --paper-drawer-panel-main-container: {
///       background-color: gray;
///     };
///   }
/// 
/// To change the drawer container when it's in the left side:
///   paper-drawer-panel {
///     --paper-drawer-panel-left-drawer-container: {
///       background-color: white;
///     };
///   }
/// 
/// To change the drawer container when it's in the right side:
/// 
///   paper-drawer-panel {
///     --paper-drawer-panel-right-drawer-container: {
///       background-color: white;
///     };
///   }
/// 
class PaperDrawerPanel extends PolymerElement {
  PaperDrawerPanel() : super.tag('paper-drawer-panel');
  PaperDrawerPanel.from(HtmlElement element) : super.from(element);

  /// The panel to be selected when `paper-drawer-panel` changes to narrow
  /// layout.
  /// 
  /// @default 'main'
  String get defaultSelected => js['defaultSelected'];
  /// The panel to be selected when `paper-drawer-panel` changes to narrow
  /// layout.
  /// 
  /// @default 'main'
  set defaultSelected(String value) { js['defaultSelected'] = value; }

  /// If true, swipe from the edge is disable.
  /// 
  /// @default false
  bool get disableEdgeSwipe => js['disableEdgeSwipe'];
  /// If true, swipe from the edge is disable.
  /// 
  /// @default false
  set disableEdgeSwipe(bool value) { js['disableEdgeSwipe'] = value; }

  /// If true, swipe to openclose the drawer is disabled.
  /// 
  /// @default false
  bool get disableSwipe => js['disableSwipe'];
  /// If true, swipe to openclose the drawer is disabled.
  /// 
  /// @default false
  set disableSwipe(bool value) { js['disableSwipe'] = value; }

  /// Whether the user is dragging the drawer interactively.
  /// 
  /// @notify
  /// 
  /// @readOnly
  /// 
  /// @default false
  bool get dragging => js['dragging'];

  /// Width of the drawer panel.
  /// 
  /// @default '256px'
  String get drawerWidth => js['drawerWidth'];
  /// Width of the drawer panel.
  /// 
  /// @default '256px'
  set drawerWidth(String value) { js['drawerWidth'] = value; }

  /// How many pixels on the side of the screen are sensitive to edge
  /// swipes and peek.
  /// 
  /// @default 30
  num get edgeSwipeSensitivity => js['edgeSwipeSensitivity'];
  /// How many pixels on the side of the screen are sensitive to edge
  /// swipes and peek.
  /// 
  /// @default 30
  set edgeSwipeSensitivity(num value) { js['edgeSwipeSensitivity'] = value; }

  /// If true, ignore `responsiveWidth` setting and force the narrow layout.
  /// 
  /// @default false
  bool get forceNarrow => js['forceNarrow'];
  /// If true, ignore `responsiveWidth` setting and force the narrow layout.
  /// 
  /// @default false
  set forceNarrow(bool value) { js['forceNarrow'] = value; }

  /// Whether the browser has support for the transform CSS property.
  bool get hasTransform => js['hasTransform'];
  /// Whether the browser has support for the transform CSS property.
  set hasTransform(bool value) { js['hasTransform'] = value; }

  /// Whether the browser has support for the will-change CSS property.
  bool get hasWillChange => js['hasWillChange'];
  /// Whether the browser has support for the will-change CSS property.
  set hasWillChange(bool value) { js['hasWillChange'] = value; }

  /// Returns true if the panel is in narrow layout.  This is useful if you
  /// need to showhide elements based on the layout.
  /// 
  /// @reflectToAttribute
  /// 
  /// @notify
  /// 
  /// @readOnly
  /// 
  /// @default false
  bool get narrow => js['narrow'];

  /// Whether the drawer is peeking out from the edge.
  /// 
  /// @notify
  /// 
  /// @readOnly
  /// 
  /// @default false
  bool get peeking => js['peeking'];

  /// Max-width when the panel changes to narrow layout.
  /// 
  /// @default '640px'
  String get responsiveWidth => js['responsiveWidth'];
  /// Max-width when the panel changes to narrow layout.
  /// 
  /// @default '640px'
  set responsiveWidth(String value) { js['responsiveWidth'] = value; }

  /// If true, position the drawer to the right.
  /// 
  /// @default false
  bool get rightDrawer => js['rightDrawer'];
  /// If true, position the drawer to the right.
  /// 
  /// @default false
  set rightDrawer(bool value) { js['rightDrawer'] = value; }

  /// The panel that is being selected. `drawer` for the drawer panel and
  /// `main` for the main panel.
  /// 
  /// @reflectToAttribute
  /// 
  /// @notify
  /// 
  /// @default null
  String get selected => js['selected'];
  /// The panel that is being selected. `drawer` for the drawer panel and
  /// `main` for the main panel.
  /// 
  /// @reflectToAttribute
  /// 
  /// @notify
  /// 
  /// @default null
  set selected(String value) { js['selected'] = value; }

  /// The attribute on elements that should toggle the drawer on tap, also elements will
  /// automatically be hidden in wide layout.
  /// 
  /// @default 'paper-drawer-toggle'
  String get drawerToggleAttribute => js['drawerToggleAttribute'];
  /// The attribute on elements that should toggle the drawer on tap, also elements will
  /// automatically be hidden in wide layout.
  /// 
  /// @default 'paper-drawer-toggle'
  set drawerToggleAttribute(String value) { js['drawerToggleAttribute'] = value; }

  /// Whether the transition is enabled.
  /// 
  /// @default false
  bool get transition => js['transition'];
  /// Whether the transition is enabled.
  /// 
  /// @default false
  set transition(bool value) { js['transition'] = value; }

  /// Toggles the panel open and closed.
  void togglePanel() => js.callMethod('togglePanel', []);

  /// Opens the drawer.
  void openDrawer() => js.callMethod('openDrawer', []);

  /// Closes the drawer.
  void closeDrawer() => js.callMethod('closeDrawer', []);

}