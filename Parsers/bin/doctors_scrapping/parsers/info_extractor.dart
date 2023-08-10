import 'package:html/dom.dart';

import '../constants/urls.dart';
import '../extractors/visitors_extractors.dart';
import '../extractors/waiting_extractors.dart';
import '../models/doctor_model.dart';

class DoctorInfo {
  final Element _document;
  const DoctorInfo(this._document);

  DoctorModel get doctorModel {
    return DoctorModel(
      name: _name,
      title: _title,
      visitors: _visitors,
      mainSpecialization: _specialization,
      subSpecializations: null,
      character: null,
      address: _place,
      price: _price,
      waiting: _waiting,
      link: _link,
      id: _id,
    );
  }

  String? get _id {
    var aDoc = _document.attributes.entries
        .firstWhere((element) => element.key == 'id');
    return aDoc.value;
  }

  String? get _link {
    var aDoc = _document.querySelector(
        "span > div.CommonStylesstyle__ColDirection-sc-1vkcu2o-1.dfaYOD > div.Gridstyle__ColStyle-sc-1lgtuty-0.cIJIvF > a");
    var attributes =
        aDoc?.attributes.entries.firstWhere((element) => element.key == 'href');
    String? value = attributes?.value;
    if (value == null) return null;
    String finalLink = Urls.vezeeta + value;
    return finalLink;
  }

  String? get _name {
    return _document
        .querySelector(
            "span > div.CommonStylesstyle__ColDirection-sc-1vkcu2o-1.dfaYOD > div.Gridstyle__ColStyle-sc-1lgtuty-0.cIJIvF > a > h4")
        ?.text;
  }

  String? get _title {
    return _document
        .querySelector(
            "span > div.CommonStylesstyle__ColDirection-sc-1vkcu2o-1.dfaYOD > div.Gridstyle__ColStyle-sc-1lgtuty-0.cIJIvF > p")
        ?.text;
  }

  int? get _visitors {
    VisitorsExtractors extractors = VisitorsExtractors(_document);
    return extractors.visitors;
  }

  String? get _specialization {
    String? content = _document
        .querySelector(
            "span > div.CommonStylesstyle__ColDirection-sc-1vkcu2o-1.dfaYOD > div.Gridstyle__ColStyle-sc-1lgtuty-0.cIJIvF > span.DoctorCardstyle__HideOnMobile-sc-uptab2-0.wnblj > span.DoctorCardSubComponentsstyle__SpecialtyRowLimitDetailsWrapper-sc-1vq3h7c-21.jzapWu > span")
        ?.text;
    content = clean(content);
    return content;
  }

  String? get _place {
    return _document
        .querySelector(
            "span > div.CommonStylesstyle__ColDirection-sc-1vkcu2o-1.dfaYOD > div.Gridstyle__ColStyle-sc-1lgtuty-0.cIJIvF > span.DoctorCardstyle__HideOnMobile-sc-uptab2-0.wnblj > span.DoctorCardstyle__Text-sc-uptab2-4.blwPZf")
        ?.text;
  }

  double? get _price {
    var container = _document.querySelector(
        "span > div.CommonStylesstyle__ColDirection-sc-1vkcu2o-1.dfaYOD > div.Gridstyle__ColStyle-sc-1lgtuty-0.cIJIvF > span.DoctorCardstyle__HideOnMobile-sc-uptab2-0.wnblj");
    var line = container?.querySelector('span:nth-child(17)');
    String? priceText = line?.text;
    double? priceInt = arabicToNumber(priceText);
    return priceInt;
  }

  String? get _waiting {
    WaitingExtractors extractors = WaitingExtractors(_document);
    return extractors.waiting;
  }

//! this rating extractor give false results
  double? get rating {
    var doc = _document.querySelector(
        "span > div.CommonStylesstyle__ColDirection-sc-1vkcu2o-1.dfaYOD > div.Gridstyle__ColStyle-sc-1lgtuty-0.cIJIvF > div.DoctorCardstyle__DoctorRatingWrapper-sc-uptab2-9.bxsqEC > div.DoctorCardstyle__RatingContainer-sc-uptab2-10.eZRYZm > span.StarRatingstyle__StarRatingContainer-sc-16vjtpf-0.fhuNbU");
    var ratingValue = doc?.attributes.entries
        .firstWhere((element) => element.key == 'data-testid')
        .value;
    ratingValue = ratingValue?.replaceAll('star-rating__rating-value--', '');
    if (ratingValue == null) return null;
    double? ratingDouble = double.tryParse(ratingValue);
    return ratingDouble;
  }
}

String? clean(String? content) {
  content = content?.replaceAll('\n', '');
  content = content?.replaceAll(RegExp(r'\s{2,}'), ' ');
  return content;
}

String _arabicNumbers = '٠١٢٣٤٥٦٧٨٩';
double? arabicToNumber(String? arabic) {
  if (arabic == null) return null;
  arabic = arabic.trim();

  String englishRes = '';
  List<String> arabicList = _arabicNumbers.split('');
  List<String> inWorkArabicNumbers = arabic.split('');
  for (var number in inWorkArabicNumbers) {
    int index = arabicList.indexOf(number);
    if (index == -1) {
      return null;
    }
    // here get the number index and add it to the english results
    englishRes += index.toString();
  }
  double? finalNumber = double.tryParse(englishRes);
  return finalNumber;
}
