import 'package:get/get.dart';

class DryFruitItem {
  final String id, name, origin, seller, district, emoji, category, image;
  final double pricePerKg, rating;
  final bool inStock;
  const DryFruitItem({required this.id, required this.name, required this.origin, required this.seller, required this.district, required this.emoji, required this.category, required this.image, required this.pricePerKg, required this.rating, required this.inStock});
}

class DryFruitsController extends GetxController {
  final searchQuery = ''.obs;
  final selectedCategory = 'All'.obs;
  final categories = ['All', 'Dry Fruits', 'Nuts', 'Honey', 'Seeds', 'Spices'];

  final items = <DryFruitItem>[

    // ── DRY FRUITS ──────────────────────────────────────────────────────────
    DryFruitItem(id: 'd1', name: 'Walnut (Akhrot)', origin: 'Chitral', seller: 'Chitral Organics', district: 'Chitral', emoji: '🫘', category: 'Dry Fruits',
      image: 'https://images.unsplash.com/photo-1515443961218-a51367888e4b?w=200&h=140&fit=crop', pricePerKg: 2200, rating: 4.8, inStock: true),
    DryFruitItem(id: 'd2', name: 'Apricot (Khumani)', origin: 'Swat', seller: 'Swat Dry Fruits', district: 'Swat', emoji: '🍑', category: 'Dry Fruits',
      image: 'https://images.unsplash.com/photo-1563746924237-f81d5e4b4c5b?w=200&h=140&fit=crop', pricePerKg: 1200, rating: 4.9, inStock: true),
    DryFruitItem(id: 'd3', name: 'Raisin (Kishmish)', origin: 'Swat', seller: 'Swat Organics', district: 'Swat', emoji: '🍇', category: 'Dry Fruits',
      image: 'https://images.unsplash.com/photo-1596591868231-05e808fd8735?w=200&h=140&fit=crop', pricePerKg: 900, rating: 4.6, inStock: true),
    DryFruitItem(id: 'd4', name: 'Fig (Anjeer)', origin: 'Peshawar', seller: 'Qissa Khwani Bazaar', district: 'Peshawar', emoji: '🫐', category: 'Dry Fruits',
      image: 'https://images.unsplash.com/photo-1601004890684-d8cbf643f5f2?w=200&h=140&fit=crop', pricePerKg: 1500, rating: 4.5, inStock: true),
    DryFruitItem(id: 'd5', name: 'Mulberry (Shahtoot)', origin: 'Peshawar', seller: 'KPK Harvest', district: 'Peshawar', emoji: '🫐', category: 'Dry Fruits',
      image: 'https://images.unsplash.com/photo-1596591868231-05e808fd8735?w=200&h=140&fit=crop', pricePerKg: 800, rating: 4.5, inStock: false),
    DryFruitItem(id: 'd6', name: 'Dried Plum (Alobukhara)', origin: 'Swat', seller: 'Swat Valley Traders', district: 'Swat', emoji: '🫐', category: 'Dry Fruits',
      image: 'https://images.unsplash.com/photo-1601493700631-2b16ec4b4716?w=200&h=140&fit=crop', pricePerKg: 700, rating: 4.4, inStock: true),
    DryFruitItem(id: 'd7', name: 'Dried Cherry (Gilas)', origin: 'Chitral', seller: 'Chitral Organics', district: 'Chitral', emoji: '🍒', category: 'Dry Fruits',
      image: 'https://images.unsplash.com/photo-1528821128474-27f6f7ff4af5?w=200&h=140&fit=crop', pricePerKg: 2500, rating: 4.7, inStock: true),
    DryFruitItem(id: 'd8', name: 'Dried Peach', origin: 'Mansehra', seller: 'Kaghan Valley Foods', district: 'Mansehra', emoji: '🍑', category: 'Dry Fruits',
      image: 'https://images.unsplash.com/photo-1595431813561-ed55a3edff3a?w=200&h=140&fit=crop', pricePerKg: 950, rating: 4.6, inStock: true),
    DryFruitItem(id: 'd9', name: 'Date (Khajoor)', origin: 'DI Khan', seller: 'DI Khan Traders', district: 'DI Khan', emoji: '🌴', category: 'Dry Fruits',
      image: 'https://images.unsplash.com/photo-1593280405106-e438ebe85f24?w=200&h=140&fit=crop', pricePerKg: 600, rating: 4.4, inStock: true),

    // ── NUTS ────────────────────────────────────────────────────────────────
    DryFruitItem(id: 'n1', name: 'Almond (Badam)', origin: 'Dir', seller: 'Dir Valley Foods', district: 'Dir', emoji: '🌰', category: 'Nuts',
      image: 'https://images.unsplash.com/photo-1608797178974-15b35a64ede9?w=200&h=140&fit=crop', pricePerKg: 2800, rating: 4.7, inStock: true),
    DryFruitItem(id: 'n2', name: 'Pine Nuts (Chilgoza)', origin: 'Waziristan', seller: 'KPK Traders', district: 'Peshawar', emoji: '🌲', category: 'Nuts',
      image: 'https://images.unsplash.com/photo-1546548970-71785318a17b?w=200&h=140&fit=crop', pricePerKg: 8000, rating: 4.9, inStock: true),
    DryFruitItem(id: 'n3', name: 'Pistachio (Pista)', origin: 'Afghanistan (via KPK)', seller: 'Karkhano Market', district: 'Peshawar', emoji: '🟢', category: 'Nuts',
      image: 'https://images.unsplash.com/photo-1599490659213-e2b9527bd087?w=200&h=140&fit=crop', pricePerKg: 4200, rating: 4.7, inStock: true),
    DryFruitItem(id: 'n4', name: 'Cashew (Kaju)', origin: 'Imported (Sold in KPK)', seller: 'Frontier Dry Fruits', district: 'Peshawar', emoji: '🫘', category: 'Nuts',
      image: 'https://images.unsplash.com/photo-1608797178974-15b35a64ede9?w=200&h=140&fit=crop', pricePerKg: 3500, rating: 4.6, inStock: true),
    DryFruitItem(id: 'n5', name: 'Hazelnut (Funduk)', origin: 'Swat', seller: 'Swat Organics', district: 'Swat', emoji: '🌰', category: 'Nuts',
      image: 'https://images.unsplash.com/photo-1515443961218-a51367888e4b?w=200&h=140&fit=crop', pricePerKg: 1800, rating: 4.5, inStock: true),
    DryFruitItem(id: 'n6', name: 'Peanut (Moongphali)', origin: 'Charsadda', seller: 'Charsadda Agri', district: 'Charsadda', emoji: '🥜', category: 'Nuts',
      image: 'https://images.unsplash.com/photo-1567306226416-28f0efdc88ce?w=200&h=140&fit=crop', pricePerKg: 350, rating: 4.3, inStock: true),
    DryFruitItem(id: 'n7', name: 'Walnut (Shelled, Half)', origin: 'Chitral', seller: 'Chitral Premium', district: 'Chitral', emoji: '🫘', category: 'Nuts',
      image: 'https://images.unsplash.com/photo-1515443961218-a51367888e4b?w=200&h=140&fit=crop', pricePerKg: 3500, rating: 4.9, inStock: true),

    // ── HONEY ───────────────────────────────────────────────────────────────
    DryFruitItem(id: 'h1', name: 'Wild Honey (Jungle)', origin: 'Kohistan', seller: 'Kohistan Honey', district: 'Kohistan', emoji: '🍯', category: 'Honey',
      image: 'https://images.unsplash.com/photo-1587049352846-4a222e784d38?w=200&h=140&fit=crop', pricePerKg: 4500, rating: 5.0, inStock: true),
    DryFruitItem(id: 'h2', name: 'Sidr Honey', origin: 'Swat', seller: 'Swat Pure Honey', district: 'Swat', emoji: '🍯', category: 'Honey',
      image: 'https://images.unsplash.com/photo-1587049352846-4a222e784d38?w=200&h=140&fit=crop', pricePerKg: 3800, rating: 4.9, inStock: true),
    DryFruitItem(id: 'h3', name: 'Mountain Honey (Kaghan)', origin: 'Kaghan Valley', seller: 'Kaghan Bee Farm', district: 'Mansehra', emoji: '🍯', category: 'Honey',
      image: 'https://images.unsplash.com/photo-1587049352846-4a222e784d38?w=200&h=140&fit=crop', pricePerKg: 3200, rating: 4.8, inStock: true),
    DryFruitItem(id: 'h4', name: 'Acacia Honey (Kikar)', origin: 'Peshawar Valley', seller: 'KPK Bee Farms', district: 'Peshawar', emoji: '🍯', category: 'Honey',
      image: 'https://images.unsplash.com/photo-1587049352846-4a222e784d38?w=200&h=140&fit=crop', pricePerKg: 2500, rating: 4.7, inStock: true),
    DryFruitItem(id: 'h5', name: 'Multifloral Honey', origin: 'Dir', seller: 'Dir Honey House', district: 'Dir', emoji: '🍯', category: 'Honey',
      image: 'https://images.unsplash.com/photo-1587049352846-4a222e784d38?w=200&h=140&fit=crop', pricePerKg: 2200, rating: 4.6, inStock: true),
    DryFruitItem(id: 'h6', name: 'Royal Jelly', origin: 'Swat', seller: 'Swat Pure Honey', district: 'Swat', emoji: '👑', category: 'Honey',
      image: 'https://images.unsplash.com/photo-1587049352846-4a222e784d38?w=200&h=140&fit=crop', pricePerKg: 18000, rating: 5.0, inStock: false),

    // ── SEEDS ───────────────────────────────────────────────────────────────
    DryFruitItem(id: 's1', name: 'Pumpkin Seeds', origin: 'Mardan', seller: 'Mardan Organics', district: 'Mardan', emoji: '🎃', category: 'Seeds',
      image: 'https://images.unsplash.com/photo-1610725664285-7c57e6eeac3f?w=200&h=140&fit=crop', pricePerKg: 600, rating: 4.4, inStock: true),
    DryFruitItem(id: 's2', name: 'Sesame Seeds (Til)', origin: 'Lakki Marwat', seller: 'Lakki Farms', district: 'Lakki Marwat', emoji: '🌾', category: 'Seeds',
      image: 'https://images.unsplash.com/photo-1486297717987-3744b7fd9347?w=200&h=140&fit=crop', pricePerKg: 400, rating: 4.3, inStock: true),
    DryFruitItem(id: 's3', name: 'Flaxseed (Alsi)', origin: 'Peshawar', seller: 'Health Plus KPK', district: 'Peshawar', emoji: '🌱', category: 'Seeds',
      image: 'https://images.unsplash.com/photo-1574943320219-553eb213f72d?w=200&h=140&fit=crop', pricePerKg: 350, rating: 4.5, inStock: true),
    DryFruitItem(id: 's4', name: 'Watermelon Seeds', origin: 'DI Khan', seller: 'DI Khan Traders', district: 'DI Khan', emoji: '🍉', category: 'Seeds',
      image: 'https://images.unsplash.com/photo-1610725664285-7c57e6eeac3f?w=200&h=140&fit=crop', pricePerKg: 500, rating: 4.2, inStock: true),
    DryFruitItem(id: 's5', name: 'Sunflower Seeds', origin: 'Swabi', seller: 'Swabi Agri', district: 'Swabi', emoji: '🌻', category: 'Seeds',
      image: 'https://images.unsplash.com/photo-1597848212624-a19eb35e2651?w=200&h=140&fit=crop', pricePerKg: 300, rating: 4.3, inStock: true),
    DryFruitItem(id: 's6', name: 'Chia Seeds', origin: 'Imported (Sold in KPK)', seller: 'Frontier Organics', district: 'Peshawar', emoji: '🌱', category: 'Seeds',
      image: 'https://images.unsplash.com/photo-1574943320219-553eb213f72d?w=200&h=140&fit=crop', pricePerKg: 1200, rating: 4.6, inStock: true),

    // ── SPICES ──────────────────────────────────────────────────────────────
    DryFruitItem(id: 'sp1', name: 'Saffron (Zafran)', origin: 'Afghanistan (via KPK)', seller: 'Karkhano Spices', district: 'Peshawar', emoji: '🌸', category: 'Spices',
      image: 'https://images.unsplash.com/photo-1599707367072-cd6ada2bc375?w=200&h=140&fit=crop', pricePerKg: 300000, rating: 5.0, inStock: true),
    DryFruitItem(id: 'sp2', name: 'Black Cumin (Kalonji)', origin: 'Mardan', seller: 'Mardan Organics', district: 'Mardan', emoji: '🖤', category: 'Spices',
      image: 'https://images.unsplash.com/photo-1556075798-4825dfaaf498?w=200&h=140&fit=crop', pricePerKg: 800, rating: 4.7, inStock: true),
    DryFruitItem(id: 'sp3', name: 'Turmeric (Haldi)', origin: 'Swabi', seller: 'Swabi Organics', district: 'Swabi', emoji: '🟡', category: 'Spices',
      image: 'https://images.unsplash.com/photo-1615485290382-441e4d049cb5?w=200&h=140&fit=crop', pricePerKg: 450, rating: 4.5, inStock: true),
    DryFruitItem(id: 'sp4', name: 'Dried Ginger (Sonth)', origin: 'Peshawar', seller: 'KPK Spice House', district: 'Peshawar', emoji: '🟤', category: 'Spices',
      image: 'https://images.unsplash.com/photo-1615485290382-441e4d049cb5?w=200&h=140&fit=crop', pricePerKg: 600, rating: 4.4, inStock: true),
    DryFruitItem(id: 'sp5', name: 'Ajwain (Carom Seeds)', origin: 'Charsadda', seller: 'Charsadda Farms', district: 'Charsadda', emoji: '🌿', category: 'Spices',
      image: 'https://images.unsplash.com/photo-1486297717987-3744b7fd9347?w=200&h=140&fit=crop', pricePerKg: 500, rating: 4.3, inStock: true),

  ].obs;

  List<DryFruitItem> get filtered {
    final q = searchQuery.value.toLowerCase();
    final cat = selectedCategory.value;
    return items.where((i) {
      final matchQ = q.isEmpty || i.name.toLowerCase().contains(q) || i.origin.toLowerCase().contains(q) || i.seller.toLowerCase().contains(q) || i.category.toLowerCase().contains(q);
      final matchCat = cat == 'All' || i.category == cat;
      return matchQ && matchCat;
    }).toList();
  }
}
