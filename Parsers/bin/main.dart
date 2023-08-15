import 'dart:convert';
import 'dart:io';

import '../projects/doctors_scrapping/constants/variables.dart';
import 'doctor_data_extractor/extractor.dart';

// i will recognize doctors by their ids
// and save files by their ids also

void main(List<String> args) async {
  String folderPath = Platform.isWindows
      ? 'D:/Study And Work/Work/projects/flutter/Dart Mastery/dawini_tools/output_doctors/'
      : '/home/ubuntu/downloads/dawini_tools/Parsers/bin/doctors_data_downloader/output_doctors/';

  String doctorsFilePath = Platform.isWindows
      ? 'D:/Study And Work/Work/projects/flutter/Dart Mastery/dawini_tools/Parsers/unDuplicatedIdsDoctors.json'
      : '/home/ubuntu/downloads/dawini_tools/Parsers/unDuplicatedIdsDoctors.json';

  // FolderParser folderParser = FolderParser(folderPath);

  File originalDoctors = File(doctorsFilePath);

  var doctorsDataRaw = jsonDecode(originalDoctors.readAsStringSync()) as List;
  List<Map<String, dynamic>> doctorsData = doctorsDataRaw.cast();
  List<Map<String, dynamic>> doctorsDataV2 = [];

  for (var doctor in doctorsData) {
    String id = doctor['id'];
    String additionalDataFilePath = '$folderPath$id.html';
    File doctorFile = File(additionalDataFilePath);
    if (!doctorFile.existsSync()) {
      print('doctor $id doesn\'t exist');
      continue;
    }

    String content = doctorFile.readAsStringSync();
    var document = documentParser.get(content);
    Extractor extractor = Extractor(document);
    String? about = extractor.aboutDoctor;
    String? detailedSpecialization = extractor.getDetailedSpecialization;
    Map? singleCommentMap = extractor.singleCommentMap;
    String? imageLink = extractor.imageLink;

    Map<String, dynamic> fullDoctor = doctor;
    fullDoctor['about'] = about;
    fullDoctor['detailedSpecialization'] = detailedSpecialization;
    fullDoctor['singleCommentMap'] = singleCommentMap;
    fullDoctor['imageLink'] = imageLink;
    doctorsDataV2.add(fullDoctor);
    print('$id Done');
  }
  File file = File('doctors_data_v2.json');
  file.writeAsStringSync(jsonEncode(doctorsDataV2));
  print('all done');
}
