import 'package:get/get.dart';

class MarbleProduct {
  final String id, name, type, origin, supplier, district, finish, emoji, color, image;
  final double pricePerSqFt;
  final bool available;
  const MarbleProduct({required this.id, required this.name, required this.type, required this.origin, required this.supplier, required this.district, required this.finish, required this.pricePerSqFt, required this.emoji, required this.color, required this.image, required this.available});
}

class MarbleController extends GetxController {
  final searchQuery = ''.obs;
  final selectedType = 'All'.obs;
  final types = ['All', 'Marble', 'Granite', 'Onyx', 'Limestone', 'Stone'];

  final products = <MarbleProduct>[
    MarbleProduct(id: 'm1', name: 'Ziarat White Marble', type: 'Marble', origin: 'Ziarat, Buner', supplier: 'Buner Marble Works', district: 'Buner', finish: 'Polished', pricePerSqFt: 180, emoji: '⬜', color: 'Pure White', image: 'https://images.unsplash.com/photo-1564540574859-0dfb63985953?w=200&h=140&fit=crop', available: true),
    MarbleProduct(id: 'm2', name: 'Mohmand Black Marble', type: 'Marble', origin: 'Mohmand', supplier: 'Mohmand Stone Co.', district: 'Mohmand', finish: 'Polished', pricePerSqFt: 220, emoji: '⬛', color: 'Jet Black', image: 'https://images.unsplash.com/photo-1565793298595-6a879b1d9492?w=200&h=140&fit=crop', available: true),
    MarbleProduct(id: 'm3', name: 'Swat Green Onyx', type: 'Onyx', origin: 'Swat', supplier: 'Swat Minerals', district: 'Swat', finish: 'Polished', pricePerSqFt: 350, emoji: '🟩', color: 'Forest Green', image: 'https://images.unsplash.com/photo-1617791160536-598cf32026fb?w=200&h=140&fit=crop', available: true),
    MarbleProduct(id: 'm4', name: 'KPK Beige Marble', type: 'Marble', origin: 'Charsadda', supplier: 'KPK Stone Hub', district: 'Charsadda', finish: 'Honed', pricePerSqFt: 150, emoji: '🟨', color: 'Cream Beige', image: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=200&h=140&fit=crop', available: true),
    MarbleProduct(id: 'm5', name: 'Khyber Grey Granite', type: 'Granite', origin: 'Mardan', supplier: 'Mardan Granite Works', district: 'Mardan', finish: 'Polished', pricePerSqFt: 200, emoji: '🪨', color: 'Silver Grey', image: 'https://images.unsplash.com/photo-1565793298595-6a879b1d9492?w=200&h=140&fit=crop', available: true),
    MarbleProduct(id: 'm6', name: 'Brown Limestone', type: 'Limestone', origin: 'Kohat', supplier: 'Kohat Stone Traders', district: 'Kohat', finish: 'Natural', pricePerSqFt: 90, emoji: '🟫', color: 'Earthy Brown', image: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=200&h=140&fit=crop', available: true),
    MarbleProduct(id: 'm7', name: 'Red Sandstone', type: 'Stone', origin: 'Peshawar', supplier: 'Peshawar Stone Mart', district: 'Peshawar', finish: 'Rough', pricePerSqFt: 120, emoji: '🔴', color: 'Terracotta Red', image: 'https://images.unsplash.com/photo-1604076913837-52ab5629fde9?w=200&h=140&fit=crop', available: true),
    MarbleProduct(id: 'm8', name: 'Honey Onyx', type: 'Onyx', origin: 'Swat', supplier: 'Swat Minerals', district: 'Swat', finish: 'Polished', pricePerSqFt: 400, emoji: '🟧', color: 'Honey Gold', image: 'https://images.unsplash.com/photo-1617791160536-598cf32026fb?w=200&h=140&fit=crop', available: false),
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