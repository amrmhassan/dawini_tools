import 'package:html/dom.dart';

import '../parsers/info_extractor.dart';

class RatingExtractor {
  final Element _parent;
  const RatingExtractor(this._parent);

  double? get rating {
    double? method1Res = _converter(_method1());
    if (method1Res != null) return method1Res;
    double? method2Res = _converter(_method2());
    if (method2Res != null) return method2Res;
    // double? method3Res = _converter(method3());
    // if (method3Res != null) return method3Res;

    return null;
  }

  String? _method1() {
    var doc = _parent.querySelector(
        "span > div.CommonStylesstyle__ColDirection-sc-1vkcu2o-1.dfaYOD > div.Gridstyle__ColStyle-sc-1lgtuty-0.cIJIvF > div.DoctorCardstyle__DoctorRatingWrapper-sc-uptab2-9.bxsqEC > div.DoctorCardstyle__RatingContainer-sc-uptab2-10.eZRYZm > span.StarRatingstyle__StarRatingContainer-sc-16vjtpf-0.fhuNbU");
    var ratingValue = doc?.attributes.entries
        .firstWhere((element) => element.key == 'data-testid')
        .value;
    ratingValue = ratingValue?.replaceAll('star-rating__rating-value--', '');
    return ratingValue;
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
