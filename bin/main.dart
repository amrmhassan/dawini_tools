import 'package:dio/dio.dart';

void main(List<String> args) async {
  Dio dio = Dio();
  await dio.download(
      'https://firebasestorage.googleapis.com/v0/b/dawini2023.appspot.com/o/v5%2Fpharmacies.json?alt=media&token=4ec05314-1570-4cb7-8bdf-bccb8b0e07cc',
      './data/pharmacies.json');
  print('downloaded');
}
