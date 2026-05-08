import 'package:get/get.dart';

class EducationInstitute {
  final String id, name, type, level, address, district, phone, image;
  final double rating;
  final List<String> programs;
  const EducationInstitute({required this.id, required this.name, required this.type, required this.level, required this.address, required this.district, required this.phone, required this.image, required this.rating, required this.programs});
}

class EducationController extends GetxController {
  final selectedType = 'All'.obs;
  final selectedDistrict = 'All'.obs;
  final searchQuery = ''.obs;
  final types = ['All', 'University', 'College', 'School', 'Tuition', 'Vocational'];
  final districts = ['All', 'Peshawar', 'Abbottabad', 'Mardan', 'Swat', 'Kohat'];

  final institutes = <EducationInstitute>[
    EducationInstitute(id: 'e1', name: 'University of Peshawar', type: 'University', level: 'Undergraduate / Postgraduate', address: 'University Campus, Peshawar', district: 'Peshawar', phone: '091-9216742', image: 'https://picsum.photos/seed/edu1/400/200', rating: 4.4, programs: ['BS Computer Science', 'MBA', 'LLB', 'BS Engineering', 'Medical']),
    EducationInstitute(id: 'e2', name: 'CECOS University', type: 'University', level: 'Undergraduate / Postgraduate', address: 'Hayatabad, Peshawar', district: 'Peshawar', phone: '091-5831937', image: 'https://picsum.photos/seed/edu2/400/200', rating: 4.2, programs: ['Software Engineering', 'Business', 'Civil Engineering', 'Pharmacy']),
    EducationInstitute(id: 'e3', name: 'Abbottabad University', type: 'University', level: 'Undergraduate / Postgraduate', address: 'Abbottabad City', district: 'Abbottabad', phone: '0992-380221', image: 'https://picsum.photos/seed/edu3/400/200', rating: 4.1, programs: ['BS IT', 'BS Agriculture', 'MBA', 'BS Forestry']),
    EducationInstitute(id: 'e4', name: 'Edwardes College Peshawar', type: 'College', level: 'Intermediate / Undergraduate', address: 'Saddar, Peshawar', district: 'Peshawar', phone: '091-5279420', image: 'https://picsum.photos/seed/edu4/400/200', rating: 4.5, programs: ['FSc Pre-Medical', 'FSc Pre-Engineering', 'ICS', 'ICOM', 'BA']),
    EducationInstitute(id: 'e5', name: 'Peshawar Model School', type: 'School', level: 'Primary / Secondary', address: 'University Road, Peshawar', district: 'Peshawar', phone: '091-9218500', image: 'https://picsum.photos/seed/edu5/400/200', rating: 4.3, programs: ['O-Level', 'Matric', 'Primary', 'KG']),
    EducationInstitute(id: 'e6', name: 'KPK Technical Training Center', type: 'Vocational', level: 'Diploma / Certificate', address: 'Industrial Estate, Peshawar', district: 'Peshawar', phone: '091-2215600', image: 'https://picsum.photos/seed/edu6/400/200', rating: 4.0, programs: ['Auto Mechanics', 'Electrician', 'Plumbing', 'Computer Basics', 'Welding']),
  ].obs;

  List<EducationInstitute> get filteredInstitutes => institutes.where((e) {
    final matchType = selectedType.value == 'All' || e.type == selectedType.value;
    final matchDist = selectedDistrict.value == 'All' || e.district == selectedDistrict.value;
    final matchSearch = searchQuery.value.isEmpty || e.name.toLowerCase().contains(searchQuery.value.toLowerCase());
    return matchType && matchDist && matchSearch;
  }).toList();
}
