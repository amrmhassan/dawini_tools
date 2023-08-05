import 'dart:io';
import 'package:html/parser.dart' as parser;

// this is the script to scape the doctors data from this website https://www.vezeeta.com/ar/%D8%AF%D9%83%D8%AA%D9%88%D8%B1/%D9%83%D9%84-%D8%A7%D9%84%D8%AA%D8%AE%D8%B5%D8%B5%D8%A7%D8%AA/%D9%85%D8%B5%D8%B1
String url =
    'https://www.vezeeta.com/ar/%D8%AF%D9%83%D8%AA%D9%88%D8%B1/%D9%83%D9%84-%D8%A7%D9%84%D8%AA%D8%AE%D8%B5%D8%B5%D8%A7%D8%AA/%D9%85%D8%B5%D8%B1';
File mainPageFile = File('./data/doctors/main_page.html');
String get fileContent => mainPageFile.readAsStringSync();

//! use this as follows
//! 1- get all doctors data links and store them with a random access file each one in a line to use them later and log each doctor id and index
//! 2- use stored list with all doctor links to scrape each doctor data
//! 3- for the governorate of the doctor use a custom list of governorate and each area in it (cairo =>[almaady, ramsis, etc...])
void main(List<String> args) async {
  // var res = await http.get(Uri.parse(url));
  // String body = res.body;
  // mainPageFile.writeAsStringSync(body);
  // BeautifulSoup bs = BeautifulSoup(mainPageFile.readAsStringSync());
  // print(bs.text);
  var document = parser.parse(fileContent);
  var element = document.querySelector('[data-testid="doctor-card-9"]');
  print(element?.text);
}
