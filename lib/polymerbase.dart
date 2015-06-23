library polymerjs.polymerbase;

import 'dart:js';
import 'dart:html';
import 'package:polymerjs/jsutils.dart';

// TODO write more tests

/// PolymerBase acts as a base prototype for all Polymer elements.
///
/// The properties reflected here are the combined view of all features found in
/// this library. There may be more properties added via other libraries, as well.
abstract class PolymerBase {
  dynamic operator [](String propertyName);
  void operator []=(String propertyName, dynamic value);

  /// Array of objects to extend this prototype with.
  ///
  /// Each entry in the array may specify either a behavior object or array of
  /// behaviors.
  ///
  /// Each behavior object may define lifecycle callbacks, `properties`,
  /// `hostAttributes`, `observers` and `listeners`.
  ///
  /// Lifecycle callbacks will be called for each behavior in the order given in
  /// the behaviors array, followed by the callback on the prototype.
  /// Additionally, any non-lifecycle functions on the behavior object are mixed
  /// into the base prototype, such that same-named functions on the prototype
  /// take precedence, followed by later behaviors over earlier behaviors.
  List<JsObject> get behaviors => this['behaviors'];

  /// Object containing entries specifying event listeners to create on each
  /// instance of this element, where keys specify the event name and values
  /// specify the name of the handler method to call on this prototype.
  Map get listeners => dartify(this['listeners']);

  /// Object containing property configuration data, where keys are property names
  /// and values are descriptor objects that configure Polymer features for the
  /// property.
  Map get properties => dartify(this['properties']);

  /// Convenience method to run querySelector on this local DOM scope.
  /// This function calls `Polymer.dom(this.root).querySelector(slctr)`.
  ///
  /// [selectors] Selector to run on this local DOM scope.
  ///
  /// @return Returns the element found by the selector, or null if not found.
  HtmlElement $$(String selectors) => this[r'$$'](selectors);

  /// Removes an item from an array, if it exists.
  ///
  /// [path] Path to array from which to remove the item (or the array itself).
  ///
  /// [item] Item to remove.
  ///
  /// @return The array containing item removed.
  List arrayDelete(String path, dynamic item) =>
      this['arrayDelete'](path, item);

  /// Runs a callback function asyncronously.
  ///
  /// By default (if no waitTime is specified), async callbacks are run at
  /// microtask timing, which will occur before paint.
  ///
  /// [callback] The callback function to run, bound to this.
  ///
  /// [waitTime] Time to wait before calling the callback. If unspecified or 0,
  /// the callback will be run at microtask timing (before paint).
  ///
  /// @return Returns a number that may be used to cancel the async job.
  int async(Function callback, [int waitTime]) =>
      this['async'](callback, waitTime);

  /// Polymer library implementation of the Custom Elements attachedCallback.
  void attachedCallback() => this['attachedCallback']();

  /// Removes an HTML attribute from one node, and adds it to another.
  ///
  /// [name] HTML attribute name.
  ///
  /// [toElement] New element to add the attribute to.
  ///
  /// [fromElement] Old element to remove the attribute from.
  void attributeFollows(
          String name, HtmlElement toElement, HtmlElement fromElement) =>
      this['attributeFollows'](name, toElement, fromElement);

  /// Cancels an async operation started with async.
  ///
  /// [handle] Handle returned from original async call to cancel.
  void cancelAsync(int handle) => this['cancelAsync'](handle);

  /// Cancels an active debouncer. The `callback` will not be called.
  ///
  /// [jobName] The name of the debouncer started with debounce.
  void cancelDebouncer(String jobName) => this['cancelDebouncer'](jobName);

  /// Removes a class from one node, and adds it to another.
  ///
  /// [name] CSS class name.
  ///
  /// [toElement] New element to add the class to.
  ///
  /// [fromElement] Old element to remove the class from.
  void classFollows(
          String name, HtmlElement toElement, HtmlElement fromElement) =>
      this['classFollows'](name, toElement, fromElement);

