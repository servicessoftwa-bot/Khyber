import 'package:get/get.dart';

class LivestockItem {
  final String id, name, breed, district, market, emoji, category, image;
  final double minPrice, maxPrice;
  const LivestockItem({required this.id, required this.name, required this.breed, required this.district, required this.market, required this.emoji, required this.minPrice, required this.maxPrice, required this.category, required this.image});
}

class LivestockController extends GetxController {
  final searchQuery = ''.obs;
  final selectedCategory = 'All'.obs;
  final categories = ['All', 'Cattle', 'Goats', 'Sheep', 'Poultry', 'Other'];

  final items = <LivestockItem>[
    LivestockItem(id: 'l1', name: 'Bull (Desi)', breed: 'Desi', district: 'Peshawar', market: 'Chamkani Mandi', emoji: '🐂', minPrice: 80000, maxPrice: 200000, category: 'Cattle', image: 'https://images.unsplash.com/photo-1560807707-8cc77767d783?w=200&h=140&fit=crop'),
    LivestockItem(id: 'l2', name: 'Bull (Sahiwal)', breed: 'Sahiwal', district: 'Mardan', market: 'Mardan Mandi', emoji: '🐂', minPrice: 150000, maxPrice: 400000, category: 'Cattle', image: 'https://images.unsplash.com/photo-1560807707-8cc77767d783?w=200&h=140&fit=crop'),
    LivestockItem(id: 'l3', name: 'Cow (Milking)', breed: 'Cross Breed', district: 'Charsadda', market: 'Charsadda Mandi', emoji: '🐄', minPrice: 120000, maxPrice: 300000, category: 'Cattle', image: 'https://images.unsplash.com/photo-1572524165032-7d46a4acf43a?w=200&h=140&fit=crop'),
    LivestockItem(id: 'l4', name: 'Goat (Desi)', breed: 'Desi', district: 'Kohat', market: 'Kohat Mandi', emoji: '🐐', minPrice: 25000, maxPrice: 60000, category: 'Goats', image: 'https://images.unsplash.com/photo-1484557985045-edf25e08da73?w=200&h=140&fit=crop'),
    LivestockItem(id: 'l5', name: 'Goat (Beetal)', breed: 'Beetal', district: 'Peshawar', market: 'Chamkani Mandi', emoji: '🐐', minPrice: 50000, maxPrice: 120000, category: 'Goats', image: 'https://images.unsplash.com/photo-1484557985045-edf25e08da73?w=200&h=140&fit=crop'),
    LivestockItem(id: 'l6', name: 'Goat (Kajli)', breed: 'Kajli', district: 'Swabi', market: 'Swabi Mandi', emoji: '🐐', minPrice: 60000, maxPrice: 150000, category: 'Goats', image: 'https://images.unsplash.com/photo-1484557985045-edf25e08da73?w=200&h=140&fit=crop'),
    LivestockItem(id: 'l7', name: 'Sheep (Desi)', breed: 'Desi', district: 'Dir', market: 'Dir Mandi', emoji: '🐑', minPrice: 30000, maxPrice: 70000, category: 'Sheep', image: 'https://images.unsplash.com/photo-1547647419-406b42fd2ea5?w=200&h=140&fit=crop'),
    LivestockItem(id: 'l8', name: 'Sheep (Dumbi)', breed: 'Dumbi', district: 'Bannu', market: 'Bannu Mandi', emoji: '🐑', minPrice: 50000, maxPrice: 130000, category: 'Sheep', image: 'https://images.unsplash.com/photo-1547647419-406b42fd2ea5?w=200&h=140&fit=crop'),
    LivestockItem(id: 'l9', name: 'Broiler (per kg)', breed: 'Broiler', district: 'Peshawar', market: 'Wholesale Market', emoji: '🐔', minPrice: 350, maxPrice: 420, category: 'Poultry', image: 'https://images.unsplash.com/photo-1612170153139-6f881ff067e0?w=200&h=140&fit=crop'),
    LivestockItem(id: 'l10', name: 'Layer Eggs (30)', breed: 'Layer', district: 'Peshawar', market: 'Wholesale Market', emoji: '🥚', minPrice: 1200, maxPrice: 1400, category: 'Poultry', image: 'https://images.unsplash.com/photo-1598965675045-45c5e72c7d05?w=200&h=140&fit=crop'),
    LivestockItem(id: 'l11', name: 'Horse (Desi)', breed: 'Desi', district: 'Nowshera', market: 'Nowshera Mandi', emoji: '🐴', minPrice: 150000, maxPrice: 600000, category: 'Other', image: 'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?w=200&h=140&fit=crop'),
    LivestockItem(id: 'l12', name: 'Donkey', breed: 'Desi', district: 'Mardan', market: 'Mardan Mandi', emoji: '🫏', minPrice: 40000, maxPrice: 80000, category: 'Other', image: 'https://images.unsplash.com/photo-1516684669134-de6f7a687e14?w=200&h=140&fit=crop'),
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