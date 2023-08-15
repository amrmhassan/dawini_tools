import 'dart:convert';
import 'dart:io';

import 'doctor_data_extractor/folder_parser.dart';

// i will recognize doctors by their ids
// and save files by their ids also

void main(List<String> args) async {
  String folderPath = Platform.isWindows
      ? 'D:/Study And Work/Work/projects/flutter/Dart Mastery/dawini_tools/output_doctors'
      : '/home/ubuntu/downloads/dawini_tools/output_doctors';

  String doctorsFilePath = Platform.isWindows
      ? 'D:/Study And Work/Work/projects/flutter/Dart Mastery/dawini_tools/Parsers/data/doctors/doctors.json'
      : '/home/ubuntu/downloads/dawini_tools/final_res.json';

  FolderParser folderParser = FolderParser(folderPath);

  folderParser.parse();
  File file = File(doctorsFilePath);
  var doctors = jsonDecode(file.readAsStringSync()) as List;
  print(doctors.length);
}
