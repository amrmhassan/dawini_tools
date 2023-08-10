class DoctorModel {
  final String? id;
  final String? link;
  final String? name;
  final String? title;
  final int? visitors;
  final String? mainSpecialization;
  final List<String>? subSpecializations;
  final List<String?>? character;
  final String? address;
  final double? price;
  final String? waiting;

  const DoctorModel({
    required this.name,
    required this.title,
    required this.visitors,
    required this.mainSpecialization,
    required this.subSpecializations,
    required this.character,
    required this.address,
    required this.price,
    required this.waiting,
    required this.id,
    required this.link,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'link': link,
      'name': name,
      'title': title,
      'visitors': visitors,
      'mainSpecialization': mainSpecialization,
      // 'subSpecializations': subSpecializations,
      // 'character': character,
      'address': address,
      'price': price,
      'waiting': waiting,
    };
  }
}
