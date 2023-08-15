import 'dart:convert';
import 'dart:io';

import 'doctor_data_extractor/folder_parser.dart';

// i will recognize doctors by their ids
// and save files by their ids also

void main(List<String> args) async {
  FolderParser folderParser = FolderParser(
      'D:/Study And Work/Work/projects/flutter/Dart Mastery/dawini_tools/output_doctors');
  folderParser.parse();
  File file = File(
      'D:/Study And Work/Work/projects/flutter/Dart Mastery/dawini_tools/Parsers/data/doctors/doctors.json');
  var doctors = jsonDecode(file.readAsStringSync()) as List;
  print(doctors.length);
}
