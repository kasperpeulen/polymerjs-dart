library polymerjs.iron_pages;

import 'dart:html';
import 'package:polymerjs/polymer.dart';
import 'iron_resizable_behavior.dart';
import 'iron_selectable_behavior.dart';

/// `iron-pages` is used to select one of its children to show. One use is to cycle through a list of
/// children "pages".
/// 
/// Example:
/// 
///     <iron-pages selected="0">
///       <div>One</div>
///       <div>Two</div>
///       <div>Three</div>
///     </iron-pages>
/// 
///     <script>
///       document.addEventListener('click', function(e) {
///         var pages = document.querySelector('iron-pages');
///         pages.selectNext();
///       });
///     </script>
/// 
class IronPages extends PolymerElement with IronResizableBehavior, IronSelectableBehavior {
  IronPages() : super.tag('iron-pages');
  IronPages.from(HtmlElement element) : super.from(element);

}