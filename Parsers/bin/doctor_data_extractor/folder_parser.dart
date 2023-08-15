import 'dart:io';

import 'package:path/path.dart';

class FolderParser {
  final String folderPath;

  const FolderParser(this.folderPath);

  void parse() {
    Directory directory = Directory(folderPath);
    var children = directory.listSync();
    for (var doctorFile in children) {
      String id = getDoctorId(doctorFile.path);
      print(id);
    }
  }

  String getDoctorId(String path) {
    return basename(path).replaceAll('.html', '');
  }
}
