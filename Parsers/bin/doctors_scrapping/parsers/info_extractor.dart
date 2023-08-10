import 'package:html/dom.dart';

import '../constants/urls.dart';
import '../extractors/price_extractors.dart';
import '../extractors/rating_extractor.dart';
import '../extractors/visitors_extractors.dart';
import '../extractors/waiting_extractors.dart';
import '../models/doctor_model.dart';

class DoctorInfo {
  final Element _document;
  final int page;
  const DoctorInfo(this._document, this.page);

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
      rating: _rating,
      page: page,
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
    String? rawTitle = _document
        .querySelector(
            "span > div.CommonStylesstyle__ColDirection-sc-1vkcu2o-1.dfaYOD > div.Gridstyle__ColStyle-sc-1lgtuty-0.cIJIvF > p")
        ?.text;
    rawTitle = clean(rawTitle);
    return rawTitle;
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
    PriceExtractor extractor = PriceExtractor(_document);
    double? price = extractor.price;
    return price;
  }

  String? get _waiting {
    WaitingExtractors extractors = WaitingExtractors(_document);
    return extractors.waiting;
  }

//! this rating extractor give false results
  double? get _rating {
    RatingExtractor extractor = RatingExtractor(_document);
    return extractor.rating;
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
