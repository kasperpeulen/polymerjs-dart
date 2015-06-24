library polymerjs.iron_test_helpers;

import 'dart:js';
import 'dart:html';
import 'package:polymerjs/jsutils.dart';

/// Make sure to import the following in your html test:
/// <script src="components/iron-test-helpers/mock-interactions.js"></script>
/// <script src="components/iron-test-helpers/test-helpers.js"></script>
class MockInteractions extends Object with JsStaticMixin {
  
  static JsObject js = context["MockInteractions"];

  static blur(HtmlElement target) => js["blur"].apply([target]);

  static down(HtmlElement target) => js["down"].apply([target]);

  static up(HtmlElement target) => js["up"].apply([target]);

  static downAndUp(HtmlElement target) => js["downAndUp"].apply([target]);

  static tap(HtmlElement target) => js["tap"].apply([target]);

  static track(HtmlElement target) => js["track"].apply([target]);

  static pressEnter(HtmlElement target) => js["pressEnter"].apply([target]);

  static pressSpace(HtmlElement target) => js["pressSpace"].apply([target]);

  static keyDownOn(HtmlElement target, {int keyCode: 13}) => js["keyDownOn"].apply([target,keyCode]);

  static keyUpOn(HtmlElement target, {int keyCode: 13}) => js["keyUpOn"].apply([target,keyCode]);

  static Point middleOfNode(HtmlElement element) {
    var point = js['middleOfNode'].apply([element]);
    return new Point(point['x'], point['y']);
  }
  static Point topLeftOfNode(HtmlElement element) {
    var point = js['topLeftOfNode'].apply([element]);
    return new Point(point['x'], point['y']);
  }
}
