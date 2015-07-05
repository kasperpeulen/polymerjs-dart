library polymerjs.iron_selectable_behavior;

import 'dart:js';
import 'package:polymerjs/jsutils.dart';

abstract class IronSelectableBehavior {
  JsObject js;

  /// If you want to use the attribute value of an element for `selected` instead of the index,
  /// set this to the name of the attribute.
  /// 
  /// @default null
  String get attrForSelected => js['attrForSelected'];
  /// If you want to use the attribute value of an element for `selected` instead of the index,
  /// set this to the name of the attribute.
  /// 
  /// @default null
  set attrForSelected(String value) { js['attrForSelected'] = value; }

  /// Gets or sets the selected element. The default is to use the index of the item.
  /// 
  /// @notify
  String get selected => js['selected'];
  /// Gets or sets the selected element. The default is to use the index of the item.
  /// 
  /// @notify
  set selected(String value) { js['selected'] = value; }

  /// Returns the currently selected item.
  /// 
  /// @notify
  /// 
  /// @readOnly
  Map get selectedItem => dartify(js['selectedItem']);

  /// The event that fires from items when they are selected. Selectable
  /// will listen for this event from items and update the selection state.
  /// Set to empty string to listen to no events.
  /// 
  /// @default 'tap'
  String get activateEvent => js['activateEvent'];
  /// The event that fires from items when they are selected. Selectable
  /// will listen for this event from items and update the selection state.
  /// Set to empty string to listen to no events.
  /// 
  /// @default 'tap'
  set activateEvent(String value) { js['activateEvent'] = value; }

  /// This is a CSS selector sting.  If this is set, only items that matches the CSS selector
  /// are selectable.
  String get selectable => js['selectable'];
  /// This is a CSS selector sting.  If this is set, only items that matches the CSS selector
  /// are selectable.
  set selectable(String value) { js['selectable'] = value; }

  /// The class to set on elements when selected.
  /// 
  /// @default 'iron-selected'
  String get selectedClass => js['selectedClass'];
  /// The class to set on elements when selected.
  /// 
  /// @default 'iron-selected'
  set selectedClass(String value) { js['selectedClass'] = value; }

  /// The attribute to set on elements when selected.
  /// 
  /// @default null
  String get selectedAttribute => js['selectedAttribute'];
  /// The attribute to set on elements when selected.
  /// 
  /// @default null
  set selectedAttribute(String value) { js['selectedAttribute'] = value; }

  /// Returns an array of selectable items.
  List get items => js['items'];

  /// Returns the index of the given item.
  /// @param {Object} item
  /// @returns Returns the index of the item
  void indexOf(Map item) => js.callMethod('indexOf', [item]);

  /// Selects the given value.
  /// @param {string} value the value to select.
  void select(String value) => js.callMethod('select', [value]);

  /// Selects the previous item.
  void selectPrevious() => js.callMethod('selectPrevious', []);

  /// Selects the next item.
  void selectNext() => js.callMethod('selectNext', []);

}