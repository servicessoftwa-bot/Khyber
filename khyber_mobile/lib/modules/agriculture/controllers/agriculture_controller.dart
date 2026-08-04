import 'package:get/get.dart';

class CropPrice {
  final String id, name, unit, district, market, trend, emoji, image, category;
  final double price, prevPrice;
  const CropPrice({required this.id, required this.name, required this.unit, required this.district, required this.market, required this.trend, required this.price, required this.prevPrice, required this.emoji, required this.image, required this.category});
}

class AgricultureController extends GetxController {
  final searchQuery = ''.obs;
  final selectedCategory = 'All'.obs;
  final categories = ['All', 'Grains', 'Vegetables', 'Fruits', 'Cash Crops', 'Inputs'];

  final crops = <CropPrice>[

    // ── GRAINS ──────────────────────────────────────────────────────────────
    CropPrice(id: 'g1', name: 'Wheat', unit: '40 kg bag', district: 'Peshawar', market: 'Ghalla Mandi', trend: 'up', price: 4800, prevPrice: 4600, emoji: '🌾', category: 'Grains',
      image: 'https://images.unsplash.com/photo-1574323347407-f5e1ad6d020b?w=200&h=140&fit=crop'),
    CropPrice(id: 'g2', name: 'Maize', unit: '40 kg bag', district: 'Swat', market: 'Mingora Mandi', trend: 'down', price: 3200, prevPrice: 3400, emoji: '🌽', category: 'Grains',
      image: 'https://images.unsplash.com/photo-1601648764658-cf37e8c89b70?w=200&h=140&fit=crop'),
    CropPrice(id: 'g3', name: 'Rice (Basmati)', unit: '40 kg bag', district: 'Mardan', market: 'Mardan Mandi', trend: 'up', price: 7500, prevPrice: 7200, emoji: '🍚', category: 'Grains',
      image: 'https://images.unsplash.com/photo-1536304993881-ff6e9eefa2a6?w=200&h=140&fit=crop'),
    CropPrice(id: 'g4', name: 'Barley', unit: '40 kg bag', district: 'Kohat', market: 'Kohat Mandi', trend: 'stable', price: 3000, prevPrice: 3000, emoji: '🌾', category: 'Grains',
      image: 'https://images.unsplash.com/photo-1560493676-04071c5f467b?w=200&h=140&fit=crop'),
    CropPrice(id: 'g5', name: 'Millet (Bajra)', unit: '40 kg bag', district: 'Lakki Marwat', market: 'Lakki Mandi', trend: 'up', price: 2800, prevPrice: 2600, emoji: '🌾', category: 'Grains',
      image: 'https://images.unsplash.com/photo-1574943320219-553eb213f72d?w=200&h=140&fit=crop'),
    CropPrice(id: 'g6', name: 'Sorghum (Jowar)', unit: '40 kg bag', district: 'DI Khan', market: 'DI Khan Mandi', trend: 'stable', price: 2500, prevPrice: 2500, emoji: '🌾', category: 'Grains',
      image: 'https://images.unsplash.com/photo-1586201375761-83865001e31c?w=200&h=140&fit=crop'),

    // ── VEGETABLES ──────────────────────────────────────────────────────────
    CropPrice(id: 'v1', name: 'Tomato', unit: 'per kg', district: 'Nowshera', market: 'Nowshera Market', trend: 'down', price: 80, prevPrice: 120, emoji: '🍅', category: 'Vegetables',
      image: 'https://images.unsplash.com/photo-1546094096-0df4bcaaa337?w=200&h=140&fit=crop'),
    CropPrice(id: 'v2', name: 'Potato', unit: 'per kg', district: 'Abbottabad', market: 'Havelian Market', trend: 'up', price: 60, prevPrice: 50, emoji: '🥔', category: 'Vegetables',
      image: 'https://images.unsplash.com/photo-1518977676601-b53f82aba655?w=200&h=140&fit=crop'),
    CropPrice(id: 'v3', name: 'Onion', unit: 'per kg', district: 'Charsadda', market: 'Charsadda Mandi', trend: 'stable', price: 90, prevPrice: 90, emoji: '🧅', category: 'Vegetables',
      image: 'https://images.unsplash.com/photo-1618512496248-a07fe83aa8cb?w=200&h=140&fit=crop'),
    CropPrice(id: 'v4', name: 'Garlic', unit: 'per kg', district: 'Peshawar', market: 'Ghalla Mandi', trend: 'up', price: 350, prevPrice: 300, emoji: '🧄', category: 'Vegetables',
      image: 'https://images.unsplash.com/photo-1615485290382-441e4d049cb5?w=200&h=140&fit=crop'),
    CropPrice(id: 'v5', name: 'Cabbage', unit: 'per kg', district: 'Abbottabad', market: 'Abbottabad Market', trend: 'down', price: 40, prevPrice: 55, emoji: '🥬', category: 'Vegetables',
      image: 'https://images.unsplash.com/photo-1551754655-2544a2b31925?w=200&h=140&fit=crop'),
    CropPrice(id: 'v6', name: 'Cauliflower', unit: 'per kg', district: 'Mansehra', market: 'Mansehra Mandi', trend: 'up', price: 70, prevPrice: 55, emoji: '🥦', category: 'Vegetables',
      image: 'https://images.unsplash.com/photo-1568584711075-3d021a7c3ca3?w=200&h=140&fit=crop'),
    CropPrice(id: 'v7', name: 'Spinach (Palak)', unit: 'per kg', district: 'Peshawar', market: 'Sabzi Mandi', trend: 'stable', price: 50, prevPrice: 50, emoji: '🥬', category: 'Vegetables',
      image: 'https://images.unsplash.com/photo-1576045057995-568f588f82f?w=200&h=140&fit=crop'),
    CropPrice(id: 'v8', name: 'Green Peas', unit: 'per kg', district: 'Abbottabad', market: 'Havelian Market', trend: 'up', price: 120, prevPrice: 100, emoji: '🫛', category: 'Vegetables',
      image: 'https://images.unsplash.com/photo-1561948955-570b270e7c36?w=200&h=140&fit=crop'),
    CropPrice(id: 'v9', name: 'Carrot', unit: 'per kg', district: 'Buner', market: 'Buner Market', trend: 'down', price: 55, prevPrice: 75, emoji: '🥕', category: 'Vegetables',
      image: 'https://images.unsplash.com/photo-1598170845058-32b9d6a5da37?w=200&h=140&fit=crop'),
    CropPrice(id: 'v10', name: 'Eggplant (Brinjal)', unit: 'per kg', district: 'Charsadda', market: 'Charsadda Mandi', trend: 'stable', price: 60, prevPrice: 60, emoji: '🍆', category: 'Vegetables',
      image: 'https://images.unsplash.com/photo-1582576163090-79de4d2ef5d0?w=200&h=140&fit=crop'),
    CropPrice(id: 'v11', name: 'Lady Finger (Okra)', unit: 'per kg', district: 'Swabi', market: 'Swabi Mandi', trend: 'up', price: 80, prevPrice: 65, emoji: '🫑', category: 'Vegetables',
      image: 'https://images.unsplash.com/photo-1593280405106-e438ebe85f24?w=200&h=140&fit=crop'),
    CropPrice(id: 'v12', name: 'Bitter Gourd (Karela)', unit: 'per kg', district: 'Nowshera', market: 'Nowshera Market', trend: 'stable', price: 90, prevPrice: 90, emoji: '🥒', category: 'Vegetables',
      image: 'https://images.unsplash.com/photo-1543362906-acfc16c67564?w=200&h=140&fit=crop'),
    CropPrice(id: 'v13', name: 'Turnip', unit: 'per kg', district: 'Kohat', market: 'Kohat Market', trend: 'down', price: 35, prevPrice: 45, emoji: '🫛', category: 'Vegetables',
      image: 'https://images.unsplash.com/photo-1619566636858-adf3ef46400b?w=200&h=140&fit=crop'),
    CropPrice(id: 'v14', name: 'Radish (Mooli)', unit: 'per kg', district: 'Mardan', market: 'Mardan Sabzi Mandi', trend: 'stable', price: 30, prevPrice: 30, emoji: '🌱', category: 'Vegetables',
      image: 'https://images.unsplash.com/photo-1581090121488-ff968b43e12f?w=200&h=140&fit=crop'),

    // ── FRUITS ──────────────────────────────────────────────────────────────
    CropPrice(id: 'fr1', name: 'Apple (Kala Kulu)', unit: 'per kg', district: 'Swat', market: 'Mingora Market', trend: 'up', price: 180, prevPrice: 150, emoji: '🍎', category: 'Fruits',
      image: 'https://images.unsplash.com/photo-1568702846914-96b305d2aaeb?w=200&h=140&fit=crop'),
    CropPrice(id: 'fr2', name: 'Plum (Alocha)', unit: 'per kg', district: 'Swat', market: 'Swat Market', trend: 'stable', price: 120, prevPrice: 120, emoji: '🫐', category: 'Fruits',
      image: 'https://images.unsplash.com/photo-1601493700631-2b16ec4b4716?w=200&h=140&fit=crop'),
    CropPrice(id: 'fr3', name: 'Peach', unit: 'per kg', district: 'Mansehra', market: 'Mansehra Market', trend: 'down', price: 100, prevPrice: 130, emoji: '🍑', category: 'Fruits',
      image: 'https://images.unsplash.com/photo-1595431813561-ed55a3edff3a?w=200&h=140&fit=crop'),
    CropPrice(id: 'fr4', name: 'Cherry', unit: 'per kg', district: 'Chitral', market: 'Chitral Bazaar', trend: 'up', price: 400, prevPrice: 350, emoji: '🍒', category: 'Fruits',
      image: 'https://images.unsplash.com/photo-1528821128474-27f6f7ff4af5?w=200&h=140&fit=crop'),
    CropPrice(id: 'fr5', name: 'Pear (Naak)', unit: 'per kg', district: 'Swat', market: 'Mingora Market', trend: 'stable', price: 140, prevPrice: 140, emoji: '🍐', category: 'Fruits',
      image: 'https://images.unsplash.com/photo-1514756331096-242fdeb70d4a?w=200&h=140&fit=crop'),
    CropPrice(id: 'fr6', name: 'Apricot (Khubani)', unit: 'per kg', district: 'Dir', market: 'Dir Market', trend: 'up', price: 220, prevPrice: 190, emoji: '🍑', category: 'Fruits',
      image: 'https://images.unsplash.com/photo-1557800636-882a8f8c8ed8?w=200&h=140&fit=crop'),
    CropPrice(id: 'fr7', name: 'Walnut (Fresh)', unit: 'per kg', district: 'Chitral', market: 'Chitral Bazaar', trend: 'up', price: 600, prevPrice: 550, emoji: '🌰', category: 'Fruits',
      image: 'https://images.unsplash.com/photo-1515443961218-a51367888e4b?w=200&h=140&fit=crop'),
    CropPrice(id: 'fr8', name: 'Grape (Angoor)', unit: 'per kg', district: 'Nowshera', market: 'Nowshera Market', trend: 'down', price: 150, prevPrice: 180, emoji: '🍇', category: 'Fruits',
      image: 'https://images.unsplash.com/photo-1537640385-d7a4a06e5dc3?w=200&h=140&fit=crop'),
    CropPrice(id: 'fr9', name: 'Pomegranate (Anar)', unit: 'per kg', district: 'Bajaur', market: 'Bajaur Market', trend: 'stable', price: 200, prevPrice: 200, emoji: '🍎', category: 'Fruits',
      image: 'https://images.unsplash.com/photo-1603048297703-da621a456086?w=200&h=140&fit=crop'),
    CropPrice(id: 'fr10', name: 'Mango (Langra)', unit: 'per dozen', district: 'DI Khan', market: 'DI Khan Market', trend: 'down', price: 350, prevPrice: 400, emoji: '🥭', category: 'Fruits',
      image: 'https://images.unsplash.com/photo-1553279702-76f2ccb0d4b5?w=200&h=140&fit=crop'),
    CropPrice(id: 'fr11', name: 'Strawberry', unit: 'per kg', district: 'Swat', market: 'Mingora Market', trend: 'up', price: 320, prevPrice: 280, emoji: '🍓', category: 'Fruits',
      image: 'https://images.unsplash.com/photo-1464965911861-746a04b4bca6?w=200&h=140&fit=crop'),

    // ── CASH CROPS ──────────────────────────────────────────────────────────
    CropPrice(id: 'cc1', name: 'Tobacco', unit: '40 kg', district: 'Swabi', market: 'Swabi Mandi', trend: 'up', price: 12000, prevPrice: 11000, emoji: '🌿', category: 'Cash Crops',
      image: 'https://images.unsplash.com/photo-1474979153845-ea9b7ee4a7b6?w=200&h=140&fit=crop'),
    CropPrice(id: 'cc2', name: 'Sugarcane', unit: 'per maund', district: 'Charsadda', market: 'Charsadda Mandi', trend: 'stable', price: 500, prevPrice: 500, emoji: '🎋', category: 'Cash Crops',
      image: 'https://images.unsplash.com/photo-1603580959798-76e4d59bc0af?w=200&h=140&fit=crop'),
    CropPrice(id: 'cc3', name: 'Cotton', unit: '40 kg', district: 'DI Khan', market: 'DI Khan Mandi', trend: 'up', price: 8500, prevPrice: 8000, emoji: '🌸', category: 'Cash Crops',
      image: 'https://images.unsplash.com/photo-1589927986093-d3dfc35ffc1b?w=200&h=140&fit=crop'),
    CropPrice(id: 'cc4', name: 'Rapeseed (Canola)', unit: '40 kg', district: 'Mardan', market: 'Mardan Mandi', trend: 'up', price: 5500, prevPrice: 5000, emoji: '🌻', category: 'Cash Crops',
      image: 'https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=200&h=140&fit=crop'),
    CropPrice(id: 'cc5', name: 'Sesame (Til)', unit: '40 kg', district: 'Lakki Marwat', market: 'Lakki Mandi', trend: 'stable', price: 15000, prevPrice: 15000, emoji: '🌾', category: 'Cash Crops',
      image: 'https://images.unsplash.com/photo-1486297717987-3744b7fd9347?w=200&h=140&fit=crop'),
    CropPrice(id: 'cc6', name: 'Sunflower', unit: '40 kg', district: 'Swabi', market: 'Swabi Mandi', trend: 'up', price: 6000, prevPrice: 5500, emoji: '🌻', category: 'Cash Crops',
      image: 'https://images.unsplash.com/photo-1597848212624-a19eb35e2651?w=200&h=140&fit=crop'),

    // ── INPUTS ──────────────────────────────────────────────────────────────
    CropPrice(id: 'i1', name: 'DAP Fertilizer', unit: 'per 50 kg bag', district: 'Peshawar', market: 'Agri Store', trend: 'up', price: 9500, prevPrice: 9000, emoji: '💊', category: 'Inputs',
      image: 'https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=200&h=140&fit=crop'),
    CropPrice(id: 'i2', name: 'Urea Fertilizer', unit: 'per 50 kg bag', district: 'Peshawar', market: 'Agri Store', trend: 'stable', price: 3500, prevPrice: 3500, emoji: '⚗️', category: 'Inputs',
      image: 'https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=200&h=140&fit=crop'),
    CropPrice(id: 'i3', name: 'Wheat Seed (Certified)', unit: 'per 10 kg', district: 'Peshawar', market: 'PASSCO', trend: 'stable', price: 2200, prevPrice: 2200, emoji: '🌱', category: 'Inputs',
      image: 'https://images.unsplash.com/photo-1574323347407-f5e1ad6d020b?w=200&h=140&fit=crop'),
    CropPrice(id: 'i4', name: 'Pesticide (Cypermethrin)', unit: 'per litre', district: 'Peshawar', market: 'Agri Input Shop', trend: 'up', price: 1800, prevPrice: 1600, emoji: '🧪', category: 'Inputs',
      image: 'https://images.unsplash.com/photo-1556075798-4825dfaaf498?w=200&h=140&fit=crop'),
    CropPrice(id: 'i5', name: 'Tractor Diesel', unit: 'per litre', district: 'Peshawar', market: 'PSO Pump', trend: 'up', price: 290, prevPrice: 275, emoji: '⛽', category: 'Inputs',
      image: 'https://images.unsplash.com/photo-1503376780353-7e6692767b70?w=200&h=140&fit=crop'),
    CropPrice(id: 'i6', name: 'Drip Irrigation Kit', unit: 'per acre set', district: 'Peshawar', market: 'Agri Store', trend: 'stable', price: 45000, prevPrice: 45000, emoji: '💧', category: 'Inputs',
      image: 'https://images.unsplash.com/photo-1559827260-dc66d52bef19?w=200&h=140&fit=crop'),
    CropPrice(id: 'i7', name: 'SOP Fertilizer', unit: 'per 50 kg bag', district: 'Mardan', market: 'Agri Store', trend: 'up', price: 11000, prevPrice: 10000, emoji: '💊', category: 'Inputs',
      image: 'https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=200&h=140&fit=crop'),

  ];

  List<CropPrice> get filtered {
    final q = searchQuery.value.toLowerCase();
    final cat = selectedCategory.value;
    return crops.where((c) {
      final matchQ = q.isEmpty || c.name.toLowerCase().contains(q) || c.district.toLowerCase().contains(q) || c.market.toLowerCase().contains(q);
      final matchCat = cat == 'All' || c.category == cat;
      return matchQ && matchCat;
    }).toList();
  }
}
