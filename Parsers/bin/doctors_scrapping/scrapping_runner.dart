import 'package:html/dom.dart';
import 'constants/variables.dart';

class ScrappingRunner {
  final String? dataPath;
  ScrappingRunner({
    this.dataPath,
  });
  void run() {
    String content = fileReader.read(1, dataPath);
    Document document = documentParser.get(content);
    print(document.body?.text);
  }
}
