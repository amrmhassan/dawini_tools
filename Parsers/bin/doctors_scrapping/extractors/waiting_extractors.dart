import 'package:html/dom.dart';

import '../parsers/info_extractor.dart';

class WaitingExtractors {
  final Element _parent;
  const WaitingExtractors(this._parent);

  String? get waiting {
    String? method1Res = method1();
    if (method1Res != null) return method1Res;
    String? method2Res = method2();
    if (method2Res != null) return method2Res;

    return null;
  }

  String? method1() {
    String? content = _parent
        .querySelector(
            "span > div.CommonStylesstyle__ColDirection-sc-1vkcu2o-1.dfaYOD > div.Gridstyle__ColStyle-sc-1lgtuty-0.cIJIvF > span.DoctorCardstyle__HideOnMobile-sc-uptab2-0.wnblj > span.DoctorCardstyle__Text-sc-uptab2-4.lhhnfH")
        ?.text;
    if (content == null) return null;
    return content;
  }

  String? method2() {
    String? content = _parent
        .querySelector(
            "span > div.CommonStylesstyle__ColDirection-sc-1vkcu2o-1.dfaYOD > div.Gridstyle__ColStyle-sc-1lgtuty-0.cIJIvF > div.DoctorCardstyle__DoctorRatingWrapper-sc-uptab2-9.bxsqEC")
        ?.text;
    if (content == null) return null;
    content = clean(content);
    content = content!.replaceAll('التقييم العام من', '');
    content = content.replaceAll('زاروا الدكتور', '');
    content = content.trim();
    return content;
  }
}