  /// Convenience method for creating an element and configuring it.
  ///
  /// [tag] HTML element tag to create.
  ///
  /// [props] Map of properties to configure on the instance.
  create(String tag, [Map props]) =>
      this['create'](tag, props == null ? null : new JsObject.jsify(props));

  /// Call `debounce` to collapse multiple requests for a named task into one
  /// invocation which is made after the wait time has elapsed with no new request.
  /// If no wait time is given, the callback will be called at microtask timing
  /// (guaranteed before paint).
  ///
  /// [jobName] String to indentify the debounce job.
  ///
  /// [callback] Function that is called (with `this` context) when the wait time
  /// elapses.
  ///
  /// [wait] Optional wait time in milliseconds (ms) after the last signal that
  /// must elapse before invoking `callback`.
  void debounce(String jobName, Function callback, [int wait]) =>
      this['debounce'](jobName, callback, wait);

  /// Converts a string to a typed value.
  ///
  /// This method is called by Polymer when reading HTML attribute values to JS
  /// properties. Users may override this method on Polymer element prototypes
  /// to provide deserialization for custom types. Note, the type argument is
  /// the value of the type field provided in the properties configuration object
  /// for a given property, and is by convention the constructor for the type to
  /// deserialize.
  ///
  /// Note: The return value of `undefined` is used as a sentinel value to indicate
  /// the attribute should be removed.
  ///
  /// [value] Attribute value to deserialize.
  ///
  /// [type] Type to deserialize the string to.
  ///
  /// @return value deserialized from the provided string.
  deserialize(String value, Type type) =>
      dartify(this['deserialize'](value, jsTypeFromDart[type]));

  /// Force this element to distribute its children to its local dom. A user
  /// should call `distributeContent` if distribution has been invalidated due
  /// to changes to selectors on child elements that effect distribution that
  /// were not made via `Polymer.dom`. For example, if an element contains an
  /// insertion point with `<content select=".foo">` and a foo class is added to
  /// a child, then `distributeContent` must be called to update local dom
  /// distribution.
  distributeContent() => this['distributeContent']();

  /// Return the element whose local dom within which this element is contained.
  /// This is a shorthand for `Polymer.dom(this).getOwnerRoot().host`.
  domHost() => this['domHost']();

  /// Polyfill for Element.prototype.matches, which is sometimes still prefixed.
  ///
  /// [selector] Selector to test.
  ///
  /// [node] Element to test the selector against.
  ///
  /// @return Returns true if the element matches the selector.
  bool elementMatches(String selector, [Element node]) =>
      this['elementMatches'](selector, node);

  /// Dispatches a custom event with an optional detail object.
  ///
  /// [type] Name of event type.
  ///
  /// [detail] Detail object containing event-specific payload.
  ///
  /// [options] Object specifying options. These may include bubbles (boolean),
  /// cancelable (boolean), and node on which to fire the event (HTMLElement,
  /// defaults to this).
  ///
  /// @return Returns new event that was fired.
  CustomEvent fire(String type, [Map detail, Map options]) => this['fire'](type,
      detail == null ? null : new JsObject.fromBrowserObject(detail),
      options == null ? null : new JsObject.fromBrowserObject(options));

  /// Immediately calls the debouncer callback and inactivates it.
  ///
  /// [jobName] The name of the debouncer started with `debounce`.
  void flushDebouncer(String jobName) => this['flushDebouncer'](jobName);

  /// Convienence method for reading a value from a path.
  ///
  /// Note, if any part in the path is undefined, this method returns `undefined`
  /// (this method does not throw when dereferencing undefined paths).
  ///
  /// [path] Path to the value to read. The path may be specified as a string
  /// (e.g. foo.bar.baz) or an array of path parts (e.g. ['foo.bar', 'baz']).
  /// Note that bracketed expressions are not supported; string-based path parts
  /// must be separated by dots. Note that when dereferencing array indicies,
  /// the index may be used as a dotted part directly (e.g. users.12.name or
  /// ['users', 12, 'name']).
  ///
  /// [root] Root object from which the path is evaluated.
  ///
  /// @return at the path, or undefined if any part of the path is undefined.
  get(String path, [root]) => this['get'](path, root);

