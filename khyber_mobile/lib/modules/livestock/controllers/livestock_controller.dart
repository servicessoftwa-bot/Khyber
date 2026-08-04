import 'package:get/get.dart';

class LivestockItem {
  final String id, name, breed, district, market, emoji, category, image;
  final double minPrice, maxPrice;
  const LivestockItem({required this.id, required this.name, required this.breed, required this.district, required this.market, required this.emoji, required this.minPrice, required this.maxPrice, required this.category, required this.image});
}

class LivestockController extends GetxController {
  final searchQuery = ''.obs;
  final selectedCategory = 'All'.obs;
  final categories = ['All', 'Cattle', 'Goats', 'Sheep', 'Poultry', 'Horses', 'Other'];

  final items = <LivestockItem>[

    // ── CATTLE ──────────────────────────────────────────────────────────────
    LivestockItem(id: 'c1', name: 'Bull (Desi)', breed: 'Desi', district: 'Peshawar', market: 'Chamkani Mandi', emoji: '🐂', minPrice: 80000, maxPrice: 200000, category: 'Cattle',
      image: 'https://images.unsplash.com/photo-1560807707-8cc77767d783?w=200&h=140&fit=crop'),
    LivestockItem(id: 'c2', name: 'Bull (Sahiwal)', breed: 'Sahiwal', district: 'Mardan', market: 'Mardan Mandi', emoji: '🐂', minPrice: 150000, maxPrice: 400000, category: 'Cattle',
      image: 'https://images.unsplash.com/photo-1598965402089-897ce52e8355?w=200&h=140&fit=crop'),
    LivestockItem(id: 'c3', name: 'Cow (Milking)', breed: 'Cross Breed', district: 'Charsadda', market: 'Charsadda Mandi', emoji: '🐄', minPrice: 120000, maxPrice: 300000, category: 'Cattle',
      image: 'https://images.unsplash.com/photo-1572524165032-7d46a4acf43a?w=200&h=140&fit=crop'),
    LivestockItem(id: 'c4', name: 'Cow (Holstein Friesian)', breed: 'HF Cross', district: 'Nowshera', market: 'Nowshera Mandi', emoji: '🐄', minPrice: 200000, maxPrice: 500000, category: 'Cattle',
      image: 'https://images.unsplash.com/photo-1546445317-29f4545e9d53?w=200&h=140&fit=crop'),
    LivestockItem(id: 'c5', name: 'Buffalo (Milking)', breed: 'Nili-Ravi', district: 'Swabi', market: 'Swabi Mandi', emoji: '🐃', minPrice: 150000, maxPrice: 350000, category: 'Cattle',
      image: 'https://images.unsplash.com/photo-1542282088-72c9c27ed0cd?w=200&h=140&fit=crop'),
    LivestockItem(id: 'c6', name: 'Buffalo Bull', breed: 'Desi', district: 'Mardan', market: 'Mardan Mandi', emoji: '🐃', minPrice: 100000, maxPrice: 250000, category: 'Cattle',
      image: 'https://images.unsplash.com/photo-1542282088-72c9c27ed0cd?w=200&h=140&fit=crop'),
    LivestockItem(id: 'c7', name: 'Calf (Male)', breed: 'Mixed', district: 'Charsadda', market: 'Charsadda Mandi', emoji: '🐂', minPrice: 40000, maxPrice: 90000, category: 'Cattle',
      image: 'https://images.unsplash.com/photo-1560807707-8cc77767d783?w=200&h=140&fit=crop'),

    // ── GOATS ───────────────────────────────────────────────────────────────
    LivestockItem(id: 'g1', name: 'Goat (Desi)', breed: 'Desi', district: 'Kohat', market: 'Kohat Mandi', emoji: '🐐', minPrice: 25000, maxPrice: 60000, category: 'Goats',
      image: 'https://images.unsplash.com/photo-1484557985045-edf25e08da73?w=200&h=140&fit=crop'),
    LivestockItem(id: 'g2', name: 'Goat (Beetal)', breed: 'Beetal', district: 'Peshawar', market: 'Chamkani Mandi', emoji: '🐐', minPrice: 50000, maxPrice: 120000, category: 'Goats',
      image: 'https://images.unsplash.com/photo-1534361960057-19f073cc6ea4?w=200&h=140&fit=crop'),
    LivestockItem(id: 'g3', name: 'Goat (Kajli)', breed: 'Kajli', district: 'Swabi', market: 'Swabi Mandi', emoji: '🐐', minPrice: 60000, maxPrice: 150000, category: 'Goats',
      image: 'https://images.unsplash.com/photo-1484557985045-edf25e08da73?w=200&h=140&fit=crop'),
    LivestockItem(id: 'g4', name: 'Goat (Teddy)', breed: 'Teddy', district: 'Abbottabad', market: 'Abbottabad Mandi', emoji: '🐐', minPrice: 35000, maxPrice: 80000, category: 'Goats',
      image: 'https://images.unsplash.com/photo-1484557985045-edf25e08da73?w=200&h=140&fit=crop'),
    LivestockItem(id: 'g5', name: 'Female Goat (Milking)', breed: 'Cross', district: 'Mardan', market: 'Mardan Mandi', emoji: '🐐', minPrice: 40000, maxPrice: 90000, category: 'Goats',
      image: 'https://images.unsplash.com/photo-1596443686812-2f45229eebc3?w=200&h=140&fit=crop'),
    LivestockItem(id: 'g6', name: 'Kid (Goat Lamb)', breed: 'Desi', district: 'Kohat', market: 'Kohat Mandi', emoji: '🐐', minPrice: 10000, maxPrice: 25000, category: 'Goats',
      image: 'https://images.unsplash.com/photo-1484557985045-edf25e08da73?w=200&h=140&fit=crop'),

    // ── SHEEP ───────────────────────────────────────────────────────────────
    LivestockItem(id: 's1', name: 'Sheep (Desi)', breed: 'Desi', district: 'Dir', market: 'Dir Mandi', emoji: '🐑', minPrice: 30000, maxPrice: 70000, category: 'Sheep',
      image: 'https://images.unsplash.com/photo-1547647419-406b42fd2ea5?w=200&h=140&fit=crop'),
    LivestockItem(id: 's2', name: 'Sheep (Dumbi Fat-Tail)', breed: 'Dumbi', district: 'Bannu', market: 'Bannu Mandi', emoji: '🐑', minPrice: 50000, maxPrice: 130000, category: 'Sheep',
      image: 'https://images.unsplash.com/photo-1598887141442-6fd4c6b01038?w=200&h=140&fit=crop'),
    LivestockItem(id: 's3', name: 'Ram (Male Sheep)', breed: 'Desi', district: 'Chitral', market: 'Chitral Mandi', emoji: '🐏', minPrice: 60000, maxPrice: 160000, category: 'Sheep',
      image: 'https://images.unsplash.com/photo-1508817628294-5a453fa0b8fb?w=200&h=140&fit=crop'),
    LivestockItem(id: 's4', name: 'Sheep (Rambouillet)', breed: 'Rambouillet', district: 'Mansehra', market: 'Mansehra Mandi', emoji: '🐑', minPrice: 80000, maxPrice: 200000, category: 'Sheep',
      image: 'https://images.unsplash.com/photo-1547647419-406b42fd2ea5?w=200&h=140&fit=crop'),
    LivestockItem(id: 's5', name: 'Lamb (Young Sheep)', breed: 'Desi', district: 'Swat', market: 'Mingora Mandi', emoji: '🐑', minPrice: 20000, maxPrice: 50000, category: 'Sheep',
      image: 'https://images.unsplash.com/photo-1547647419-406b42fd2ea5?w=200&h=140&fit=crop'),

    // ── POULTRY ─────────────────────────────────────────────────────────────
    LivestockItem(id: 'p1', name: 'Broiler (per kg live)', breed: 'Broiler', district: 'Peshawar', market: 'Wholesale Market', emoji: '🐔', minPrice: 350, maxPrice: 420, category: 'Poultry',
      image: 'https://images.unsplash.com/photo-1612170153139-6f881ff067e0?w=200&h=140&fit=crop'),
    LivestockItem(id: 'p2', name: 'Layer Eggs (per 30)', breed: 'Layer', district: 'Peshawar', market: 'Wholesale Market', emoji: '🥚', minPrice: 1200, maxPrice: 1400, category: 'Poultry',
      image: 'https://images.unsplash.com/photo-1598965675045-45c5e72c7d05?w=200&h=140&fit=crop'),
    LivestockItem(id: 'p3', name: 'Desi Murgh (per bird)', breed: 'Country Chicken', district: 'Mardan', market: 'Mardan Market', emoji: '🐓', minPrice: 1200, maxPrice: 2000, category: 'Poultry',
      image: 'https://images.unsplash.com/photo-1548550023-2bdb3c5beed7?w=200&h=140&fit=crop'),
    LivestockItem(id: 'p4', name: 'Duck (per bird)', breed: 'Desi', district: 'Swabi', market: 'Swabi Market', emoji: '🦆', minPrice: 1500, maxPrice: 2500, category: 'Poultry',
      image: 'https://images.unsplash.com/photo-1548550023-2bdb3c5beed7?w=200&h=140&fit=crop'),
    LivestockItem(id: 'p5', name: 'Turkey (per bird)', breed: 'Broad Breasted', district: 'Abbottabad', market: 'Abbottabad Market', emoji: '🦃', minPrice: 5000, maxPrice: 10000, category: 'Poultry',
      image: 'https://images.unsplash.com/photo-1571086291215-e1d8fc5c99bc?w=200&h=140&fit=crop'),

    // ── HORSES ──────────────────────────────────────────────────────────────
    LivestockItem(id: 'h1', name: 'Horse (Desi Riding)', breed: 'Desi', district: 'Nowshera', market: 'Nowshera Mandi', emoji: '🐴', minPrice: 150000, maxPrice: 600000, category: 'Horses',
      image: 'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?w=200&h=140&fit=crop'),
    LivestockItem(id: 'h2', name: 'Horse (Thoroughbred)', breed: 'Thoroughbred', district: 'Peshawar', market: 'Chamkani Mandi', emoji: '🐎', minPrice: 500000, maxPrice: 2000000, category: 'Horses',
      image: 'https://images.unsplash.com/photo-1553284965-83fd3e82fa5a?w=200&h=140&fit=crop'),
    LivestockItem(id: 'h3', name: 'Pony (Pack Animal)', breed: 'Desi Pony', district: 'Chitral', market: 'Chitral Bazaar', emoji: '🐴', minPrice: 80000, maxPrice: 200000, category: 'Horses',
      image: 'https://images.unsplash.com/photo-1510942201312-84a4b75faa3e?w=200&h=140&fit=crop'),

    // ── OTHER ───────────────────────────────────────────────────────────────
    LivestockItem(id: 'o1', name: 'Donkey (Working)', breed: 'Desi', district: 'Mardan', market: 'Mardan Mandi', emoji: '🫏', minPrice: 40000, maxPrice: 80000, category: 'Other',
      image: 'https://images.unsplash.com/photo-1516684669134-de6f7a687e14?w=200&h=140&fit=crop'),
    LivestockItem(id: 'o2', name: 'Camel (Cargo)', breed: 'Desi', district: 'DI Khan', market: 'DI Khan Mandi', emoji: '🐪', minPrice: 200000, maxPrice: 500000, category: 'Other',
      image: 'https://images.unsplash.com/photo-1519467157657-96bb3ef50cec?w=200&h=140&fit=crop'),
    LivestockItem(id: 'o3', name: 'Rabbit (per pair)', breed: 'White Rex', district: 'Peshawar', market: 'Pet Market', emoji: '🐇', minPrice: 2000, maxPrice: 5000, category: 'Other',
      image: 'https://images.unsplash.com/photo-1585110396000-c9ffd4e4b308?w=200&h=140&fit=crop'),
    LivestockItem(id: 'o4', name: 'Quail (Bater, per 10)', breed: 'Japanese', district: 'Peshawar', market: 'Pet Market', emoji: '🐦', minPrice: 1500, maxPrice: 2500, category: 'Other',
      image: 'https://images.unsplash.com/photo-1444464666168-49d633b86797?w=200&h=140&fit=crop'),

  ];

  List<LivestockItem> get filtered {
    final q = searchQuery.value.toLowerCase();
    final cat = selectedCategory.value;
    return items.where((i) {
      final matchQ = q.isEmpty || i.name.toLowerCase().contains(q) || i.district.toLowerCase().contains(q) || i.breed.toLowerCase().contains(q);
      final matchCat = cat == 'All' || i.category == cat;
      return matchQ && matchCat;
    }).toList();
  }
}
