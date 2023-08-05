import 'dart:convert';
import 'dart:io';

List<Map<String, dynamic>> locations = [];
void main(List<String> args) {
  File file = File('./data/combined_pharmacies.json');
  var pharmaciesJSON = json.decode(file.readAsStringSync()) as List;
  for (var gov in pharmaciesJSON) {
    var locationsList = gov['locations'] as List;

    for (var location in locationsList) {
      String locationName = location['location'];
      var pharmacies = location['pharms'] as List;
      LatLng locationLatLng = getLatLngAvg(pharmacies);
      if (locationLatLng.lat != 0) {
        Map<String, dynamic> model = {
          'gov': (gov['gov']).toString(),
          'location': locationName.toString(),
          'latlng': {
            'lat': locationLatLng.lat,
            'lng': locationLatLng.lng,
          }
        };
        locations.add(model);
      }
    }
  }
  File locationsFile = File('./locations_info.json');
  var jsonContent = json.encode(locations);
  locationsFile.writeAsStringSync(jsonContent);
}

LatLng getLatLngAvg(List<dynamic> pharmacies) {
  List<double> lats = [];
  List<double> lngs = [];
  for (var pharmacy in pharmacies) {
    var location = pharmacy['pharmacyLocation'];
    LatLng? latLng =
        location == null ? null : LatLng(location['lat'], location['lng']);
    if (latLng != null) {
      lats.add(latLng.lat);
      lngs.add(latLng.lng);
    }
  }
  double avgLats =
      lats.fold(0, (previousValue, element) => previousValue + element);
  avgLats = avgLats / lats.length;
  double avgLngs =
      lngs.fold(0, (previousValue, element) => previousValue + element);
  avgLngs = avgLngs / lngs.length;
  if (lats.isEmpty) {
    return LatLng(0, 0);
  }
  return LatLng(avgLats, avgLngs);
}

class LatLng {
  final double lat;
  final double lng;
  const LatLng(this.lat, this.lng);
}