  /// Returns a list of nodes distributed to this element's `<content>`.
  ///
  /// If this element contans more than one `<content>` in its local DOM, an
  /// optional selector may be passed to choose the desired content.
  ///
  /// [slctr] CSS selector to choose the desired <content>. Defaults to content.
  ///
  /// @return Returns list of distributed nodes for the `<content>`.
  List<Node> getContentChildNodes([String slctr]) =>
      this['getContentChildNodes'](slctr);

  /// Returns a list of element children distributed to this element's `<content>`.
  ///
  /// If this element contains more than one `<content>` in its local DOM, an
  /// optional selector may be passed to choose the desired content. This method
  /// differs from `getContentChildNodes` in that only elements are returned.
  ///
  /// [slctr] CSS selector to choose the desired <content>. Defaults to content.
  ///
  /// @return Returns list of distributed elements for the `<content>`.
  List<HtmlElement> getContentChildren([String slctr]) =>
      this['getContentChildren'](slctr);

  /// Returns the native element prototype for the tag specified.
  ///
  /// Returns Object prototype for specified tag.
  JsObject getNativePrototype(String tag) => this['getNativePrototype'](tag);

  /// Returns a property descriptor object for the property specified.
  ///
  /// This method allows introspecting the configuration of a Polymer element's
  /// properties as configured in its `properties` object. Note, this method
  /// normalizes shorthand forms of the `properties` object into longhand form.
  ///
  /// [property] Name of property to introspect.
  ///
  /// @return descriptor for specified property.
  JsObject getPropertyInfo(String property) =>
      this['getPropertyInfo'](property);

  /// Convenience method for importing an HTML document imperatively.
  ///
  /// This method creates a new `<link rel="import">` element with the provided
  /// URL and appends it to the document to start loading. In the onload callback,
  /// the `import` property of the `link` element will contain the imported
  /// document contents.
  ///
  /// [href] URL to document to load.
  ///
  /// [onload] Callback to notify when an import successfully loaded.
  ///
  /// [onerror] Callback to notify when an import unsuccessfully loaded.
  ///
  /// @return link element for the URL to be loaded.
  LinkElement importHref(String href, [Function onload, Function onerror]) =>
      this['importHref'](href, onload, onerror);

  /// Calls `importNode` on the `content` of the template specified and returns
  /// a document fragment containing the imported content.
  ///
  /// [template] HTML template element to instance.
  ///
  /// @return fragment containing the imported template content.
  DocumentFragment instanceTemplate(TemplateElement template) =>
      this['instanceTemplate'](template);

  /// Returns whether a named debouncer is active.
  ///
  /// [jobName] The name of the debouncer started with debounce
  ///
  /// @return true if the debouncer is active (has not yet fired).
  bool isDebouncerActive(String jobName) => this['isDebouncerActive'](jobName);

  /// Aliases one data path as another, such that path notifications from one are
  /// routed to the other.
  ///
  /// [to] Target path to link.
  ///
  /// [from] Source path to link.
  void linkPaths(String to, [String from]) => this['linkPaths'](to, from);

  /// Convenience method to add an event listener on a given element, late bound
  /// to a named method on this element.
  ///
  /// [node] Element to add event listener to
  ///
  /// [eventName] Name of event to listen for.
  ///
  /// [methodName] Name of handler method on `this` to call.
  void listen(HtmlElement node, String eventName, String methodName) =>
      this['listen'](node, eventName, methodName);

  /// Copies props from a source object to target a target object.
  ///
  /// Note, this method ueses a simple `for...in` strategy for enumerating
  /// properties. To ensure only `ownProperties` are copied from source to target
  /// and that accessor implementations are copied, use `extend`.
  ///
  /// [target] Target object to copy properties to.
  ///
  /// [source] Source object to copy properties from.
  void mixin(JsObject target, JsObject source) => this['mixin'](target, source);

