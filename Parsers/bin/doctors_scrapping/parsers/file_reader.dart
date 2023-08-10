import 'dart:io';

class CustomFileReader {
  static String defaultFolderPath =
      'D:/Study And Work/Work/projects/flutter/Dart Mastery/dawini_tools/Parsers/pages';

  String read(int number, [String? dataPath]) {
    String folderPath = dataPath ?? defaultFolderPath;
    String path = '$folderPath/$number.html';
    File file = File(path);
    bool exist = file.existsSync();
    print('File $number exists:$exist');
    return file.readAsStringSync();
  }
}
