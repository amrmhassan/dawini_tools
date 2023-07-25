import 'dart:convert';
import 'dart:io';

var smallFile =
    json.decode(File('./data/pharmacies.json').readAsStringSync()) as List;

var bigFile =
    json.decode(File('./data/list_pharmacies_minified.json').readAsStringSync())
        as List;

dynamic pharmacyByPhone(String phone) {
  return smallFile.cast().firstWhere(
        (element) => element['tel'] == phone,
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
        var latlng = pharmacyByPhone(tel)?['pharmacyLocation'];
        var pharmacyObj = {
          'name': name,
          'tel': tel,
          'address': address,
          'pharmacyLocation': latlng,
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
  File resFile = File('./data/combined_pharmacies.json');
  resFile.writeAsStringSync(res);
  print('all done');
}
