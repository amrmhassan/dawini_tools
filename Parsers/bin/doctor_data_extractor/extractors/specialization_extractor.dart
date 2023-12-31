import 'package:html/dom.dart';

class SpecializationExtractor {
  final Document document;
  const SpecializationExtractor(this.document);

  String? extract() {
    var detailsSpecialization = document.querySelector(
        "#__next > div > div.MainContainerstyle__WrapperContainer-sc-jzlwim-0.jEPiCa > div.MainContainerstyle__Container-sc-jzlwim-1.knppsE > div > div > div > div.Gridstyle__ColStyle-sc-1lgtuty-0.eRQQJV > div.Cardstyle__CardContainer-sc-1rtf8lp-0.HksLi > div > div.Gridstyle__ColStyle-sc-1lgtuty-0.iaZcPp");
    var parsed = detailsSpecialization?.children.skip(3).toList();
    if (parsed == null) return null;

    bool hazard = _containsHazard(_getContent(parsed));
    if (hazard) {
      return _method2(parsed);
    } else {
      return _method1(parsed);
    }
  }

  bool _containsHazard(String content) {
    bool condition1 = content.contains('التقييم العام من');
    bool condition2 = content.contains('زاروا الدكتور');
    return condition1 && condition2;
  }

  String _getContent(List<Element> parsed) {
    var string = parsed.map((e) => e.text).join('');
    string = string.replaceAll(':', '');
    return string;
  }

  String? _method1(List<Element> parsed) {
    parsed.removeLast();
    parsed.removeLast();
    parsed.removeLast();
    return _getContent(parsed);
  }

  String _method2(List<Element> parsed) {
    parsed.removeLast();
    parsed.removeLast();
    parsed.removeLast();
    parsed.removeLast();
    return _getContent(parsed);
  }
}
