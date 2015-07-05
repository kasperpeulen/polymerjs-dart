library polymerjs.neon_animatable_behavior;

import 'dart:js';
import 'package:polymerjs/jsutils.dart';

/// `Polymer.NeonAnimatableBehavior` is implemented by elements containing animations for use with
/// elements implementing `Polymer.NeonAnimationRunnerBehavior`.
abstract class NeonAnimatableBehavior {
  JsObject js;

  /// Animation configuration. See README for more info.
  Map get animationConfig => dartify(js['animationConfig']);
  /// Animation configuration. See README for more info.
  set animationConfig(Map value) { js['animationConfig'] = jsify(value); }

  /// Convenience property for setting an 'entry' animation. Do not set `animationConfig.entry`
  /// manually if using this. The animated node is set to `this` if using this property.
  String get entryAnimation => js['entryAnimation'];
  /// Convenience property for setting an 'entry' animation. Do not set `animationConfig.entry`
  /// manually if using this. The animated node is set to `this` if using this property.
  set entryAnimation(String value) { js['entryAnimation'] = value; }

  /// Convenience property for setting an 'exit' animation. Do not set `animationConfig.exit`
  /// manually if using this. The animated node is set to `this` if using this property.
  String get exitAnimation => js['exitAnimation'];
  /// Convenience property for setting an 'exit' animation. Do not set `animationConfig.exit`
  /// manually if using this. The animated node is set to `this` if using this property.
  set exitAnimation(String value) { js['exitAnimation'] = value; }

  /// An element implementing `Polymer.NeonAnimationRunnerBehavior` calls this method to configure
  /// an animation with an optional type. Elements implementing `Polymer.NeonAnimatableBehavior`
  /// should define the property `animationConfig`, which is either a configuration object
  /// or a map of animation type to array of configuration objects.
  void getAnimationConfig(type) => js.callMethod('getAnimationConfig', [type]);

}