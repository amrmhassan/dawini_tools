import 'package:html/dom.dart';

import '../parsers/info_extractor.dart';

class PriceExtractor {
  final Element _parent;
  const PriceExtractor(this._parent);

  double? get price {
    double? method1Res = _converter(_method1());
    if (method1Res != null) return method1Res;
    double? method2Res = _converter(_method2());
    if (method2Res != null) return method2Res;
    // double? method3Res = _converter(method3());
    // if (method3Res != null) return method3Res;

    return null;
  }

  String? _method1() {
    var container = _parent.querySelector(
        "span > div.CommonStylesstyle__ColDirection-sc-1vkcu2o-1.dfaYOD > div.Gridstyle__ColStyle-sc-1lgtuty-0.cIJIvF > span.DoctorCardstyle__HideOnMobile-sc-uptab2-0.wnblj");
    var line = container?.querySelector('span:nth-child(17)');
    String? priceText = line?.text;
    return priceText;
  }

  String? _method2() {
    String? content = _parent
        .querySelector(
            "span > div.CommonStylesstyle__ColDirection-sc-1vkcu2o-1.dfaYOD > div.Gridstyle__ColStyle-sc-1lgtuty-0.cIJIvF > span.DoctorCardstyle__HideOnMobile-sc-uptab2-0.wnblj > span:nth-child(8)")
        ?.text;
    return content;
  }

  // String? method3() {
  //   String? content = _parent
  //       .querySelector(
  //           "span > div.CommonStylesstyle__ColDirection-sc-1vkcu2o-1.dfaYOD > div.Gridstyle__ColStyle-sc-1lgtuty-0.cIJIvF > span.DoctorCardstyle__HideOnMobile-sc-uptab2-0.wnblj > span:nth-child(9)")
  //       ?.text;
  //   return content;
  // }
}

double? _converter(String? price) {
  return arabicToNumber(price);
}
