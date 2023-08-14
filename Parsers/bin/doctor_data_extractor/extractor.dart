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
}
