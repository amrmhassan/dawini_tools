class DoctorModel {
  final String name;
  final String title;
  final int visitors;
  final String mainSpecialization;
  final List<String> subSpecializations;
  final List<String> character;
  final String address;
  final double price;
  final int waiting;

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
  });
}
