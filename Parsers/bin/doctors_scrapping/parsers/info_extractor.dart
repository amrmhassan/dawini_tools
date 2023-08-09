import '../../main.dart';
import '../constants/urls.dart';

class InfoExtractor {
  Future<int> pagesNumber() async {
    String url = Urls.mainUrl;

    var document = await documentParser.get(url);
    var element = document
        .querySelector("#search-doctors-page__Pagination-page-no--1035");
    String value = element?.text ?? '';
    print(value);

    return 0;
  }
}
