import 'dart:convert';
import 'dart:io';

import 'doctor_data_extractor/extractor.dart';

void main(List<String> args) async {
  File file = File('./Parsers/data/doctors/doctors.json');
  var list = jsonDecode(file.readAsStringSync()) as List;
  for (var doctor in list) {
    String link = doctor['link'];
    Extractor extractor = Extractor(link);
    await extractor.extract();
    break;
  }
}
