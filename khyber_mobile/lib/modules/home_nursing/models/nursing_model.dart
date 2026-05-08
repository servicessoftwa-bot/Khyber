class NursingServiceModel {
  final String id;
  final String name;
  final String description;
  final String icon;
  final int color;
  final double pricePerVisit;
  final String duration;
  final List<String> includes;

  const NursingServiceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.color,
    required this.pricePerVisit,
    required this.duration,
    required this.includes,
  });
}

class NurseModel {
  final String id;
  final String name;
  final String qualification;
  final String experience;
  final String image;
  final double rating;
  final int patients;
  final List<String> specializations;
  final bool isAvailable;

  const NurseModel({
    required this.id,
    required this.name,
    required this.qualification,
    required this.experience,
    required this.image,
    required this.rating,
    required this.patients,
    required this.specializations,
    this.isAvailable = true,
  });
}
