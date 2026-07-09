import 'package:get/get.dart';

class BrtRoute {
  final String id, name, from, to, color;
  final List<String> stops;
  final String frequency, firstBus, lastBus;
  final double fare;
  const BrtRoute({required this.id, required this.name, required this.from, required this.to, required this.color, required this.stops, required this.frequency, required this.firstBus, required this.lastBus, required this.fare});
}

class BrtController extends GetxController {
  final searchQuery = ''.obs;

  final routes = <BrtRoute>[
    BrtRoute(id: 'r1', name: 'Green Line', from: 'Chamkani', to: 'Hayatabad', color: '0xFF27AE60',
      stops: ['Chamkani Terminal', 'Dabgari Gardens', 'Hashtnagri', 'Firdous Cinema', 'Aman Chowk', 'Tehkal', 'Warsak Road', 'Pir Zakori', 'University Road', 'Hayatabad Terminal'],
      frequency: 'Every 5 min', firstBus: '06:00', lastBus: '22:00', fare: 50),
    BrtRoute(id: 'r2', name: 'Blue Line', from: 'Peshawar Mor', to: 'Charsadda Road', color: '0xFF2980B9',
      stops: ['Peshawar Mor', 'GT Road', 'Nauthia', 'Karkhano Market', 'Mattani', 'Charsadda Terminal'],
      frequency: 'Every 8 min', firstBus: '06:30', lastBus: '21:30', fare: 40),
    BrtRoute(id: 'r3', name: 'Red Line', from: 'Hayatabad', to: 'Badaber', color: '0xFFE74C3C',
      stops: ['Hayatabad Terminal', 'Phase 5', 'Phase 6', 'Phase 7', 'Regi Lalma', 'Badaber Terminal'],
      frequency: 'Every 10 min', firstBus: '07:00', lastBus: '21:00', fare: 35),
    BrtRoute(id: 'r4', name: 'Orange Line', from: 'Gulbahar', to: 'Kohat Road', color: '0xFFE67E22',
      stops: ['Gulbahar Chowk', 'Saddar', 'Cantt', 'Khyber Bazar', 'Kohat Road Terminal'],
      frequency: 'Every 12 min', firstBus: '06:00', lastBus: '22:00', fare: 45),
  ];

  List<BrtRoute> get filtered {
    final q = searchQuery.value.toLowerCase();
    if (q.isEmpty) return routes;
    return routes.where((r) => r.name.toLowerCase().contains(q) || r.from.toLowerCase().contains(q) || r.to.toLowerCase().contains(q) || r.stops.any((s) => s.toLowerCase().contains(q))).toList();
  }
}