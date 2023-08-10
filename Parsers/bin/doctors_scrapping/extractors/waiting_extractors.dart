import 'package:html/dom.dart';

class WaitingExtractors {
  final Element _parent;
  const WaitingExtractors(this._parent);

  String? get waiting {
    String? method1Res = method1();
    if (method1Res != null) return method1Res;
    String? method2Res = method2();
    if (method2Res != null) return method2Res;
    String? method3Res = method3();
    if (method3Res != null) return method3Res;

    return null;
  }

  String? method1() {
    String? content = _parent
        .querySelector(
            "span > div.CommonStylesstyle__ColDirection-sc-1vkcu2o-1.dfaYOD > div.Gridstyle__ColStyle-sc-1lgtuty-0.cIJIvF > span.DoctorCardstyle__HideOnMobile-sc-uptab2-0.wnblj > span.DoctorCardstyle__Text-sc-uptab2-4.lhhnfH")
        ?.text;
    return content;
  }

  String? method2() {
    String? content = _parent
        .querySelector(
            "span > div.CommonStylesstyle__ColDirection-sc-1vkcu2o-1.dfaYOD > div.Gridstyle__ColStyle-sc-1lgtuty-0.cIJIvF > span.DoctorCardstyle__HideOnMobile-sc-uptab2-0.wnblj > span.DoctorCardstyle__Text-sc-uptab2-4.gbzkPK")
        ?.text;
    return content;
  }

  String? method3() {
    String? content = _parent
        .querySelector(
            "span > div.CommonStylesstyle__ColDirection-sc-1vkcu2o-1.dfaYOD > div.Gridstyle__ColStyle-sc-1lgtuty-0.cIJIvF > span.DoctorCardstyle__HideOnMobile-sc-uptab2-0.wnblj > span.DoctorCardstyle__Text-sc-uptab2-4.kWJmxw")
        ?.text;
    return content;
  }
}
