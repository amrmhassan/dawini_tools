import 'dart:io';

import '../projects/doctors_scrapping/constants/variables.dart';
import 'doctor_data_extractor/extractor.dart';

void main(List<String> args) async {
  File file = File(
      'D:/Study And Work/Work/projects/flutter/Dart Mastery/dawini_tools/output_doctors/1.html');
  var document = documentParser.get(file.readAsStringSync());
  Extractor extractor = Extractor(document);

  print(extractor.getDetailedSpecialization);
}
