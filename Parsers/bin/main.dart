import 'dart:convert';
import 'dart:io';

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
  var doctorsRaw = jsonDecode(file.readAsStringSync()) as List;
  List<Map<String, dynamic>> doctors = doctorsRaw.cast();

  List<String> doctorsIds = [];
  List<String> duplicate = [];

  for (var doctor in doctors) {
    String calcedId = doctor.values.fold(
        '', (previousValue, element) => previousValue + element.toString());
    bool exists = doctorsIds.contains(calcedId);
    if (exists) {
      duplicate.add(calcedId);
    } else {
      doctorsIds.add(calcedId);
    }
  }
  print(doctorsIds.length);
  print(duplicate.length);
}
