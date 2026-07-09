import 'package:get/get.dart';

class LoadSheddingArea {
  final String id, name, district, feeder;
  final List<String> schedule;
  final int hoursPerDay;
  final bool isAffected;
  const LoadSheddingArea({
    required this.id, required this.name, required this.district,
    required this.feeder, required this.schedule,
    required this.hoursPerDay, required this.isAffected,
  });
}

class LoadSheddingController extends GetxController {
  final searchQuery     = ''.obs;
  final selectedDistrict = 'All'.obs;

  final districts = ['All', 'Peshawar', 'Mardan', 'Swat', 'Abbottabad', 'Kohat', 'Nowshera', 'Charsadda', 'Swabi', 'Haripur', 'Mansehra'];

  final areas = <LoadSheddingArea>[
    LoadSheddingArea(id: 'a1', name: 'Hayatabad Phase 1-3', district: 'Peshawar', feeder: 'Hayatabad Feeder A', schedule: ['06:00–08:00', '14:00–16:00', '22:00–00:00'], hoursPerDay: 6, isAffected: true),
    LoadSheddingArea(id: 'a2', name: 'University Town', district: 'Peshawar', feeder: 'Univ Town Feeder', schedule: ['08:00–10:00', '18:00–20:00'], hoursPerDay: 4, isAffected: true),
    LoadSheddingArea(id: 'a3', name: 'Saddar / Cantt', district: 'Peshawar', feeder: 'Saddar Feeder', schedule: ['12:00–14:00', '20:00–22:00'], hoursPerDay: 4, isAffected: true),
    LoadSheddingArea(id: 'a4', name: 'Gulbahar', district: 'Peshawar', feeder: 'Gulbahar Feeder', schedule: ['06:00–10:00', '14:00–18:00'], hoursPerDay: 8, isAffected: true),
    LoadSheddingArea(id: 'a5', name: 'Warsak Road', district: 'Peshawar', feeder: 'Warsak Feeder', schedule: ['02:00–06:00', '10:00–14:00', '18:00–22:00'], hoursPerDay: 12, isAffected: true),
    LoadSheddingArea(id: 'a6', name: 'Ring Road Corridor', district: 'Peshawar', feeder: 'Ring Road Feeder', schedule: ['00:00–04:00', '16:00–20:00'], hoursPerDay: 8, isAffected: true),
    LoadSheddingArea(id: 'a7', name: 'Mardan City', district: 'Mardan', feeder: 'Mardan City Feeder', schedule: ['06:00–10:00', '14:00–18:00'], hoursPerDay: 8, isAffected: true),
    LoadSheddingArea(id: 'a8', name: 'Takht Bhai', district: 'Mardan', feeder: 'Takht Bhai Feeder', schedule: ['08:00–12:00', '20:00–00:00'], hoursPerDay: 8, isAffected: true),
    LoadSheddingArea(id: 'a9', name: 'Mingora / Saidu Sharif', district: 'Swat', feeder: 'Mingora Feeder', schedule: ['04:00–08:00', '16:00–20:00'], hoursPerDay: 8, isAffected: true),
    LoadSheddingArea(id: 'a10', name: 'Matta Swat', district: 'Swat', feeder: 'Matta Feeder', schedule: ['00:00–06:00', '12:00–18:00'], hoursPerDay: 12, isAffected: true),
    LoadSheddingArea(id: 'a11', name: 'Abbottabad City', district: 'Abbottabad', feeder: 'Abbottabad Feeder A', schedule: ['10:00–12:00', '22:00–00:00'], hoursPerDay: 4, isAffected: true),
    LoadSheddingArea(id: 'a12', name: 'Havelian', district: 'Abbottabad', feeder: 'Havelian Feeder', schedule: ['06:00–10:00', '18:00–22:00'], hoursPerDay: 8, isAffected: true),
    LoadSheddingArea(id: 'a13', name: 'Kohat City', district: 'Kohat', feeder: 'Kohat City Feeder', schedule: ['08:00–12:00', '20:00–00:00'], hoursPerDay: 8, isAffected: true),
    LoadSheddingArea(id: 'a14', name: 'Nowshera Kalan', district: 'Nowshera', feeder: 'Nowshera Feeder', schedule: ['06:00–10:00', '14:00–18:00'], hoursPerDay: 8, isAffected: true),
    LoadSheddingArea(id: 'a15', name: 'Charsadda City', district: 'Charsadda', feeder: 'Charsadda Feeder', schedule: ['04:00–08:00', '12:00–16:00', '20:00–00:00'], hoursPerDay: 12, isAffected: true),
    LoadSheddingArea(id: 'a16', name: 'Swabi City', district: 'Swabi', feeder: 'Swabi City Feeder', schedule: ['06:00–10:00', '18:00–22:00'], hoursPerDay: 8, isAffected: true),
    LoadSheddingArea(id: 'a17', name: 'Haripur City', district: 'Haripur', feeder: 'Haripur Feeder', schedule: ['08:00–10:00', '20:00–22:00'], hoursPerDay: 4, isAffected: false),
    LoadSheddingArea(id: 'a18', name: 'Mansehra City', district: 'Mansehra', feeder: 'Mansehra Feeder', schedule: ['06:00–08:00', '18:00–20:00'], hoursPerDay: 4, isAffected: true),
  ];

  List<LoadSheddingArea> get filtered {
    final q = searchQuery.value.toLowerCase();
    final d = selectedDistrict.value;
    return areas.where((a) {
      final matchQ = q.isEmpty || a.name.toLowerCase().contains(q) || a.district.toLowerCase().contains(q) || a.feeder.toLowerCase().contains(q);
      final matchD = d == 'All' || a.district == d;
      return matchQ && matchD;
    }).toList();
  }
}