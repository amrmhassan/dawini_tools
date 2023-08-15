import 'dart:convert';
import 'dart:io';

import 'package:uuid/uuid.dart';

// i will recognize doctors by their ids
// and save files by their ids also

void main(List<String> args) async {
  // String folderPath = Platform.isWindows
  //     ? 'D:/Study And Work/Work/projects/flutter/Dart Mastery/dawini_tools/output_doctors'
  //     : '/home/ubuntu/downloads/dawini_tools/output_doctors';

  String doctorsFilePath = Platform.isWindows
      ? 'D:/Study And Work/Work/projects/flutter/Dart Mastery/dawini_tools/Parsers/data/doctors/doctors.json'
      : '/home/ubuntu/downloads/dawini_tools/final_res.json';

  // FolderParser folderParser = FolderParser(folderPath);

  // folderParser.parse();
  File file = File(doctorsFilePath);
  var doctors = jsonDecode(file.readAsStringSync()) as List;
  List<Map<String, dynamic>> doctorsMap = [];

  for (var doctor in doctors) {
    String id = doctor['id'];
    bool exists = doctorsMap.any((element) => element['id'] == id);
    if (exists) {
      var newDoctor = doctor;
      newDoctor['id'] = Uuid().v4();
      doctorsMap.add(newDoctor);
    } else {
      doctorsMap.add(doctor);
    }
  }
  File unDuplicateFile = File('unDuplicatedIdsDoctors.json');
  unDuplicateFile.writeAsStringSync(jsonEncode(doctorsMap));

  print(doctorsMap.length);
}
