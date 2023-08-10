import 'dart:io';

import 'package:html/dom.dart';
import 'package:path/path.dart';
import 'constants/variables.dart';
import 'models/doctor_model.dart';
import 'parsers/file_reader.dart';
import 'parsers/info_extractor.dart';
import 'parsers/info_saver.dart';

class ScrappingRunner {
  final List<DoctorModel> _doctors = [];

  final String? dataPath;
  ScrappingRunner({
    this.dataPath,
  });
  void run() {
    _filesLooper();
    InfoSaver saver = InfoSaver(_doctors);
    saver.saveDoctors();
  }

  void _pageLooper(Document page) {
    int fileDoctors = 0;

    for (var i = 0; i < 10; i++) {
      Element? element = page.querySelector('[data-testid="doctor-card-$i"]');
      if (element == null) return;

      DoctorInfo doctorInfo = DoctorInfo(element);
      print(doctorInfo.rating);
      _doctors.add(doctorInfo.doctorModel);
      fileDoctors++;
    }
    print('File Doctors number is $fileDoctors');
  }

  void _filesLooper() {
    Directory directory = Directory(CustomFileReader.defaultFolderPath);
    var children = directory.listSync();
    for (var child in children) {
      if (child.statSync().type != FileSystemEntityType.file) continue;
      // here parse the file name to get the file number
      String name = basename(child.path);
      int number = int.parse(name.split('.').first);
      String content = fileReader.read(number, dataPath);
      Document document = documentParser.get(content);
      _pageLooper(document);
    }
  }
}
