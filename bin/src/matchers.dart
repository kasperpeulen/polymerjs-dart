library polymerjs.matchers;

class Matchers {
  static RegExp get behavior {
    String skipOpening = r'(?:behaviors: \[)';
    String behaviors = r'([\s\S]*?)';
    String skipEnd = r'(?:\])';
    return new RegExp('$skipOpening$behaviors$skipEnd');
  }

  static RegExp get propertiesUntilEnd {
    return new RegExp(r'(properties: \{)([\s\S]+)');
  }

  static RegExp get property {
    /// Matches /** .. */ property: { type: String, value: 'default' },
    String longProperty = () {
      String docs = r'(/\*\*(?:[\s\S](?!\/\*\*))*?\*\/)';
      String skipWhiteSpace = r'(?:\s+)';
      String name = r'(\w+)';
      String skipOpening = r'(?:: ?\{\s+)';
      String rawInfo = r'([\s\S]*?)';
      String skipEnd = r'(?:\},)';
      return '$docs$skipWhiteSpace$name$skipOpening$rawInfo$skipEnd';
    }();

    /// Matches /** ... */ property: String,
    String shortProperty = () {
      String docs = r'(/\*\*(?:[\s\S](?!\/\*\*))*?\*\/)';
      String skipWhiteSpace = r'(?:\s+)';
      String name = r'(\w+)';
      String skipOpening = r'(?:: ?)';
      String rawInfo = r'(\w+)';
      String skipEnd = r'(?:\s*?,)';
      return '$docs$skipWhiteSpace$name$skipOpening$rawInfo$skipEnd';
    }();
    return new RegExp('$longProperty|$shortProperty');
  }

  static RegExp get method {
    String docs = r'(/\*\*(?:[\s\S](?!\/\*\*))*?\*\/)';
    String skipWhiteSpace = r'(?:\s+)';
    String name = r'(\w+)';
    String args = r'([\S\s]*?)';
    String function = r'(?:: function\(' + args + r'\))';
    return new RegExp(docs + skipWhiteSpace + name + function);
  }

  static RegExp get getter {
    String docs = r'(/\*\*(?:[\s\S](?!\/\*\*))*?\*\/)';
    String skipWhiteSpace = r'(?:\s+)';
    String getText = r'(?:get )';
    String name = r'(\w+)';
    String skipEnd = r'(?:\(\) ?\{)';
    return new RegExp(docs + skipWhiteSpace + getText + name + skipEnd);
  }

  static RegExp htmlComment = new RegExp(r'<!--([\s\S]*?)-->');

  static RegExp scriptDocs = new RegExp(r'(/\*\*(?:[\s\S](?!\/\*\*))*?\*\/)');

  static RegExp commentChars = new RegExp(r'[\&*|\*/|\/\*\*]');

  static RegExp pragma = new RegExp(r"\s*@([\w-]*) (.*)");

  static RegExp param = new RegExp(r'\{([\S]*?)\}\s+(\w+)');

  static RegExp returns = new RegExp(r'\{([\S]*?)\}');

  static RegExp behaviorInBehavior(String behavior) {
    String name = 'Polymer.$behavior';
    String skipOpening = r'(?:' + name + r' = \[)';
    String behaviors = r'([^\{\}]*?)';
    String skipEnd = r'(?:\])';
    return new RegExp('$skipOpening$behaviors$skipEnd');
  }
}
