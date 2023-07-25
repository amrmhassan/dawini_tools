import 'package:dio/dio.dart';

void main(List<String> args) async {
  Dio dio = Dio();
  await dio.download(
      'https://firebasestorage.googleapis.com/v0/b/dawini2023.appspot.com/o/v5%2Flist_pharmacies_minified.json?alt=media&token=2d45443c-e6f4-40f5-82de-2f0d671eca70',
      './data/list_pharmacies_minified.json');
  print('downloaded');
}
