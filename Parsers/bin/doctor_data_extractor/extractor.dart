import 'package:html/dom.dart';

import 'extractors/specialization_extractor.dart';

class Extractor {
  final Document document;

  const Extractor(this.document);

  String? get aboutDoctor {
    var aboutDoctorText = document.querySelector(
        "#__next > div > div.MainContainerstyle__WrapperContainer-sc-jzlwim-0.jEPiCa > div.MainContainerstyle__Container-sc-jzlwim-1.knppsE > div > div > div > div.Gridstyle__ColStyle-sc-1lgtuty-0.eRQQJV > div:nth-child(2) > div.CardWithIconInTitlestyle__Content-sc-d5o05g-3.hNPmGo > span");
    return aboutDoctorText?.text;
  }

  String? get getDetailedSpecialization {
    SpecializationExtractor extractor = SpecializationExtractor(document);
    return extractor.extract();
  }

  Map<String, String?>? get singleCommentMap {
    String? comment = _singleComment;
    if (comment == null) return null;
    return {
      'comment': comment,
      'commenter': _singleCommenter,
      'date': _singleCommentDate,
    };
  }

  String? get _singleComment {
    var element = document.querySelector(
        "#__next > div > div.MainContainerstyle__WrapperContainer-sc-jzlwim-0.jEPiCa > div.MainContainerstyle__Container-sc-jzlwim-1.knppsE > div > div > div > div.Gridstyle__ColStyle-sc-1lgtuty-0.eRQQJV > div.Cardstyle__CardContainer-sc-1rtf8lp-0.HksLi > div > div.Gridstyle__ColStyle-sc-1lgtuty-0.iaZcPp > div.ProfileDoctorCardstyle__ReviewCard-sc-1u0n0d5-14.ckTlCi > span");
    return element?.text;
  }

  String? get _singleCommenter {
    var element = document.querySelector(
        "#__next > div > div.MainContainerstyle__WrapperContainer-sc-jzlwim-0.jEPiCa > div.MainContainerstyle__Container-sc-jzlwim-1.knppsE > div > div > div > div.Gridstyle__ColStyle-sc-1lgtuty-0.eRQQJV > div.Cardstyle__CardContainer-sc-1rtf8lp-0.HksLi > div > div.Gridstyle__ColStyle-sc-1lgtuty-0.iaZcPp > div.ProfileDoctorCardstyle__ReviewCard-sc-1u0n0d5-14.ckTlCi > div > span.ProfileDoctorCardstyle__FlexRow-sc-1u0n0d5-16.cNMpMk > span.ProfileDoctorCardstyle__ReviewerPatient-sc-1u0n0d5-18.biTahA");
    return element?.text;
  }

  String? get _singleCommentDate {
    var element = document.querySelector(
        "#__next > div > div.MainContainerstyle__WrapperContainer-sc-jzlwim-0.jEPiCa > div.MainContainerstyle__Container-sc-jzlwim-1.knppsE > div > div > div > div.Gridstyle__ColStyle-sc-1lgtuty-0.eRQQJV > div.Cardstyle__CardContainer-sc-1rtf8lp-0.HksLi > div > div.Gridstyle__ColStyle-sc-1lgtuty-0.iaZcPp > div.ProfileDoctorCardstyle__ReviewCard-sc-1u0n0d5-14.ckTlCi > div > span.ProfileDoctorCardstyle__FlexRow-sc-1u0n0d5-16.cNMpMk > span.ProfileDoctorCardstyle__ReviewDate-sc-1u0n0d5-19.dXQbDy");
    return element?.text;
  }
}
