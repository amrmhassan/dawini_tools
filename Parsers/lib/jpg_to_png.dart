import 'dart:io';

String imagesDirLink = 'E:/RembgTool/drugs';

void main(List<String> args) {
  Directory directory = Directory(imagesDirLink);
  var children = directory.listSync();
  for (var image in children) {
    String newPath = image.path;
    newPath = newPath.replaceAll('.jpg', '.png');
    image.renameSync(newPath);
    print(newPath);
  }
  print('all done');
}
