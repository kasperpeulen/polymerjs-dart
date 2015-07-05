library polymerjs.element_constructors;

export 'dart:html';
export 'package:polymerjs/polymer.dart';
export 'package:polymerjs/components_dartapis/google_calendar.dart';
import 'package:polymerjs/components_dartapis/google_calendar.dart';
export 'package:polymerjs/components_dartapis/paper_progress.dart';
import 'package:polymerjs/components_dartapis/paper_progress.dart';
export 'package:polymerjs/components_dartapis/paper_checkbox.dart';
import 'package:polymerjs/components_dartapis/paper_checkbox.dart';
export 'package:polymerjs/components_dartapis/paper_dialog.dart';
import 'package:polymerjs/components_dartapis/paper_dialog.dart';
export 'package:polymerjs/components_dartapis/paper_input.dart';
import 'package:polymerjs/components_dartapis/paper_input.dart';
export 'package:polymerjs/components_dartapis/paper_material.dart';
import 'package:polymerjs/components_dartapis/paper_material.dart';
export 'package:polymerjs/components_dartapis/paper_radio_button.dart';
import 'package:polymerjs/components_dartapis/paper_radio_button.dart';
export 'package:polymerjs/components_dartapis/paper_icon_button.dart';
import 'package:polymerjs/components_dartapis/paper_icon_button.dart';
export 'package:polymerjs/components_dartapis/paper_tab.dart';
import 'package:polymerjs/components_dartapis/paper_tab.dart';
export 'package:polymerjs/components_dartapis/paper_tabs.dart';
import 'package:polymerjs/components_dartapis/paper_tabs.dart';
export 'package:polymerjs/components_dartapis/paper_menu.dart';
import 'package:polymerjs/components_dartapis/paper_menu.dart';
export 'package:polymerjs/components_dartapis/paper_toast.dart';
import 'package:polymerjs/components_dartapis/paper_toast.dart';
export 'package:polymerjs/components_dartapis/paper_toolbar.dart';
import 'package:polymerjs/components_dartapis/paper_toolbar.dart';
export 'package:polymerjs/components_dartapis/paper_fab.dart';
import 'package:polymerjs/components_dartapis/paper_fab.dart';
export 'package:polymerjs/components_dartapis/paper_toggle_button.dart';
import 'package:polymerjs/components_dartapis/paper_toggle_button.dart';
export 'package:polymerjs/components_dartapis/paper_button.dart';
import 'package:polymerjs/components_dartapis/paper_button.dart';
export 'package:polymerjs/components_dartapis/iron_iconset_svg.dart';
import 'package:polymerjs/components_dartapis/iron_iconset_svg.dart';
export 'package:polymerjs/components_dartapis/iron_collapse.dart';
import 'package:polymerjs/components_dartapis/iron_collapse.dart';
export 'package:polymerjs/components_dartapis/iron_iconset.dart';
import 'package:polymerjs/components_dartapis/iron_iconset.dart';
export 'package:polymerjs/components_dartapis/iron_icon.dart';
import 'package:polymerjs/components_dartapis/iron_icon.dart';
export 'package:polymerjs/components_dartapis/paper_header_panel.dart';
import 'package:polymerjs/components_dartapis/paper_header_panel.dart';
export 'package:polymerjs/components_dartapis/paper_item.dart';
import 'package:polymerjs/components_dartapis/paper_item.dart';
export 'package:polymerjs/components_dartapis/paper_drawer_panel.dart';
import 'package:polymerjs/components_dartapis/paper_drawer_panel.dart';
export 'package:polymerjs/components_dartapis/iron_pages.dart';
import 'package:polymerjs/components_dartapis/iron_pages.dart';
export 'package:polymerjs/components_dartapis/iron_autogrow_textarea.dart';
import 'package:polymerjs/components_dartapis/iron_autogrow_textarea.dart';

Map<String, Function> elementConstructors = {
  'iron-autogrow-textarea' : (element) => new IronAutogrowTextarea.from(element),
  'iron-pages' : (element) => new IronPages.from(element),
  'paper-drawer-panel' : (element) => new PaperDrawerPanel.from(element),
  'paper-item' : (element) => new PaperItem.from(element),
  'paper-header-panel' : (element) => new PaperHeaderPanel.from(element),
  'iron-icon' : (element) => new IronIcon.from(element),
  'iron-iconset' : (element) => new IronIconset.from(element),
  'iron-collapse' : (element) => new IronCollapse.from(element),
  'iron-iconset-svg' : (element) => new IronIconsetSvg.from(element),
  'paper-button' : (element) => new PaperButton.from(element),
  'paper-toggle-button' : (element) => new PaperToggleButton.from(element),
  'paper-fab' : (element) => new PaperFab.from(element),
  'paper-toolbar' : (element) => new PaperToolbar.from(element),
  'paper-toast' : (element) => new PaperToast.from(element),
  'paper-menu' : (element) => new PaperMenu.from(element),
  'paper-tabs' : (element) => new PaperTabs.from(element),
  'paper-tab' : (element) => new PaperTab.from(element),
  'paper-icon-button' : (element) => new PaperIconButton.from(element),
  'paper-radio-button' : (element) => new PaperRadioButton.from(element),
  'paper-material' : (element) => new PaperMaterial.from(element),
  'paper-input' : (element) => new PaperInput.from(element),
  'paper-dialog' : (element) => new PaperDialog.from(element),
  'paper-checkbox' : (element) => new PaperCheckbox.from(element),
  'paper-progress' : (element) => new PaperProgress.from(element),
  'google-calendar' : (element) => new GoogleCalendar.from(element),
};