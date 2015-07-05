library polymerjs.paper_dialog_behavior;

import 'dart:js';
import 'package:polymerjs/jsutils.dart';

abstract class PaperDialogBehavior {
  JsObject js;

  /// If `modal` is true, this implies `no-cancel-on-outside-click` and `with-backdrop`.
  /// 
  /// @default false
  bool get modal => js['modal'];
  /// If `modal` is true, this implies `no-cancel-on-outside-click` and `with-backdrop`.
  /// 
  /// @default false
  set modal(bool value) { js['modal'] = value; }

  Map get lastFocusedElement => dartify(js['_lastFocusedElement']);
  set lastFocusedElement(Map value) { js['_lastFocusedElement'] = jsify(value); }

}