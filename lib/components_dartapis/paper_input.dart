library polymerjs.paper_input;

import 'dart:html';
import 'package:polymerjs/polymer.dart';
import 'iron_control_state.dart';
import 'paper_input_behavior.dart';

/// `<paper-input>` is a single-line text field with Material Design styling.
/// 
///     <paper-input label="Input label"></paper-input>
/// 
/// It may include an optional error message or character counter.
/// 
///     <paper-input error-message="Invalid input!" label="Input label"></paper-input>
///     <paper-input char-counter label="Input label"></paper-input>
/// 
/// See `Polymer.PaperInputBehavior` for more API docs.
/// 
/// ### Styling
/// 
/// See `Polymer.PaperInputContainer` for a list of custom properties used to
/// style this element.
/// 
class PaperInput extends PolymerElement with IronControlState, PaperInputBehavior {
  PaperInput() : super.tag('paper-input');
  PaperInput.from(HtmlElement element) : super.from(element);

}