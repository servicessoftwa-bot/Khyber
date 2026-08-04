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
  final types = ['All', 'Marble', 'Granite', 'Onyx', 'Limestone', 'Sandstone', 'Slate'];

  final products = <MarbleProduct>[

    // ── MARBLE ──────────────────────────────────────────────────────────────
    MarbleProduct(id: 'm1', name: 'Ziarat White Marble', type: 'Marble', origin: 'Ziarat, Buner', supplier: 'Buner Marble Works', district: 'Buner', finish: 'Polished', pricePerSqFt: 180, emoji: '⬜', color: 'Pure White',
      image: 'https://images.unsplash.com/photo-1564540574859-0dfb63985953?w=200&h=140&fit=crop', available: true),
    MarbleProduct(id: 'm2', name: 'Mohmand Black Marble', type: 'Marble', origin: 'Mohmand', supplier: 'Mohmand Stone Co.', district: 'Mohmand', finish: 'Polished', pricePerSqFt: 220, emoji: '⬛', color: 'Jet Black',
      image: 'https://images.unsplash.com/photo-1565793298595-6a879b1d9492?w=200&h=140&fit=crop', available: true),
    MarbleProduct(id: 'm3', name: 'KPK Beige Marble', type: 'Marble', origin: 'Charsadda', supplier: 'KPK Stone Hub', district: 'Charsadda', finish: 'Honed', pricePerSqFt: 150, emoji: '🟨', color: 'Cream Beige',
      image: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=200&h=140&fit=crop', available: true),
    MarbleProduct(id: 'm4', name: 'Swat Valley Marble (Grey-White)', type: 'Marble', origin: 'Swat', supplier: 'Swat Minerals', district: 'Swat', finish: 'Polished', pricePerSqFt: 200, emoji: '🔲', color: 'Grey Veined White',
      image: 'https://images.unsplash.com/photo-1564540574859-0dfb63985953?w=200&h=140&fit=crop', available: true),
    MarbleProduct(id: 'm5', name: 'Nowshera Rose Marble', type: 'Marble', origin: 'Nowshera', supplier: 'Nowshera Stone Mart', district: 'Nowshera', finish: 'Polished', pricePerSqFt: 240, emoji: '🌸', color: 'Rose Pink',
      image: 'https://images.unsplash.com/photo-1617791160536-598cf32026fb?w=200&h=140&fit=crop', available: true),
    MarbleProduct(id: 'm6', name: 'Afghan White Marble (via KPK)', type: 'Marble', origin: 'Afghanistan import', supplier: 'Peshawar Stone Mart', district: 'Peshawar', finish: 'Polished', pricePerSqFt: 160, emoji: '⬜', color: 'Pure White Fine',
      image: 'https://images.unsplash.com/photo-1564540574859-0dfb63985953?w=200&h=140&fit=crop', available: true),
    MarbleProduct(id: 'm7', name: 'Mardan Crème Marble', type: 'Marble', origin: 'Mardan', supplier: 'Mardan Granite Works', district: 'Mardan', finish: 'Honed', pricePerSqFt: 170, emoji: '🟧', color: 'Warm Crème',
      image: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=200&h=140&fit=crop', available: true),
    MarbleProduct(id: 'm8', name: 'Kohat Brown-Veined Marble', type: 'Marble', origin: 'Kohat', supplier: 'Kohat Stone Traders', district: 'Kohat', finish: 'Polished', pricePerSqFt: 190, emoji: '🟫', color: 'Brown Veined',
      image: 'https://images.unsplash.com/photo-1565793298595-6a879b1d9492?w=200&h=140&fit=crop', available: false),

    // ── GRANITE ─────────────────────────────────────────────────────────────
    MarbleProduct(id: 'g1', name: 'Khyber Grey Granite', type: 'Granite', origin: 'Mardan', supplier: 'Mardan Granite Works', district: 'Mardan', finish: 'Polished', pricePerSqFt: 200, emoji: '🪨', color: 'Silver Grey',
      image: 'https://images.unsplash.com/photo-1565793298595-6a879b1d9492?w=200&h=140&fit=crop', available: true),
    MarbleProduct(id: 'g2', name: 'Black Galaxy Granite', type: 'Granite', origin: 'Imported (Peshawar hub)', supplier: 'KPK Stone Hub', district: 'Peshawar', finish: 'Polished', pricePerSqFt: 320, emoji: '⬛', color: 'Black with Gold Flecks',
      image: 'https://images.unsplash.com/photo-1565793298595-6a879b1d9492?w=200&h=140&fit=crop', available: true),
    MarbleProduct(id: 'g3', name: 'Tan Brown Granite', type: 'Granite', origin: 'Imported (Peshawar hub)', supplier: 'Frontier Stone Traders', district: 'Peshawar', finish: 'Polished', pricePerSqFt: 280, emoji: '🟫', color: 'Tan Brown Gold',
      image: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=200&h=140&fit=crop', available: true),
    MarbleProduct(id: 'g4', name: 'Kashmir White Granite', type: 'Granite', origin: 'Imported (Peshawar hub)', supplier: 'Buner Marble Works', district: 'Peshawar', finish: 'Polished', pricePerSqFt: 300, emoji: '⬜', color: 'White-Grey Fleck',
      image: 'https://images.unsplash.com/photo-1564540574859-0dfb63985953?w=200&h=140&fit=crop', available: true),
    MarbleProduct(id: 'g5', name: 'Absolute Black Granite', type: 'Granite', origin: 'Imported (Peshawar hub)', supplier: 'Mohmand Stone Co.', district: 'Peshawar', finish: 'Flamed', pricePerSqFt: 250, emoji: '⬛', color: 'Absolute Black',
      image: 'https://images.unsplash.com/photo-1565793298595-6a879b1d9492?w=200&h=140&fit=crop', available: true),

    // ── ONYX ────────────────────────────────────────────────────────────────
    MarbleProduct(id: 'o1', name: 'Swat Green Onyx', type: 'Onyx', origin: 'Swat', supplier: 'Swat Minerals', district: 'Swat', finish: 'Polished', pricePerSqFt: 350, emoji: '🟩', color: 'Forest Green',
      image: 'https://images.unsplash.com/photo-1617791160536-598cf32026fb?w=200&h=140&fit=crop', available: true),
    MarbleProduct(id: 'o2', name: 'Honey Onyx (Backlit)', type: 'Onyx', origin: 'Swat', supplier: 'Swat Minerals', district: 'Swat', finish: 'Polished', pricePerSqFt: 400, emoji: '🟧', color: 'Honey Gold',
      image: 'https://images.unsplash.com/photo-1617791160536-598cf32026fb?w=200&h=140&fit=crop', available: false),
    MarbleProduct(id: 'o3', name: 'White Onyx', type: 'Onyx', origin: 'Swat', supplier: 'KPK Stone Hub', district: 'Swat', finish: 'Polished', pricePerSqFt: 380, emoji: '⬜', color: 'Translucent White',
      image: 'https://images.unsplash.com/photo-1564540574859-0dfb63985953?w=200&h=140&fit=crop', available: true),
    MarbleProduct(id: 'o4', name: 'Blue Ice Onyx', type: 'Onyx', origin: 'Afghanistan (via KPK)', supplier: 'Frontier Stone Traders', district: 'Peshawar', finish: 'Polished', pricePerSqFt: 450, emoji: '🔵', color: 'Ice Blue',
      image: 'https://images.unsplash.com/photo-1617791160536-598cf32026fb?w=200&h=140&fit=crop', available: true),

    // ── LIMESTONE ───────────────────────────────────────────────────────────
    MarbleProduct(id: 'l1', name: 'Kohat Brown Limestone', type: 'Limestone', origin: 'Kohat', supplier: 'Kohat Stone Traders', district: 'Kohat', finish: 'Natural', pricePerSqFt: 90, emoji: '🟫', color: 'Earthy Brown',
      image: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=200&h=140&fit=crop', available: true),
    MarbleProduct(id: 'l2', name: 'Peshawar Beige Limestone', type: 'Limestone', origin: 'Peshawar', supplier: 'Peshawar Stone Mart', district: 'Peshawar', finish: 'Honed', pricePerSqFt: 100, emoji: '🟨', color: 'Sandy Beige',
      image: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=200&h=140&fit=crop', available: true),
    MarbleProduct(id: 'l3', name: 'DI Khan Grey Limestone', type: 'Limestone', origin: 'DI Khan', supplier: 'DI Khan Stone Works', district: 'DI Khan', finish: 'Natural', pricePerSqFt: 80, emoji: '🪨', color: 'Grey',
      image: 'https://images.unsplash.com/photo-1565793298595-6a879b1d9492?w=200&h=140&fit=crop', available: true),

    // ── SANDSTONE ───────────────────────────────────────────────────────────
    MarbleProduct(id: 'ss1', name: 'Peshawar Red Sandstone', type: 'Sandstone', origin: 'Peshawar', supplier: 'Peshawar Stone Mart', district: 'Peshawar', finish: 'Rough', pricePerSqFt: 120, emoji: '🔴', color: 'Terracotta Red',
      image: 'https://images.unsplash.com/photo-1604076913837-52ab5629fde9?w=200&h=140&fit=crop', available: true),
    MarbleProduct(id: 'ss2', name: 'Attock Yellow Sandstone', type: 'Sandstone', origin: 'Attock (KPK border)', supplier: 'Nowshera Stone Mart', district: 'Nowshera', finish: 'Rough', pricePerSqFt: 100, emoji: '🟡', color: 'Golden Yellow',
      image: 'https://images.unsplash.com/photo-1604076913837-52ab5629fde9?w=200&h=140&fit=crop', available: true),
    MarbleProduct(id: 'ss3', name: 'Mardan Brown Sandstone', type: 'Sandstone', origin: 'Mardan', supplier: 'Mardan Granite Works', district: 'Mardan', finish: 'Natural', pricePerSqFt: 110, emoji: '🟫', color: 'Earthy Brown',
      image: 'https://images.unsplash.com/photo-1604076913837-52ab5629fde9?w=200&h=140&fit=crop', available: true),

    // ── SLATE ───────────────────────────────────────────────────────────────
    MarbleProduct(id: 'sl1', name: 'Swat Black Slate', type: 'Slate', origin: 'Swat', supplier: 'Swat Minerals', district: 'Swat', finish: 'Natural Cleft', pricePerSqFt: 140, emoji: '⬛', color: 'Charcoal Black',
      image: 'https://images.unsplash.com/photo-1565793298595-6a879b1d9492?w=200&h=140&fit=crop', available: true),
    MarbleProduct(id: 'sl2', name: 'Chitral Green Slate', type: 'Slate', origin: 'Chitral', supplier: 'Chitral Stone Co.', district: 'Chitral', finish: 'Natural Cleft', pricePerSqFt: 160, emoji: '🟩', color: 'Dark Green',
      image: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=200&h=140&fit=crop', available: true),
    MarbleProduct(id: 'sl3', name: 'Kohistan Grey Slate (Roof)', type: 'Slate', origin: 'Kohistan', supplier: 'KPK Stone Hub', district: 'Kohistan', finish: 'Split', pricePerSqFt: 130, emoji: '🪨', color: 'Slate Grey',
      image: 'https://images.unsplash.com/photo-1565793298595-6a879b1d9492?w=200&h=140&fit=crop', available: true),

  ];

  List<MarbleProduct> get filtered {
    final q = searchQuery.value.toLowerCase();
    final t = selectedType.value;
    return products.where((p) {
      final matchQ = q.isEmpty || p.name.toLowerCase().contains(q) || p.origin.toLowerCase().contains(q) || p.supplier.toLowerCase().contains(q) || p.color.toLowerCase().contains(q);
      final matchT = t == 'All' || p.type == t;
      return matchQ && matchT;
    }).toList();
  }
}
