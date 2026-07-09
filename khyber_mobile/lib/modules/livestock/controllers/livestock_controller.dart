import 'package:get/get.dart';

class LivestockItem {
  final String id, name, breed, district, market, emoji;
  final double minPrice, maxPrice;
  final String category;
  const LivestockItem({required this.id, required this.name, required this.breed, required this.district, required this.market, required this.emoji, required this.minPrice, required this.maxPrice, required this.category});
}

class LivestockController extends GetxController {
  final searchQuery = ''.obs;
  final selectedCategory = 'All'.obs;
  final categories = ['All', 'Cattle', 'Goats', 'Sheep', 'Poultry', 'Other'];

  final items = <LivestockItem>[
    LivestockItem(id: 'l1', name: 'Bull (Desi)', breed: 'Desi', district: 'Peshawar', market: 'Chamkani Mandi', emoji: '🐂', minPrice: 80000, maxPrice: 200000, category: 'Cattle'),
    LivestockItem(id: 'l2', name: 'Bull (Sahiwal)', breed: 'Sahiwal', district: 'Mardan', market: 'Mardan Mandi', emoji: '🐂', minPrice: 150000, maxPrice: 400000, category: 'Cattle'),
    LivestockItem(id: 'l3', name: 'Cow (Milking)', breed: 'Cross Breed', district: 'Charsadda', market: 'Charsadda Mandi', emoji: '🐄', minPrice: 120000, maxPrice: 300000, category: 'Cattle'),
    LivestockItem(id: 'l4', name: 'Goat (Desi)', breed: 'Desi', district: 'Kohat', market: 'Kohat Mandi', emoji: '🐐', minPrice: 25000, maxPrice: 60000, category: 'Goats'),
    LivestockItem(id: 'l5', name: 'Goat (Beetal)', breed: 'Beetal', district: 'Peshawar', market: 'Chamkani Mandi', emoji: '🐐', minPrice: 50000, maxPrice: 120000, category: 'Goats'),
    LivestockItem(id: 'l6', name: 'Goat (Kajli)', breed: 'Kajli', district: 'Swabi', market: 'Swabi Mandi', emoji: '🐐', minPrice: 60000, maxPrice: 150000, category: 'Goats'),
    LivestockItem(id: 'l7', name: 'Sheep (Desi)', breed: 'Desi', district: 'Dir', market: 'Dir Mandi', emoji: '🐑', minPrice: 30000, maxPrice: 70000, category: 'Sheep'),
    LivestockItem(id: 'l8', name: 'Sheep (Dumbi)', breed: 'Dumbi', district: 'Bannu', market: 'Bannu Mandi', emoji: '🐑', minPrice: 50000, maxPrice: 130000, category: 'Sheep'),
    LivestockItem(id: 'l9', name: 'Broiler (per kg)', breed: 'Broiler', district: 'Peshawar', market: 'Wholesale Market', emoji: '🐔', minPrice: 350, maxPrice: 420, category: 'Poultry'),
    LivestockItem(id: 'l10', name: 'Layer Eggs (30)', breed: 'Layer', district: 'Peshawar', market: 'Wholesale Market', emoji: '🥚', minPrice: 1200, maxPrice: 1400, category: 'Poultry'),
    LivestockItem(id: 'l11', name: 'Horse (Desi)', breed: 'Desi', district: 'Nowshera', market: 'Nowshera Mandi', emoji: '🐴', minPrice: 150000, maxPrice: 600000, category: 'Other'),
    LivestockItem(id: 'l12', name: 'Donkey', breed: 'Desi', district: 'Mardan', market: 'Mardan Mandi', emoji: '🫏', minPrice: 40000, maxPrice: 80000, category: 'Other'),
  ];

  List<LivestockItem> get filtered {
    final q = searchQuery.value.toLowerCase();
    final cat = selectedCategory.value;
    return items.where((i) {
      final matchQ = q.isEmpty || i.name.toLowerCase().contains(q) || i.district.toLowerCase().contains(q);
      final matchCat = cat == 'All' || i.category == cat;
      return matchQ && matchCat;
    }).toList();
  }
}