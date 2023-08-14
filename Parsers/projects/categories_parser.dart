import 'dart:convert';
import 'dart:io';

List<Map<String, dynamic>> reducedGroups = [];
void main(List<String> args) async {
  File file = File('./data/groups.json');
  List groups = jsonDecode(file.readAsStringSync()) as List;
  for (var group in groups) {
    String groupString = group['reduced category'];
    groupString = groupString.replaceAll('”', '');
    groupString = groupString.replaceAll('“', '');
    bool contains =
        reducedGroups.any((element) => element['group'] == groupString);
    if (!contains) {
      var obj = {
        'group': groupString,
        'translation': '',
      };
      reducedGroups.add(obj);
    }
  }
  File reducedFile = File('./data/reduced_groups.json');
  reducedFile.writeAsString(jsonEncode(reducedGroups));
}
