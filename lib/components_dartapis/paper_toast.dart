library polymerjs.paper_toast;

import 'dart:html';
import 'package:polymerjs/polymer.dart';

/// `paper-toast` provides a subtle notification toast.
/// 
class PaperToast extends PolymerElement {
  PaperToast() : super.tag('paper-toast');
  PaperToast.from(HtmlElement element) : super.from(element);

  /// The duration in milliseconds to show the toast.
  /// 
  /// @default 3000
  num get duration => js['duration'];
  /// The duration in milliseconds to show the toast.
  /// 
  /// @default 3000
  set duration(num value) { js['duration'] = value; }

  /// The text to display in the toast.
  /// 
  /// @default ""
  String get text => js['text'];
  /// The text to display in the toast.
  /// 
  /// @default ""
  set text(String value) { js['text'] = value; }

  /// True if the toast is currently visible.
  /// 
  /// @readOnly
  /// 
  /// @default false
  bool get visible => js['visible'];

  /// Show the toast.
  void show() => js.callMethod('show', []);

  /// Hide the toast
  void hide() => js.callMethod('hide', []);

  /// Toggle the opened state of the toast.
  void toggle() => js.callMethod('toggle', []);

}