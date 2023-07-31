import 'dart:convert';
import 'dart:io';
import 'package:uuid/uuid.dart';

var smallFile =
    json.decode(File('./data/pharmacies.json').readAsStringSync()) as List;

var bigFile =
    json.decode(File('./data/list_pharmacies_minified.json').readAsStringSync())
        as List;

dynamic pharmacyByPhone(String phone) {
  return smallFile.cast().firstWhere(
        (element) => element['name'] == phone,
        orElse: () => null,
      );
}

List govs = [];
List currentLocations = [];
List currentPharmacies = [];
String? currentGov;
String? currentLocation;
Map<String, dynamic>? currentPharmacy;

void main(List<String> args) async {
  List<String> names = [];
  for (var govEntry in bigFile) {
    currentGov = govEntry['gov'];
    var locations = govEntry['locations'] as List;
    for (var locationEntry in locations) {
      currentLocation = locationEntry['location'];
      var pharms = locationEntry['pharms'] as List;
      for (var pharmEntry in pharms) {
        String name = pharmEntry['name'];
        String tel = pharmEntry['tel'];
        String address = pharmEntry['address'];
        String randomId = Uuid().v4();
        String id = pharmEntry['id'] ?? randomId;
        var latlng = pharmacyByPhone(name)?['pharmacyLocation'];
        var pharmacyObj = {
          'name': name,
          'tel': tel,
          'address': address,
          'pharmacyLocation': latlng,
          'id': id,
        };
        currentPharmacies.add(pharmacyObj);
        //? end of pharmacies loop
      }
      // create the location obj
      var locationObj = {
        "location": currentLocation,
        'pharms': [...currentPharmacies]
      };
      currentLocations.add(locationObj);
      currentPharmacies.clear();
      //? end of locations loop
    }
    var govObj = {
      'gov': currentGov,
      'locations': [...currentLocations],
    };
    currentLocations.clear();
    //? end of govs loop
    govs.add(govObj);
  }
  var res = json.encode(govs);
  File resFile = File('./pharmacies/combined_pharmacies.json');
  resFile.writeAsStringSync(res);
  print('all done');
}
