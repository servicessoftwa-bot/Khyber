import 'package:get/get.dart';

class CropPrice {
  final String id, name, unit, district, market, trend;
  final double price, prevPrice;
  final String emoji;
  const CropPrice({required this.id, required this.name, required this.unit, required this.district, required this.market, required this.trend, required this.price, required this.prevPrice, required this.emoji});
}

class AgricultureController extends GetxController {
  final searchQuery = ''.obs;
  final selectedCategory = 'All'.obs;
  final categories = ['All', 'Grains', 'Vegetables', 'Fruits', 'Cash Crops', 'Inputs'];

  final crops = <CropPrice>[
    CropPrice(id: 'c1', name: 'Wheat', unit: '40 kg', district: 'Peshawar', market: 'Ghalla Mandi', trend: 'up', price: 4800, prevPrice: 4600, emoji: '🌾'),
    CropPrice(id: 'c2', name: 'Maize', unit: '40 kg', district: 'Swat', market: 'Mingora Mandi', trend: 'down', price: 3200, prevPrice: 3400, emoji: '🌽'),
    CropPrice(id: 'c3', name: 'Rice (Basmati)', unit: '40 kg', district: 'Mardan', market: 'Mardan Mandi', trend: 'up', price: 7500, prevPrice: 7200, emoji: '🍚'),
    CropPrice(id: 'c4', name: 'Tomato', unit: 'per kg', district: 'Nowshera', market: 'Nowshera Market', trend: 'down', price: 80, prevPrice: 120, emoji: '🍅'),
    CropPrice(id: 'c5', name: 'Potato', unit: 'per kg', district: 'Abbottabad', market: 'Havelian Market', trend: 'up', price: 60, prevPrice: 50, emoji: '🥔'),
    CropPrice(id: 'c6', name: 'Onion', unit: 'per kg', district: 'Charsadda', market: 'Charsadda Mandi', trend: 'stable', price: 90, prevPrice: 90, emoji: '🧅'),
    CropPrice(id: 'c7', name: 'Garlic', unit: 'per kg', district: 'Peshawar', market: 'Ghalla Mandi', trend: 'up', price: 350, prevPrice: 300, emoji: '🧄'),
    CropPrice(id: 'c8', name: 'Apple (Kala Kulu)', unit: 'per kg', district: 'Swat', market: 'Mingora Market', trend: 'up', price: 180, prevPrice: 150, emoji: '🍎'),
    CropPrice(id: 'c9', name: 'Plum', unit: 'per kg', district: 'Swat', market: 'Swat Market', trend: 'stable', price: 120, prevPrice: 120, emoji: '🫐'),
    CropPrice(id: 'c10', name: 'Peach', unit: 'per kg', district: 'Mansehra', market: 'Mansehra Market', trend: 'down', price: 100, prevPrice: 130, emoji: '🍑'),
    CropPrice(id: 'c11', name: 'Tobacco', unit: '40 kg', district: 'Swabi', market: 'Swabi Mandi', trend: 'up', price: 12000, prevPrice: 11000, emoji: '🌿'),
    CropPrice(id: 'c12', name: 'Sugarcane', unit: 'per maund', district: 'Charsadda', market: 'Charsadda Mandi', trend: 'stable', price: 500, prevPrice: 500, emoji: '🎋'),
    CropPrice(id: 'c13', name: 'DAP Fertilizer', unit: 'per bag', district: 'Peshawar', market: 'Agri Store', trend: 'up', price: 9500, prevPrice: 9000, emoji: '💊'),
    CropPrice(id: 'c14', name: 'Urea Fertilizer', unit: 'per bag', district: 'Peshawar', market: 'Agri Store', trend: 'stable', price: 3500, prevPrice: 3500, emoji: '⚗️'),
  ];

  static const categoryMap = {
    'Grains': ['Wheat', 'Maize', 'Rice (Basmati)'],
    'Vegetables': ['Tomato', 'Potato', 'Onion', 'Garlic'],
    'Fruits': ['Apple (Kala Kulu)', 'Plum', 'Peach'],
    'Cash Crops': ['Tobacco', 'Sugarcane'],
    'Inputs': ['DAP Fertilizer', 'Urea Fertilizer'],
  };

  List<CropPrice> get filtered {
    final q = searchQuery.value.toLowerCase();
    final cat = selectedCategory.value;
    return crops.where((c) {
      final matchQ = q.isEmpty || c.name.toLowerCase().contains(q) || c.district.toLowerCase().contains(q);
      final matchCat = cat == 'All' || (categoryMap[cat]?.contains(c.name) ?? false);
      return matchQ && matchCat;
    }).toList();
  }
}