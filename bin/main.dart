import 'dart:io';

import 'doctors_scrapping/parsers/document_loader.dart';
import 'package:http/http.dart' as http;

DocumentParser documentParser = DocumentParser();
// this is the script to scape the doctors data from this website https://www.vezeeta.com/ar/%D8%AF%D9%83%D8%AA%D9%88%D8%B1/%D9%83%D9%84-%D8%A7%D9%84%D8%AA%D8%AE%D8%B5%D8%B5%D8%A7%D8%AA/%D9%85%D8%B5%D8%B1

//! use this as follows
//! 1- get all doctors data links and store them with a random access file each one in a line to use them later and log each doctor id and index
//! 2- use stored list with all doctor links to scrape each doctor data
//! 3- for the governorate of the doctor use a custom list of governorate and each area in it (cairo =>[almaady, ramsis, etc...])
void main(List<String> args) async {
  // InfoExtractor extractor = InfoExtractor();
  // extractor.pagesNumber();
  var res = await http.get(Uri.parse(
      'https://www.vezeeta.com/ar/%D8%AF%D9%83%D8%AA%D9%88%D8%B1/%D9%83%D9%84-%D8%A7%D9%84%D8%AA%D8%AE%D8%B5%D8%B5%D8%A7%D8%AA/%D9%85%D8%B5%D8%B1?page=2'));
  String body = res.body;
  File file = File('./data/testdoctor00.html');
  file.createSync(recursive: true);
  file.writeAsStringSync(body);
}
