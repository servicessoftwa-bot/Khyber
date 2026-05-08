import 'package:get/get.dart';

class Hospital {
  final String id, name, type, address, district, phone, image;
  final double rating;
  final List<String> specialties;
  final bool emergency;
  const Hospital({required this.id, required this.name, required this.type, required this.address, required this.district, required this.phone, required this.image, required this.rating, required this.specialties, required this.emergency});
}

class HospitalsController extends GetxController {
  final selectedDistrict = 'All'.obs;
  final searchQuery = ''.obs;
  final districts = ['All', 'Peshawar', 'Abbottabad', 'Mardan', 'Swat', 'Kohat', 'Mansehra'];

  final hospitals = <Hospital>[
    Hospital(id: 'h1', name: 'Lady Reading Hospital', type: 'Government', address: 'Grand Trunk Road, Peshawar', district: 'Peshawar', phone: '091-9211300', image: 'https://picsum.photos/seed/hosp1/400/200', rating: 4.2, specialties: ['Cardiology', 'Neurology', 'Orthopedics', 'Oncology', 'Emergency'], emergency: true),
    Hospital(id: 'h2', name: 'Khyber Teaching Hospital', type: 'Teaching', address: 'Peshawar Road, Peshawar', district: 'Peshawar', phone: '091-9218011', image: 'https://picsum.photos/seed/hosp2/400/200', rating: 4.0, specialties: ['Surgery', 'Medicine', 'Pediatrics', 'Gynecology'], emergency: true),
    Hospital(id: 'h3', name: 'Hayatabad Medical Complex', type: 'Government', address: 'Phase 5, Hayatabad, Peshawar', district: 'Peshawar', phone: '091-9217471', image: 'https://picsum.photos/seed/hosp3/400/200', rating: 4.3, specialties: ['Burn Unit', 'Trauma', 'ICU', 'Urology'], emergency: true),
    Hospital(id: 'h4', name: 'Ayub Teaching Hospital', type: 'Teaching', address: 'Abbottabad Road, Abbottabad', district: 'Abbottabad', phone: '0992-380476', image: 'https://picsum.photos/seed/hosp4/400/200', rating: 4.1, specialties: ['Cardiology', 'ENT', 'Ophthalmology', 'Psychiatry'], emergency: true),
    Hospital(id: 'h5', name: 'Mardan Medical Complex', type: 'Government', address: 'Mardan City', district: 'Mardan', phone: '0937-871000', image: 'https://picsum.photos/seed/hosp5/400/200', rating: 3.9, specialties: ['General Medicine', 'Surgery', 'Pediatrics'], emergency: true),
    Hospital(id: 'h6', name: 'NMC Peshawar', type: 'Private', address: 'Ring Road, Peshawar', district: 'Peshawar', phone: '091-5850000', image: 'https://picsum.photos/seed/hosp6/400/200', rating: 4.5, specialties: ['IVF', 'Dermatology', 'Cosmetic Surgery', 'Dental'], emergency: false),
  ].obs;

  List<Hospital> get filteredHospitals => hospitals.where((h) {
    final matchDist = selectedDistrict.value == 'All' || h.district == selectedDistrict.value;
    final matchSearch = searchQuery.value.isEmpty || h.name.toLowerCase().contains(searchQuery.value.toLowerCase());
    return matchDist && matchSearch;
  }).toList();
}
