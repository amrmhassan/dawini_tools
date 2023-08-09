import 'dart:convert';
import 'dart:io';

List drugsFile =
    json.decode(File('./data/drugs.json').readAsStringSync()) as List;
List arabicDrugsFile =
    json.decode(File('./data/drugs_arabic.json').readAsStringSync()) as List;
List colorsFile =
    json.decode(File('./data/drugs_colors.json').readAsStringSync()) as List;
void main(List<String> arguments) async {
  List<Map<String, dynamic>> results = [];

  for (var drug in drugsFile) {
    var obj1 = drug as Map<String, dynamic>;
    String id = (obj1['id']).toString();
    var obj2 = getArabicName(id);
    String? colors = getDrugColors(id);
    var obj3 = colors == null ? null : {'palette': colors};
    var combined = getDrugMap([obj1, obj2, obj3]);
    results.add(combined);
  }
  File resultsFile = File('./data/result.json');
  resultsFile.writeAsStringSync(json.encode(results));
  print('All done');
}

Map<String, dynamic> getArabicName(String id) {
  return arabicDrugsFile.firstWhere((element) => element['id'] == id);
}

String? getDrugColors(String id) {
  try {
    var res = (colorsFile
            .firstWhere((element) => element['id'] == id)['palette'] as List)
        .join(',');
    return res;
  } catch (e) {
    return null;
  }
}

Map<String, dynamic> getDrugMap(List<Map<String, dynamic>?> objs) {
  Map<String, dynamic> sum = {};
  for (var obj in objs) {
    if (obj != null) {
      sum = {...sum, ...obj};
    }
  }
  return sum;
}
