import 'dart:io';

import 'package:html/dom.dart';
import 'constants/variables.dart';
import 'parsers/info_extractor.dart';

class ScrappingRunner {
  final String? dataPath;
  ScrappingRunner({
    this.dataPath,
  });
  void run() {
    String content = fileReader.read(1, dataPath);
    Document document = documentParser.get(content);
    Element? element = document.querySelector('[data-testid="doctor-card-0"]');
    if (element == null) return;

    DoctorInfo doctorInfo = DoctorInfo(element);
    print(doctorInfo.name);
    print(doctorInfo.title);
    print(doctorInfo.specialization);
    print(doctorInfo.visitors);
    print(doctorInfo.waiting);
    print(doctorInfo.price);

    File file = File('test.txt');
    file.writeAsStringSync('''
${doctorInfo.name}
${doctorInfo.title}
${doctorInfo.specialization}
${doctorInfo.place}
${doctorInfo.visitors}
${doctorInfo.waiting}
${doctorInfo.price}''');
  }
}
