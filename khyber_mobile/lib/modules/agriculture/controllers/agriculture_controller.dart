import 'package:get/get.dart';

class CropPrice {
  final String id, name, unit, district, market, trend, emoji, image;
  final double price, prevPrice;
  const CropPrice({required this.id, required this.name, required this.unit, required this.district, required this.market, required this.trend, required this.price, required this.prevPrice, required this.emoji, required this.image});
}

class AgricultureController extends GetxController {
  final searchQuery = ''.obs;
  final selectedCategory = 'All'.obs;
  final categories = ['All', 'Grains', 'Vegetables', 'Fruits', 'Cash Crops', 'Inputs'];

  final crops = <CropPrice>[
    CropPrice(id: 'c1', name: 'Wheat', unit: '40 kg', district: 'Peshawar', market: 'Ghalla Mandi', trend: 'up', price: 4800, prevPrice: 4600, emoji: '🌾', image: 'https://images.unsplash.com/photo-1574323347407-f5e1ad6d020b?w=200&h=140&fit=crop'),
    CropPrice(id: 'c2', name: 'Maize', unit: '40 kg', district: 'Swat', market: 'Mingora Mandi', trend: 'down', price: 3200, prevPrice: 3400, emoji: '🌽', image: 'https://images.unsplash.com/photo-1601648764658-cf37e8c89b70?w=200&h=140&fit=crop'),
    CropPrice(id: 'c3', name: 'Rice (Basmati)', unit: '40 kg', district: 'Mardan', market: 'Mardan Mandi', trend: 'up', price: 7500, prevPrice: 7200, emoji: '🍚', image: 'https://images.unsplash.com/photo-1536304993881-ff6e9eefa2a6?w=200&h=140&fit=crop'),
    CropPrice(id: 'c4', name: 'Tomato', unit: 'per kg', district: 'Nowshera', market: 'Nowshera Market', trend: 'down', price: 80, prevPrice: 120, emoji: '🍅', image: 'https://images.unsplash.com/photo-1546094096-0df4bcaaa337?w=200&h=140&fit=crop'),
    CropPrice(id: 'c5', name: 'Potato', unit: 'per kg', district: 'Abbottabad', market: 'Havelian Market', trend: 'up', price: 60, prevPrice: 50, emoji: '🥔', image: 'https://images.unsplash.com/photo-1518977676601-b53f82aba655?w=200&h=140&fit=crop'),
    CropPrice(id: 'c6', name: 'Onion', unit: 'per kg', district: 'Charsadda', market: 'Charsadda Mandi', trend: 'stable', price: 90, prevPrice: 90, emoji: '🧅', image: 'https://images.unsplash.com/photo-1618512496248-a07fe83aa8cb?w=200&h=140&fit=crop'),
    CropPrice(id: 'c7', name: 'Garlic', unit: 'per kg', district: 'Peshawar', market: 'Ghalla Mandi', trend: 'up', price: 350, prevPrice: 300, emoji: '🧄', image: 'https://images.unsplash.com/photo-1615485290382-441e4d049cb5?w=200&h=140&fit=crop'),
    CropPrice(id: 'c8', name: 'Apple (Kala Kulu)', unit: 'per kg', district: 'Swat', market: 'Mingora Market', trend: 'up', price: 180, prevPrice: 150, emoji: '🍎', image: 'https://images.unsplash.com/photo-1568702846914-96b305d2aaeb?w=200&h=140&fit=crop'),
    CropPrice(id: 'c9', name: 'Plum', unit: 'per kg', district: 'Swat', market: 'Swat Market', trend: 'stable', price: 120, prevPrice: 120, emoji: '🫐', image: 'https://images.unsplash.com/photo-1601493700631-2b16ec4b4716?w=200&h=140&fit=crop'),
    CropPrice(id: 'c10', name: 'Peach', unit: 'per kg', district: 'Mansehra', market: 'Mansehra Market', trend: 'down', price: 100, prevPrice: 130, emoji: '🍑', image: 'https://images.unsplash.com/photo-1595431813561-ed55a3edff3a?w=200&h=140&fit=crop'),
    CropPrice(id: 'c11', name: 'Tobacco', unit: '40 kg', district: 'Swabi', market: 'Swabi Mandi', trend: 'up', price: 12000, prevPrice: 11000, emoji: '🌿', image: 'https://images.unsplash.com/photo-1474979153845-ea9b7ee4a7b6?w=200&h=140&fit=crop'),
    CropPrice(id: 'c12', name: 'Sugarcane', unit: 'per maund', district: 'Charsadda', market: 'Charsadda Mandi', trend: 'stable', price: 500, prevPrice: 500, emoji: '🎋', image: 'https://images.unsplash.com/photo-1603580959798-76e4d59bc0af?w=200&h=140&fit=crop'),
    CropPrice(id: 'c13', name: 'DAP Fertilizer', unit: 'per bag', district: 'Peshawar', market: 'Agri Store', trend: 'up', price: 9500, prevPrice: 9000, emoji: '💊', image: 'https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=200&h=140&fit=crop'),
    CropPrice(id: 'c14', name: 'Urea Fertilizer', unit: 'per bag', district: 'Peshawar', market: 'Agri Store', trend: 'stable', price: 3500, prevPrice: 3500, emoji: '⚗️', image: 'https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=200&h=140&fit=crop'),
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