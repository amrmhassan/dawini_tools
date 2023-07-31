import 'dart:convert';
import 'dart:io';

var bigFile =
    json.decode(File('./data/list_pharmacies_minified.json').readAsStringSync())
        as List;

List govs = [];
List currentLocations = [];
List currentPharmacies = [];
String? currentGov;
String? currentLocation;
Map<String, dynamic>? currentPharmacy;

void main(List<String> args) async {
  List<String> names = [];
  List<String> duplicate = [];
  for (var govEntry in bigFile) {
    currentGov = govEntry['gov'];
    var locations = govEntry['locations'] as List;
    for (var locationEntry in locations) {
      currentLocation = locationEntry['location'];
      var pharms = locationEntry['pharms'] as List;
      for (var pharmEntry in pharms) {
        String name = pharmEntry['tel'] + pharmEntry['name'];
        if (names.contains(name)) {
          //
          duplicate.add(name);
        } else {
          names.add(name);
        }
      }
    }
  }

  print('all done');
  print(names.length);
  print(duplicate.length);
}