  /// Notify that a path has changed.
  ///
  /// Returns true if notification actually took place, based on a dirty check
  /// of whether the new value was already known
  ///
  /// @return Returns true if notification actually took place, based on a dirty
  /// check of whether the new value was already known
  bool notifyPath(String path, JsObject value, [bool fromAbove]) =>
      this['notifyPath'](path, value, fromAbove);

  /// Removes an item from the end of array at the path specified.
  ///
  /// The arguments after path and return value match that of `Array.prototype.pop`.
  ///
  /// This method notifies other paths to the same array that a splice occurred
  /// to the array.
  ///
  /// [String] Path to array.
  ///
  /// @return Returns item that was removed.
  pop(String path) => this['pop'](path);

  /// Adds items onto the end of the array at the path specified.
  ///
  /// The arguments after path and return value match that of `Array.prototype.push`.
  ///
  /// This method notifies other paths to the same array that a splice occurred
  /// to the array.
  ///
  /// [path] Path to array.
  ///
  /// @return Returns length of the array.
  int push(String path) => this['push'](path);

  /// Lifecycle callback invoked when all local DOM children of this element have
  /// been created and "configured" with data bound from this element, attribute
  /// values, or defaults.
  ready() => this['ready']();

  /// Serializes a property to its associated attribute.
  ///
  /// Generally users should set `reflectToAttribute: true` in the properties
  /// configuration to achieve automatic attribute reflection.
  ///
  /// [name] Property name to reflect.
  void reflectPropertyToAttribute(String name) =>
      this['reflectPropertyToAttribute'](name);

  /// Rewrites a given URL relative to the original location of the document
  /// containing the dom-module for this element. This method will return the
  /// same URL before and after vulcanization.
  ///
  /// [url] URL to resolve.
  ///
  /// @return URL relative to the import
  String resolveUrl(String url) => this['resolveUrl'](url);

  /// Apply style scoping to the specified container and all its descendants.
  /// If [shouldObserve] is true, changes to the container are monitored via mutation
  /// observer and scoping is applied.
  ///
  /// This method is useful for ensuring proper local DOM CSS scoping for elements
  /// created in this local DOM scope, but out of the control of this element
  /// (i.e., by a 3rd-party library) when running in non-native Shadow DOM
  /// environments.
  ///
  /// [container] Element to scope.
  ///
  /// [shouldObserve] When true, monitors the container for changes and re-applies
  /// scoping for any future changes.
  scopeSubtree(HtmlElement container, [bool shouldObserve = false]) =>
      this['scopeSubtree'](container, shouldObserve);

  /// Converts a typed value to a string.
  ///
  /// This method is called by Polymer when setting JS property values to HTML
  /// attributes. Users may override this method on Polymer element prototypes
  /// to provide serialization for custom types.
  ///
  /// [value] Property value to serialize.
  ///
  /// @return Returns string serialized from the provided property value.
  String serialize(value) => this['serialize'](value);

  /// Sets a typed value to an HTML attribute on a node.
  ///
  /// This method calls the `serialize` method to convert the typed value to a
  /// string. If the `serialize` method returns `undefined`, the attribute will be
  /// removed (this is the default for boolean type `false`).
  ///
  /// [value] Value to serialize.
  ///
  /// [attribute] Attribute name to serialize to.
  ///
  /// [node] Element to set attribute to (defaults to this).
  HtmlElement serializeValueToAttribute(
          value, String attribute, [HtmlElement node]) =>
      this['serializeValueToAttribute'](value, attribute, node);

  /// Convienence method for setting a value to a path and notifying any elements
  /// bound to the same path.
  ///
  /// Note, if any part in the path except for the last is undefined, this method
  /// does nothing (this method does not throw when dereferencing undefined paths).
  ///
  /// [path] Path to the value to read. The path may be specified as a string
  /// (e.g. foo.bar.baz) or an array of path parts (e.g. ['foo.bar', 'baz']).
  /// Note that bracketed expressions are not supported; string-based path parts
  /// must be separated by dots. Note that when dereferencing array indicies,
  /// the index may be used as a dotted part directly (e.g. users.12.name or
  /// ['users', 12, 'name']).
  dynamic set(String path, value, [JsObject root]) =>
      this['set'](path, value, root);

