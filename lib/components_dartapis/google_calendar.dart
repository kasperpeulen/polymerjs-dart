library polymerjs.google_calendar;

import 'dart:html';
import 'package:polymerjs/polymer.dart';

class GoogleCalendar extends PolymerElement {
  GoogleCalendar() : super.tag('google-calendar');
  GoogleCalendar.from(HtmlElement element) : super.from(element);

  /// A title to be displayed on top of the calendar list.
  /// 
  /// @default 'My calendars'
  String get title => js['title'];
  /// A title to be displayed on top of the calendar list.
  /// 
  /// @default 'My calendars'
  set title(String value) { js['title'] = value; }

  /// List of calendars
  /// 
  /// @default function() { return [];
  List get calendars => js['calendars'];
  /// List of calendars
  /// 
  /// @default function() { return [];
  set calendars(List value) { js['calendars'] = value; }

  /// Event from this calendar decide whether the status is freebusy.
  /// 
  /// @default null
  String get calendarId => js['calendarId'];
  /// Event from this calendar decide whether the status is freebusy.
  /// 
  /// @default null
  set calendarId(String value) { js['calendarId'] = value; }

  /// API key to use with Calendar API requests.
  /// 
  /// @default null
  String get apiKey => js['apiKey'];
  /// API key to use with Calendar API requests.
  /// 
  /// @default null
  set apiKey(String value) { js['apiKey'] = value; }

  /// Label to be displayed if the status is busy.
  /// 
  /// @default "I'm busy"
  String get busyLabel => js['busyLabel'];
  /// Label to be displayed if the status is busy.
  /// 
  /// @default "I'm busy"
  set busyLabel(String value) { js['busyLabel'] = value; }

  /// Label to be displayed if the status is free.
  /// 
  /// @default "I'm free"
  String get freeLabel => js['freeLabel'];
  /// Label to be displayed if the status is free.
  /// 
  /// @default "I'm free"
  set freeLabel(String value) { js['freeLabel'] = value; }

  /// Displays the calendar list if the user is signed in to Google.
  void displayCalendars() => js.callMethod('displayCalendars', []);

  /// Displays the busyfree status. Use it to refresh label state
  void displayBusy() => js.callMethod('displayBusy', []);

}