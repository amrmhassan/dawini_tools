import 'package:dio/dio.dart';

class Extractor {
  final String link;

  const Extractor(this.link);

  Future<void> extract() async {
    Dio dio = Dio();
    await dio.download(link, './doctors_data/link.html');
  }
}
