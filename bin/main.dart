// List<int> corruptedImages = [
//   19,
//   46,
//   56,
//   63,
//   69,
//   113,
//   153,
//   171,
//   186,
//   197,
//   210,
//   223,
//   240,
//   272,
//   273,
//   274,
//   373,
//   392,
//   393,
//   416,
//   459,
//   468,
//   471,
//   484,
//   495,
//   502,
//   527,
//   564,
//   565,
//   590,
//   614,
//   643,
//   640,
//   665,
//   671,
//   666,
//   677,
//   735,
//   847,
//   862,
//   880,
//   900,
//   970,
//   980,
//   981,
//   993,
//   1038,
//   1039,
//   1040,
//   1083,
//   1084,
//   1242,
//   1246,
//   1270,
//   1271,
//   1279,
//   1288,
//   1287,
//   1318,
//   1314,
//   1313,
//   1323,
//   1324,
//   1334,
//   1345,
//   1357,
//   1373,
//   1374,
//   1398,
//   1399,
//   1433,
// ];

String panadol = 'panadol';
Map<String, String> lettersMap = {
  'ex': 'اكس',
  'a': 'ا',
  'b': 'ب',
  'c': 'ك',
  'd': 'د',
  'e': 'إ',
  'f': 'ف',
  'g': 'ج',
  'h': 'ه',
  'i': 'ي',
  'j': 'ج',
  'k': 'ك',
  'l': 'ل',
  'm': 'م',
  'n': 'ن',
  'o': 'و',
  'p': 'ب',
  'q': 'ق',
  'r': 'ر',
  's': 'س',
  't': 'ت',
  'u': 'يو',
  'v': 'ف',
  'w': 'و',
  'x': 'اكس',
  'y': 'ي',
  'z': 'ز',
  '1': 'وان',
  '2': 'تو',
  '3': 'ثري',
  '4': 'فور',
  '5': 'فايف',
};

String transTrans(String term) {
  String copy = term;
  // var letters = term.toLowerCase().split('');
  // String newWord = '';
  // for (var letter in letters) {
  //   String mapped = lettersMap[letter] ?? letter;
  //   newWord += mapped;
  // }
  // return newWord;
  lettersMap.forEach((key, value) {
    copy = copy.replaceAll(value, key);
  });
  return copy;
}

String trans(String term) {
  String copy = term;
  // var letters = term.toLowerCase().split('');
  // String newWord = '';
  // for (var letter in letters) {
  //   String mapped = lettersMap[letter] ?? letter;
  //   newWord += mapped;
  // }
  // return newWord;
  lettersMap.forEach((key, value) {
    copy = copy.replaceAll(key, value);
  });
  return copy;
}

void main(List<String> args) {
  // List drugsFile =
  //     json.decode(File('./data/drugs.json').readAsStringSync()) as List;
  // int sum = 0;
  // int count = 0;
  // for (var drug in drugsFile) {
  //   String tradeName = (drug['tradename'] as String).split(' ').first;
  //   sum += tradeName.length;
  //   count++;
  // }
  // print(sum);
  // print(count);
  String arabic = trans('abimol');
  print(arabic);
}
