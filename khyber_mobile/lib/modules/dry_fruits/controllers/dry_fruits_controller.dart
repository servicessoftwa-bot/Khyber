import 'package:get/get.dart';

class DryFruitItem {
  final String id, name, origin, seller, district, emoji, category;
  final double pricePerKg;
  final double rating;
  final bool inStock;
  const DryFruitItem({required this.id, required this.name, required this.origin, required this.seller, required this.district, required this.emoji, required this.category, required this.pricePerKg, required this.rating, required this.inStock});
}

class DryFruitsController extends GetxController {
  final searchQuery = ''.obs;
  final selectedCategory = 'All'.obs;
  final categories = ['All', 'Dry Fruits', 'Nuts', 'Honey', 'Seeds'];

  final items = <DryFruitItem>[
    DryFruitItem(id: 'd1', name: 'Walnut (Akhrot)', origin: 'Chitral', seller: 'Chitral Organics', district: 'Chitral', emoji: '🫘', category: 'Dry Fruits', pricePerKg: 2200, rating: 4.8, inStock: true),
    DryFruitItem(id: 'd2', name: 'Almond (Badam)', origin: 'Dir', seller: 'Dir Valley Foods', district: 'Dir', emoji: '🌰', category: 'Nuts', pricePerKg: 2800, rating: 4.7, inStock: true),
    DryFruitItem(id: 'd3', name: 'Apricot (Khumani)', origin: 'Swat', seller: 'Swat Dry Fruits', district: 'Swat', emoji: '🍑', category: 'Dry Fruits', pricePerKg: 1200, rating: 4.9, inStock: true),
    DryFruitItem(id: 'd4', name: 'Pine Nuts (Chilgoza)', origin: 'Waziristan', seller: 'KPK Traders', district: 'Peshawar', emoji: '🌲', category: 'Nuts', pricePerKg: 8000, rating: 4.9, inStock: true),
    DryFruitItem(id: 'd5', name: 'Raisin (Kishmish)', origin: 'Swat', seller: 'Swat Organics', district: 'Swat', emoji: '🍇', category: 'Dry Fruits', pricePerKg: 900, rating: 4.6, inStock: true),
    DryFruitItem(id: 'd6', name: 'Fig (Anjeer)', origin: 'Peshawar', seller: 'Qissa Khwani Bazaar', district: 'Peshawar', emoji: '🫐', category: 'Dry Fruits', pricePerKg: 1500, rating: 4.5, inStock: true),
    DryFruitItem(id: 'd7', name: 'Wild Honey (Jungle)', origin: 'Kohistan', seller: 'Kohistan Honey', district: 'Kohistan', emoji: '🍯', category: 'Honey', pricePerKg: 4500, rating: 5.0, inStock: true),
    DryFruitItem(id: 'd8', name: 'Sidr Honey', origin: 'Swat', seller: 'Swat Pure Honey', district: 'Swat', emoji: '🍯', category: 'Honey', pricePerKg: 3800, rating: 4.9, inStock: true),
    DryFruitItem(id: 'd9', name: 'Mountain Honey', origin: 'Kaghan', seller: 'Kaghan Bee Farm', district: 'Mansehra', emoji: '🍯', category: 'Honey', pricePerKg: 3200, rating: 4.8, inStock: true),
    DryFruitItem(id: 'd10', name: 'Pumpkin Seeds', origin: 'Mardan', seller: 'Mardan Organics', district: 'Mardan', emoji: '🎃', category: 'Seeds', pricePerKg: 600, rating: 4.4, inStock: true),
    DryFruitItem(id: 'd11', name: 'Mulberry (Shahtoot)', origin: 'Peshawar', seller: 'KPK Harvest', district: 'Peshawar', emoji: '🫐', category: 'Dry Fruits', pricePerKg: 800, rating: 4.5, inStock: false),
    DryFruitItem(id: 'd12', name: 'Pistachio (Pista)', origin: 'Afghanistan (via KPK)', seller: 'Karkhano Market', district: 'Peshawar', emoji: '🟢', category: 'Nuts', pricePerKg: 4200, rating: 4.7, inStock: true),
  ];

  List<DryFruitItem> get filtered {
    final q = searchQuery.value.toLowerCase();
    final cat = selectedCategory.value;
    return items.where((i) {
      final matchQ = q.isEmpty || i.name.toLowerCase().contains(q) || i.origin.toLowerCase().contains(q) || i.seller.toLowerCase().contains(q);
      final matchCat = cat == 'All' || i.category == cat;
      return matchQ && matchCat;
    }).toList();
  }
}