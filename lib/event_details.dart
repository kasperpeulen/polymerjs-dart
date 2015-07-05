/// wrapper for https://www.polymer-project.org/1.0/docs/devguide/events.html#gestures
library polymerjs.event_details;

import 'dart:js';
import 'dart:html';
import 'package:polymerjs/jsutils.dart';

/// This event fires when moving while finger/button is down.
class TrackDetail extends Detail {
  TrackDetail(JsObject js, CustomEvent event)
      : super(js, event),
        state = js['state'],
        x = js['x'],
        y = js['y'],
        dx = js['dx'],
        dy = js['dy'],
        ddx = js['ddx'],
        ddy = js['ddy'],
        sourceEvent = js['sourceEvent'];

  /// A string indicating the tracking state. The possible values are:
  ///
  /// start - fired when tracking is first detected (finger/button down and
  /// moved past a pre-set distance threshold)
  ///
  /// track - fired while tracking
  ///
  /// end - fired when tracking ends
  final String state;

  /// clientX coordinate for event
  final int x;

  /// clientY coordinate for event
  final int y;

  /// change in pixels horizontally since the first track event
  final int dx;

  /// change in pixels vertically since the first track event
  final int dy;

  /// change in pixels horizontally since last track event
  final int ddx;

  /// change in pixels vertically since last track event
  final int ddy;

  /// the original DOM event that caused the track action
  final Event sourceEvent;

  /// a method that may be called to determine the element currently being hovered
  Element hover() => js.callMethod("hover");
}

/// This event fires when finger/button went down.
class DownDetail extends Detail {
  DownDetail(JsObject js, CustomEvent event)
      : super(js, event),
        x = js['x'],
        y = js['y'],
        sourceEvent = js['sourceEvent'];

  /// clientX coordinate for event
  final int x;

  /// clientY coordinate for event
  final int y;

  /// the original DOM event that caused the down action
  final Event sourceEvent;
}

/// This event fires when finger/button went up.
class UpDetail extends Detail {
  UpDetail(JsObject js, CustomEvent event)
      : super(js, event),
        x = js['x'],
        y = js['y'],
        sourceEvent = js['sourceEvent'];

  /// clientX coordinate for event
  final int x;

  /// clientY coordinate for event
  final int y;

  /// the original DOM event that caused the up action
  final Event sourceEvent;
}

/// This event fires when finger/button went up and down.
class TapDetail extends Detail {
  TapDetail(JsObject js, CustomEvent event)
      : super(js, event),
        x = js['x'],
        y = js['y'],
        sourceEvent = js['sourceEvent'];

  /// clientX coordinate for event
  final int x;

  /// clientY coordinate for event
  final int y;

  /// the original DOM event that caused the tap action
  final Event sourceEvent;
}

class Detail extends Object with JsMixin {
  final CustomEvent customEvent;

  final JsObject js;

  Detail(this.js, this.customEvent);
}
