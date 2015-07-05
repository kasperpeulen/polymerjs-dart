library polymerjs.iron_overlay_behavior;

import 'dart:js';
import 'package:polymerjs/jsutils.dart';

abstract class IronOverlayBehavior {
  JsObject js;

  /// True if the overlay is currently displayed.
  /// 
  /// @notify
  /// 
  /// @default false
  bool get opened => js['opened'];
  /// True if the overlay is currently displayed.
  /// 
  /// @notify
  /// 
  /// @default false
  set opened(bool value) { js['opened'] = value; }

  /// True if the overlay was canceled when it was last closed.
  /// 
  /// @readOnly
  /// 
  /// @default false
  bool get canceled => js['canceled'];

  /// Set to true to display a backdrop behind the overlay.
  /// 
  /// @default false
  bool get withBackdrop => js['withBackdrop'];
  /// Set to true to display a backdrop behind the overlay.
  /// 
  /// @default false
  set withBackdrop(bool value) { js['withBackdrop'] = value; }

  /// Set to true to disable auto-focusing the overlay or child nodes with
  /// the `autofocus` attribute` when the overlay is opened.
  /// 
  /// @default false
  bool get noAutoFocus => js['noAutoFocus'];
  /// Set to true to disable auto-focusing the overlay or child nodes with
  /// the `autofocus` attribute` when the overlay is opened.
  /// 
  /// @default false
  set noAutoFocus(bool value) { js['noAutoFocus'] = value; }

  /// Set to true to disable canceling the overlay with the ESC key.
  /// 
  /// @default false
  bool get noCancelOnEscKey => js['noCancelOnEscKey'];
  /// Set to true to disable canceling the overlay with the ESC key.
  /// 
  /// @default false
  set noCancelOnEscKey(bool value) { js['noCancelOnEscKey'] = value; }

  /// Set to true to disable canceling the overlay by clicking outside it.
  /// 
  /// @default false
  bool get noCancelOnOutsideClick => js['noCancelOnOutsideClick'];
  /// Set to true to disable canceling the overlay by clicking outside it.
  /// 
  /// @default false
  set noCancelOnOutsideClick(bool value) { js['noCancelOnOutsideClick'] = value; }

  /// Returns the reason this dialog was last closed.
  Map get closingReason => dartify(js['closingReason']);
  /// Returns the reason this dialog was last closed.
  set closingReason(Map value) { js['closingReason'] = jsify(value); }

  /// The backdrop element.
  dynamic get backdropElement => js['backdropElement'];

  /// Toggle the opened state of the overlay.
  void toggle() => js.callMethod('toggle', []);

  /// Open the overlay.
  void open() => js.callMethod('open', []);

  /// Close the overlay.
  void close() => js.callMethod('close', []);

  /// Cancels the overlay.
  void cancel() => js.callMethod('cancel', []);

}