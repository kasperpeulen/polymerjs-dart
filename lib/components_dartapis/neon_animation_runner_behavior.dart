library polymerjs.neon_animation_runner_behavior;

import 'dart:js';
import 'package:polymerjs/jsutils.dart';

abstract class NeonAnimationRunnerBehavior {
  JsObject js;

  Map get player => dartify(js['_player']);
  set player(Map value) { js['_player'] = jsify(value); }

  /// Plays an animation with an optional `type`.
  /// @param {string=} type
  /// @param {!Object=} cookie
  void playAnimation(dynamic type, dynamic cookie) => js.callMethod('playAnimation', [type, cookie]);

  /// Cancels the currently running animation.
  void cancelAnimation() => js.callMethod('cancelAnimation', []);

}