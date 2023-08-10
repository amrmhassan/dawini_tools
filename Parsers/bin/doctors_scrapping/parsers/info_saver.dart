import 'dart:convert';
import 'dart:io';

import '../models/doctor_model.dart';

class InfoSaver {
  final List<DoctorModel> _doctors;
  const InfoSaver(this._doctors);

  void saveDoctors() {
    print('Saving json file...');
    File file = File('final_res.json');
    var jsonData = _doctors.map((e) => e.toJson()).toList();
    var jsonObj = json.encode(jsonData);
    file.writeAsStringSync(jsonObj);
    print('file saved at ${file.path}');
  }
}
