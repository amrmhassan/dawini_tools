import 'package:html/dom.dart';
import 'package:html/parser.dart' as parser;

class DocumentParser {
  Document get(String content) {
    var document = parser.parse(content);
    return document;
  }
}
