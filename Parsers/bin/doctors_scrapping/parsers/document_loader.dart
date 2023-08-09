import 'dart:io';

import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

class DocumentParser {
  Future<Document> get(String url) async {
    var res = await http.get(Uri.parse(url));
    String body = res.body;
    File file = File('./data/testdoctor00.html');
    file.createSync(recursive: true);
    file.writeAsStringSync(body);
    var document = parser.parse(body);
    print(document.body?.text);
    return document;
  }
}
