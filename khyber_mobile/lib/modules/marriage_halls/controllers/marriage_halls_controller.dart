import 'package:get/get.dart';

class MarriageHall {
  final String id, name, district, area, phone;
  final double ratePerEvent, rating;
  final int capacity;
  final List<String> amenities;
  final String image;
  const MarriageHall({required this.id, required this.name, required this.district, required this.area, required this.phone, required this.ratePerEvent, required this.rating, required this.capacity, required this.amenities, required this.image});
}

class MarriageHallsController extends GetxController {
  final searchQuery = ''.obs;
  final selectedDistrict = 'All'.obs;
  final districts = ['All', 'Peshawar', 'Mardan', 'Swat', 'Abbottabad', 'Nowshera'];

  final halls = <MarriageHall>[
    MarriageHall(id: 'h1', name: 'Frontier Grand Hall', district: 'Peshawar', area: 'Hayatabad', phone: '091-5820001', ratePerEvent: 250000, rating: 4.8, capacity: 1000, amenities: ['AC', 'Catering', 'Parking', 'Stage', 'Decoration', 'Generator'], image: 'https://images.unsplash.com/photo-1519167758481-83f550bb49b3?w=600'),
    MarriageHall(id: 'h2', name: 'Pearl Continental Banquet', district: 'Peshawar', area: 'Khyber Road', phone: '091-5276361', ratePerEvent: 400000, rating: 4.9, capacity: 500, amenities: ['AC', 'Catering', 'Parking', 'Stage', 'Decoration', 'Hotel Stay'], image: 'https://images.unsplash.com/photo-1464366400600-7168b8af9bc3?w=600'),
    MarriageHall(id: 'h3', name: 'Shahi Darbar Hall', district: 'Peshawar', area: 'University Road', phone: '091-5710234', ratePerEvent: 180000, rating: 4.5, capacity: 800, amenities: ['AC', 'Parking', 'Stage', 'Generator'], image: 'https://images.unsplash.com/photo-1478146896981-b80fe463b330?w=600'),
    MarriageHall(id: 'h4', name: 'Mardan Palace Hall', district: 'Mardan', area: 'Mardan City', phone: '0937-871234', ratePerEvent: 150000, rating: 4.4, capacity: 700, amenities: ['AC', 'Catering', 'Parking', 'Generator'], image: 'https://images.unsplash.com/photo-1511795409834-ef04bbd61622?w=600'),
    MarriageHall(id: 'h5', name: 'Swat Serena Events', district: 'Swat', area: 'Mingora', phone: '0946-712345', ratePerEvent: 120000, rating: 4.6, capacity: 500, amenities: ['AC', 'Catering', 'Parking', 'Garden'], image: 'https://images.unsplash.com/photo-1530103862676-de8c9debad1d?w=600'),
    MarriageHall(id: 'h6', name: 'Abbottabad Grand', district: 'Abbottabad', area: 'Abbottabad City', phone: '0992-381234', ratePerEvent: 130000, rating: 4.3, capacity: 600, amenities: ['AC', 'Parking', 'Stage', 'Decoration'], image: 'https://images.unsplash.com/photo-1478147427282-58a87a433049?w=600'),
  ];

  List<MarriageHall> get filtered {
    final q = searchQuery.value.toLowerCase();
    final d = selectedDistrict.value;
    return halls.where((h) {
      final matchQ = q.isEmpty || h.name.toLowerCase().contains(q) || h.area.toLowerCase().contains(q);
      final matchD = d == 'All' || h.district == d;
      return matchQ && matchD;
    }).toList();
  }
}