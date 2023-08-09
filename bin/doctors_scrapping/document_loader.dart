import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

class DocumentParser {
  Future<Document> get(String url) async {
    var res = await http.get(Uri.parse(url));
    String body = res.body;
    var document = parser.parse(body);
    return document;
  }
}