  /// Override scrolling behavior to all direction, one direction, or none.
  ///
  /// Valid scroll directions:
  ///
  /// * 'all': scroll in any direction
  /// * 'x': scroll only in the 'x' direction
  /// * 'y': scroll only in the 'y' direction
  /// * 'none': disable scrolling for this node
  ///
  /// [direction] Direction to allow scrolling Defaults to `all`.
  ///
  /// [node] Element to apply scroll direction setting. Defaults to this.
  void setScrollDirection(direction, [node]) =>
      this['setScrollDirection'](direction, node);

  /// Removes an item from the beginning of array at the path specified.
  ///
  /// The arguments after path and return value match that of `Array.prototype.pop`.
  ///
  /// This method notifies other paths to the same array that a splice occurred
  /// to the array.
  ///
  /// [path] Path to array.
  ///
  /// @return Item that was removed.
  shift(String path) => this['shift'](path);

  /// Starting from the start index specified, removes 0 or more items from the
  /// array and inserts 0 or more new itms in their place.
  ///
  /// The arguments after path and return value match that of `Array.prototype.splice`.
  ///
  /// This method notifies other paths to the same array that a splice occurred
  /// to the array.
  ///
  /// [path] Path to array.
  ///
  /// [start] Index from which to start removing/inserting.
  ///
  /// [deleteCount] Number of items to remove.
  ///
  /// @return Returns length of the array.
  int splice(String path, int start, int deleteCount) =>
      this['splice'](path, start, deleteCount);

  /// Toggles an HTML attribute on or off.
  ///
  /// [name] HTML attribute name.
  ///
  /// [shouldAdd] Boolean to force the attribute on or off. When unspecified,
  /// the state of the attribute will be reversed.
  ///
  /// [node] Node to target. Defaults to `this`.
  void toggleAttribute(String name, [bool shouldAdd, HtmlElement node]) =>
      this['toggleAttribute'](name, shouldAdd, node);

  /// Toggles a CSS class on or off.
  ///
  /// [name] CSS class name.
  ///
  /// [shouldAdd] Boolean to force the class on or off. When unspecified, the state
  /// of the class will be reversed.
  ///
  /// [node] Node to target. Defaults to this.
  void toggleClass(String name, [bool shouldAdd, HtmlElement node]) =>
      this['toggleClass'](name, shouldAdd, node);

  /// Cross-platform helper for setting an element's CSS transform property.
  ///
  /// [transform] Transform setting.
  ///
  /// [node] Element to apply the transform to. Defaults to `this`.
  void transform(String transform, [HtmlElement node]) =>
      this['transform'](transform, node);

  /// Cross-platform helper for setting an element's CSS translate3d property.
  ///
  /// [x] X offset.
  ///
  /// [y] Y offset.
  ///
  /// [z] Z offset.
  ///
  /// [node] Element to apply the transform to. Defaults to `this`.
  void translate3d(num x, num y, num z, [HtmlElement node]) =>
      this['translate3d'](x, y, z, node);

  /// Removes a data path alias previously established with `linkPaths`.
  ///
  /// Note, the path to unlink should be the target (`to`) used when linking the
  /// paths.
  ///
  /// [path] Target path to unlink.
  void unlinkPaths(String path) => this['unlinkPaths'](path);

  /// The arguments after path and return value match that of `Array.prototype.push`.
  ///
  /// This method notifies other paths to the same array that a splice occurred
  /// to the array.
  ///
  /// [path] Path to array.
  ///
  /// @return Returns length of the array.
  int unshift(String path) => this['unshift'](path);

  /// Re-evaluates and applies custom CSS properties based on dynamic changes to
  /// this element's scope, such as adding or removing classes in this element's
  /// local DOM.
  ///
  /// For performance reasons, Polymer's custom CSS property shim relies on this
  /// explicit signal from the user to indicate when changes have been made that
  /// affect the values of custom properties.
  void updateStyles() => this['updateStyles']();
}
