library polymerjs.paper_progress;

import 'dart:html';
import 'package:polymerjs/polymer.dart';
import 'iron_range_behavior.dart';

/// The progress bars are for situations where the percentage completed can be
/// determined. They give users a quick sense of how much longer an operation
/// will take.
/// 
/// Example:
/// 
///     <paper-progress value="10"></paper-progress>
/// 
/// There is also a secondary progress which is useful for displaying intermediate
/// progress, such as the buffer level during a streaming playback progress bar.
/// 
/// Example:
/// 
///     <paper-progress value="10" secondary-progress="30"></paper-progress>
/// 
/// Styling progress bar:
/// 
/// To change the active progress bar color:
/// 
///     paper-progress {
///        --paper-progress-active-color: #e91e63;
///     }
/// 
/// To change the secondary progress bar color:
/// 
///     paper-progress {
///       --paper-progress-secondary-color: #f8bbd0;
///     }
/// 
/// To change the progress bar background color:
/// 
///     paper-progress {
///       --paper-progress-container-color: #64ffda;
///     }
/// 
class PaperProgress extends PolymerElement with IronRangeBehavior {
  PaperProgress() : super.tag('paper-progress');
  PaperProgress.from(HtmlElement element) : super.from(element);

  /// The number that represents the current secondary progress.
  /// 
  /// @notify
  /// 
  /// @default 0
  num get secondaryProgress => js['secondaryProgress'];
  /// The number that represents the current secondary progress.
  /// 
  /// @notify
  /// 
  /// @default 0
  set secondaryProgress(num value) { js['secondaryProgress'] = value; }

  /// The secondary ratio
  /// 
  /// @readOnly
  /// 
  /// @default 0
  num get secondaryRatio => js['secondaryRatio'];

  /// Use an indeterminate progress indicator.
  /// 
  /// @notify
  /// 
  /// @default false
  bool get indeterminate => js['indeterminate'];
  /// Use an indeterminate progress indicator.
  /// 
  /// @notify
  /// 
  /// @default false
  set indeterminate(bool value) { js['indeterminate'] = value; }

}