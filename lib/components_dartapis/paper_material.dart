library polymerjs.paper_material;

import 'dart:html';
import 'package:polymerjs/polymer.dart';

/// `paper-material` is a container that renders two shadows on top of each other to
/// create the effect of a lifted piece of paper.
/// 
/// Example:
/// 
///     <paper-material elevation="1">
///       ... content ...
///     </paper-material>
/// 
class PaperMaterial extends PolymerElement {
  PaperMaterial() : super.tag('paper-material');
  PaperMaterial.from(HtmlElement element) : super.from(element);

  /// The z-depth of this element, from 0-5. Setting to 0 will remove the
  /// shadow, and each increasing number greater than 0 will be "deeper"
  /// than the last.
  /// 
  /// @reflectToAttribute
  /// 
  /// @default 1
  num get elevation => js['elevation'];
  /// The z-depth of this element, from 0-5. Setting to 0 will remove the
  /// shadow, and each increasing number greater than 0 will be "deeper"
  /// than the last.
  /// 
  /// @reflectToAttribute
  /// 
  /// @default 1
  set elevation(num value) { js['elevation'] = value; }

}