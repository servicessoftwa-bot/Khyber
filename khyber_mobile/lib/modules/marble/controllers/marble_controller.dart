import 'package:get/get.dart';

class MarbleProduct {
  final String id, name, type, origin, supplier, district, finish;
  final double pricePerSqFt;
  final String emoji, color;
  final bool available;
  const MarbleProduct({required this.id, required this.name, required this.type, required this.origin, required this.supplier, required this.district, required this.finish, required this.pricePerSqFt, required this.emoji, required this.color, required this.available});
}

class MarbleController extends GetxController {
  final searchQuery = ''.obs;
  final selectedType = 'All'.obs;
  final types = ['All', 'Marble', 'Granite', 'Onyx', 'Limestone', 'Stone'];

  final products = <MarbleProduct>[
    MarbleProduct(id: 'm1', name: 'Ziarat White Marble', type: 'Marble', origin: 'Ziarat, Buner', supplier: 'Buner Marble Works', district: 'Buner', finish: 'Polished', pricePerSqFt: 180, emoji: '⬜', color: 'Pure White', available: true),
    MarbleProduct(id: 'm2', name: 'Mohmand Black Marble', type: 'Marble', origin: 'Mohmand', supplier: 'Mohmand Stone Co.', district: 'Mohmand', finish: 'Polished', pricePerSqFt: 220, emoji: '⬛', color: 'Jet Black', available: true),
    MarbleProduct(id: 'm3', name: 'Swat Green Onyx', type: 'Onyx', origin: 'Swat', supplier: 'Swat Minerals', district: 'Swat', finish: 'Polished', pricePerSqFt: 350, emoji: '🟩', color: 'Forest Green', available: true),
    MarbleProduct(id: 'm4', name: 'KPK Beige Marble', type: 'Marble', origin: 'Charsadda', supplier: 'KPK Stone Hub', district: 'Charsadda', finish: 'Honed', pricePerSqFt: 150, emoji: '🟨', color: 'Cream Beige', available: true),
    MarbleProduct(id: 'm5', name: 'Khyber Grey Granite', type: 'Granite', origin: 'Mardan', supplier: 'Mardan Granite Works', district: 'Mardan', finish: 'Polished', pricePerSqFt: 200, emoji: '🪨', color: 'Silver Grey', available: true),
    MarbleProduct(id: 'm6', name: 'Brown Limestone', type: 'Limestone', origin: 'Kohat', supplier: 'Kohat Stone Traders', district: 'Kohat', finish: 'Natural', pricePerSqFt: 90, emoji: '🟫', color: 'Earthy Brown', available: true),
    MarbleProduct(id: 'm7', name: 'Red Sandstone', type: 'Stone', origin: 'Peshawar', supplier: 'Peshawar Stone Mart', district: 'Peshawar', finish: 'Rough', pricePerSqFt: 120, emoji: '🔴', color: 'Terracotta Red', available: true),
    MarbleProduct(id: 'm8', name: 'Honey Onyx', type: 'Onyx', origin: 'Swat', supplier: 'Swat Minerals', district: 'Swat', finish: 'Polished', pricePerSqFt: 400, emoji: '🟧', color: 'Honey Gold', available: false),
  ];

  List<MarbleProduct> get filtered {
    final q = searchQuery.value.toLowerCase();
    final t = selectedType.value;
    return products.where((p) {
      final matchQ = q.isEmpty || p.name.toLowerCase().contains(q) || p.origin.toLowerCase().contains(q) || p.supplier.toLowerCase().contains(q);
      final matchT = t == 'All' || p.type == t;
      return matchQ && matchT;
    }).toList();
  }
}