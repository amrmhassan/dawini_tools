import 'package:html/dom.dart';

class DoctorInfo {
  final Element _document;
  const DoctorInfo(this._document);

  String? get name {
    return _document
        .querySelector(
            "span > div.CommonStylesstyle__ColDirection-sc-1vkcu2o-1.dfaYOD > div.Gridstyle__ColStyle-sc-1lgtuty-0.cIJIvF > a > h4")
        ?.text;
  }

  String? get title {
    return _document
        .querySelector(
            "span > div.CommonStylesstyle__ColDirection-sc-1vkcu2o-1.dfaYOD > div.Gridstyle__ColStyle-sc-1lgtuty-0.cIJIvF > p")
        ?.text;
  }

  int? get visitors {
    String? content = _document
        .querySelector(
            "#doctor-card__29104 > span > div.CommonStylesstyle__ColDirection-sc-1vkcu2o-1.dfaYOD > div.Gridstyle__ColStyle-sc-1lgtuty-0.cIJIvF > div.DoctorCardstyle__DoctorRatingWrapper-sc-uptab2-9.bxsqEC > div.DoctorCardstyle__RatingContainer-sc-uptab2-10.eZRYZm")
        ?.text;
    if (content == null) return null;
    content = clean(content);
    content = content!.replaceAll('التقييم العام من', '');
    content = content.replaceAll('زاروا الدكتور', '');
    content = content.trim();
    int? visitors = arabicToNumber(content);
    return visitors;
  }

  String? get specialization {
    String? content = _document
        .querySelector(
            "span > div.CommonStylesstyle__ColDirection-sc-1vkcu2o-1.dfaYOD > div.Gridstyle__ColStyle-sc-1lgtuty-0.cIJIvF > span.DoctorCardstyle__HideOnMobile-sc-uptab2-0.wnblj > span.DoctorCardSubComponentsstyle__SpecialtyRowLimitDetailsWrapper-sc-1vq3h7c-21.jzapWu > span")
        ?.text;
    content = clean(content);
    return content;
  }

  String? get place {
    return _document
        .querySelector(
            "span > div.CommonStylesstyle__ColDirection-sc-1vkcu2o-1.dfaYOD > div.Gridstyle__ColStyle-sc-1lgtuty-0.cIJIvF > span.DoctorCardstyle__HideOnMobile-sc-uptab2-0.wnblj > span.DoctorCardstyle__Text-sc-uptab2-4.blwPZf")
        ?.text;
  }

  int? get price {
    var container = _document.querySelector(
        "span > div.CommonStylesstyle__ColDirection-sc-1vkcu2o-1.dfaYOD > div.Gridstyle__ColStyle-sc-1lgtuty-0.cIJIvF > span.DoctorCardstyle__HideOnMobile-sc-uptab2-0.wnblj");
    var line = container?.querySelector('span:nth-child(17)');
    String? priceText = line?.text;
    int? priceInt = arabicToNumber(priceText);
    return priceInt;
  }

  String? get waiting {
    return _document
        .querySelector(
            "span > div.CommonStylesstyle__ColDirection-sc-1vkcu2o-1.dfaYOD > div.Gridstyle__ColStyle-sc-1lgtuty-0.cIJIvF > span.DoctorCardstyle__HideOnMobile-sc-uptab2-0.wnblj > span.DoctorCardstyle__Text-sc-uptab2-4.lhhnfH")
        ?.text;
  }
}

String? clean(String? content) {
  content = content?.replaceAll('\n', '');
  content = content?.replaceAll(RegExp(r'\s{2,}'), ' ');
  return content;
}

String _arabicNumbers = '٠١٢٣٤٥٦٧٨٩';
int? arabicToNumber(String? arabic) {
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
  int? finalNumber = int.tryParse(englishRes);
  return finalNumber;
}
