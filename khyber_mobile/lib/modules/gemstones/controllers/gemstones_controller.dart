import 'package:get/get.dart';

class Gemstone {
  final String id, name, type, origin, seller, district, emoji, grade, image;
  final double pricePerCarat, weightCarat;
  final String color, clarity;
  const Gemstone({required this.id, required this.name, required this.type, required this.origin, required this.seller, required this.district, required this.emoji, required this.grade, required this.image, required this.pricePerCarat, required this.weightCarat, required this.color, required this.clarity});
}

class GemstonesController extends GetxController {
  final searchQuery = ''.obs;
  final selectedType = 'All'.obs;
  final types = ['All', 'Emerald', 'Ruby', 'Tourmaline', 'Spinel', 'Aquamarine', 'Topaz', 'Garnet', 'Other'];

  final gems = <Gemstone>[

    // ── EMERALD ─────────────────────────────────────────────────────────────
    Gemstone(id: 'e1', name: 'Swat Emerald (AAA)', type: 'Emerald', origin: 'Mingora Mines, Swat', seller: 'Swat Gems Co.', district: 'Swat', emoji: '💚', grade: 'AAA',
      image: 'https://images.unsplash.com/photo-1583912268183-a34d27fe7cb2?w=200&h=140&fit=crop', pricePerCarat: 15000, weightCarat: 2.5, color: 'Deep Green', clarity: 'Eye Clean'),
    Gemstone(id: 'e2', name: 'Swat Emerald (AA)', type: 'Emerald', origin: 'Kalam, Swat', seller: 'KPK Minerals', district: 'Swat', emoji: '💚', grade: 'AA',
      image: 'https://images.unsplash.com/photo-1583912268183-a34d27fe7cb2?w=200&h=140&fit=crop', pricePerCarat: 8000, weightCarat: 4.2, color: 'Medium Green', clarity: 'Slightly Included'),
    Gemstone(id: 'e3', name: 'Emerald (Commercial)', type: 'Emerald', origin: 'Shangla, Swat', seller: 'Gem Bazaar Peshawar', district: 'Peshawar', emoji: '💚', grade: 'A',
      image: 'https://images.unsplash.com/photo-1583912268183-a34d27fe7cb2?w=200&h=140&fit=crop', pricePerCarat: 2500, weightCarat: 8.0, color: 'Light Green', clarity: 'Included'),
    Gemstone(id: 'e4', name: 'Trapiche Emerald', type: 'Emerald', origin: 'Mingora Mines, Swat', seller: 'Swat Gems Co.', district: 'Swat', emoji: '⭐', grade: 'Rare',
      image: 'https://images.unsplash.com/photo-1583912268183-a34d27fe7cb2?w=200&h=140&fit=crop', pricePerCarat: 35000, weightCarat: 1.8, color: 'Star Pattern Green', clarity: 'Eye Clean'),

    // ── RUBY ────────────────────────────────────────────────────────────────
    Gemstone(id: 'r1', name: 'Chitral Ruby (Pigeon Blood)', type: 'Ruby', origin: 'Chitral', seller: 'Chitral Gems', district: 'Chitral', emoji: '❤️', grade: 'AA',
      image: 'https://images.unsplash.com/photo-1573408301185-9519f94f4aca?w=200&h=140&fit=crop', pricePerCarat: 25000, weightCarat: 1.8, color: 'Pigeon Blood Red', clarity: 'Slightly Included'),
    Gemstone(id: 'r2', name: 'Ruby (Untreated)', type: 'Ruby', origin: 'Chitral', seller: 'North Star Gems', district: 'Peshawar', emoji: '❤️', grade: 'A',
      image: 'https://images.unsplash.com/photo-1573408301185-9519f94f4aca?w=200&h=140&fit=crop', pricePerCarat: 10000, weightCarat: 3.5, color: 'Deep Red', clarity: 'Included'),
    Gemstone(id: 'r3', name: 'Star Ruby', type: 'Ruby', origin: 'Mohmand', seller: 'Tribal Gems', district: 'Mohmand', emoji: '⭐', grade: 'Special',
      image: 'https://images.unsplash.com/photo-1573408301185-9519f94f4aca?w=200&h=140&fit=crop', pricePerCarat: 18000, weightCarat: 2.2, color: 'Pinkish Red', clarity: 'Translucent'),

    // ── TOURMALINE ──────────────────────────────────────────────────────────
    Gemstone(id: 't1', name: 'Tourmaline (Paraiba-type)', type: 'Tourmaline', origin: 'Kunar Valley (via KPK)', seller: 'KPK Minerals', district: 'Peshawar', emoji: '🩵', grade: 'AAA',
      image: 'https://images.unsplash.com/photo-1616626625495-27d0e4c7671f?w=200&h=140&fit=crop', pricePerCarat: 8000, weightCarat: 3.2, color: 'Neon Blue-Green', clarity: 'Eye Clean'),
    Gemstone(id: 't2', name: 'Pink Tourmaline (Rubellite)', type: 'Tourmaline', origin: 'Nuristan (via KPK)', seller: 'Gem Bazaar', district: 'Peshawar', emoji: '🩷', grade: 'AA',
      image: 'https://images.unsplash.com/photo-1616626625495-27d0e4c7671f?w=200&h=140&fit=crop', pricePerCarat: 5000, weightCarat: 4.1, color: 'Hot Pink', clarity: 'Eye Clean'),
    Gemstone(id: 't3', name: 'Green Tourmaline (Verdelite)', type: 'Tourmaline', origin: 'Swat', seller: 'Swat Gems Co.', district: 'Swat', emoji: '💚', grade: 'A',
      image: 'https://images.unsplash.com/photo-1616626625495-27d0e4c7671f?w=200&h=140&fit=crop', pricePerCarat: 2500, weightCarat: 6.5, color: 'Forest Green', clarity: 'Eye Clean'),
    Gemstone(id: 't4', name: 'Bi-Colour Tourmaline', type: 'Tourmaline', origin: 'Swat', seller: 'Swat Gems Co.', district: 'Swat', emoji: '🌈', grade: 'Special',
      image: 'https://images.unsplash.com/photo-1616626625495-27d0e4c7671f?w=200&h=140&fit=crop', pricePerCarat: 6000, weightCarat: 5.0, color: 'Pink-Green', clarity: 'Eye Clean'),
    Gemstone(id: 't5', name: 'Blue Tourmaline (Indicolite)', type: 'Tourmaline', origin: 'Afghanistan (via KPK)', seller: 'Karkhano Gems', district: 'Peshawar', emoji: '💙', grade: 'AA',
      image: 'https://images.unsplash.com/photo-1616626625495-27d0e4c7671f?w=200&h=140&fit=crop', pricePerCarat: 7000, weightCarat: 3.8, color: 'Teal Blue', clarity: 'Eye Clean'),

    // ── SPINEL ──────────────────────────────────────────────────────────────
    Gemstone(id: 'sp1', name: 'Bajaur Red Spinel', type: 'Spinel', origin: 'Bajaur', seller: 'Tribal Gems', district: 'Bajaur', emoji: '💜', grade: 'A',
      image: 'https://images.unsplash.com/photo-1599707367072-cd6ada2bc375?w=200&h=140&fit=crop', pricePerCarat: 3500, weightCarat: 2.0, color: 'Purple-Red', clarity: 'Slightly Included'),
    Gemstone(id: 'sp2', name: 'Pink Spinel', type: 'Spinel', origin: 'Mohmand', seller: 'KPK Minerals', district: 'Peshawar', emoji: '🩷', grade: 'AA',
      image: 'https://images.unsplash.com/photo-1599707367072-cd6ada2bc375?w=200&h=140&fit=crop', pricePerCarat: 5000, weightCarat: 2.8, color: 'Hot Pink', clarity: 'Eye Clean'),
    Gemstone(id: 'sp3', name: 'Cobalt Blue Spinel', type: 'Spinel', origin: 'Chitral', seller: 'Chitral Gems', district: 'Chitral', emoji: '💙', grade: 'AA',
      image: 'https://images.unsplash.com/photo-1599707367072-cd6ada2bc375?w=200&h=140&fit=crop', pricePerCarat: 8500, weightCarat: 1.5, color: 'Cobalt Blue', clarity: 'Eye Clean'),

    // ── AQUAMARINE ──────────────────────────────────────────────────────────
    Gemstone(id: 'aq1', name: 'Aquamarine (Premium)', type: 'Aquamarine', origin: 'Shigar (via KPK)', seller: 'North Star Gems', district: 'Peshawar', emoji: '💙', grade: 'AA',
      image: 'https://images.unsplash.com/photo-1586901533048-0e856d8b1b8e?w=200&h=140&fit=crop', pricePerCarat: 4500, weightCarat: 5.5, color: 'Sky Blue', clarity: 'Eye Clean'),
    Gemstone(id: 'aq2', name: 'Aquamarine (Standard)', type: 'Aquamarine', origin: 'Kunar (via KPK)', seller: 'Gem Bazaar', district: 'Peshawar', emoji: '🩵', grade: 'A',
      image: 'https://images.unsplash.com/photo-1586901533048-0e856d8b1b8e?w=200&h=140&fit=crop', pricePerCarat: 1800, weightCarat: 9.0, color: 'Pale Blue', clarity: 'Eye Clean'),
    Gemstone(id: 'aq3', name: 'Santa Maria Aquamarine', type: 'Aquamarine', origin: 'Afghanistan (via KPK)', seller: 'Karkhano Gems', district: 'Peshawar', emoji: '💎', grade: 'AAA',
      image: 'https://images.unsplash.com/photo-1586901533048-0e856d8b1b8e?w=200&h=140&fit=crop', pricePerCarat: 9000, weightCarat: 3.2, color: 'Deep Blue', clarity: 'Eye Clean'),

    // ── TOPAZ ───────────────────────────────────────────────────────────────
    Gemstone(id: 'to1', name: 'Imperial Topaz', type: 'Topaz', origin: 'Afghanistan (via KPK)', seller: 'Karkhano Gems', district: 'Peshawar', emoji: '🟡', grade: 'AA',
      image: 'https://images.unsplash.com/photo-1583912268183-a34d27fe7cb2?w=200&h=140&fit=crop', pricePerCarat: 3000, weightCarat: 4.0, color: 'Golden Orange', clarity: 'Eye Clean'),
    Gemstone(id: 'to2', name: 'Blue Topaz (Sky)', type: 'Topaz', origin: 'Skardu (via KPK)', seller: 'North Star Gems', district: 'Peshawar', emoji: '💙', grade: 'A',
      image: 'https://images.unsplash.com/photo-1586901533048-0e856d8b1b8e?w=200&h=140&fit=crop', pricePerCarat: 800, weightCarat: 12.0, color: 'Sky Blue', clarity: 'Eye Clean'),

    // ── GARNET ──────────────────────────────────────────────────────────────
    Gemstone(id: 'ga1', name: 'Hessonite Garnet', type: 'Garnet', origin: 'Kunar (via KPK)', seller: 'Gem Bazaar', district: 'Peshawar', emoji: '🔴', grade: 'A',
      image: 'https://images.unsplash.com/photo-1573408301185-9519f94f4aca?w=200&h=140&fit=crop', pricePerCarat: 1200, weightCarat: 5.5, color: 'Cinnamon Orange', clarity: 'Eye Clean'),
    Gemstone(id: 'ga2', name: 'Demantoid Garnet', type: 'Garnet', origin: 'Afghanistan (via KPK)', seller: 'Karkhano Gems', district: 'Peshawar', emoji: '💚', grade: 'AA',
      image: 'https://images.unsplash.com/photo-1583912268183-a34d27fe7cb2?w=200&h=140&fit=crop', pricePerCarat: 6000, weightCarat: 1.2, color: 'Bright Green', clarity: 'Eye Clean'),

    // ── OTHER ───────────────────────────────────────────────────────────────
    Gemstone(id: 'o1', name: 'Peridot', type: 'Other', origin: 'Kohistan', seller: 'KPK Minerals', district: 'Kohistan', emoji: '💛', grade: 'A',
      image: 'https://images.unsplash.com/photo-1583912268183-a34d27fe7cb2?w=200&h=140&fit=crop', pricePerCarat: 1200, weightCarat: 6.0, color: 'Olive Green', clarity: 'Eye Clean'),
    Gemstone(id: 'o2', name: 'Kunzite', type: 'Other', origin: 'Nuristan (via KPK)', seller: 'Gem Bazaar', district: 'Peshawar', emoji: '🩷', grade: 'AA',
      image: 'https://images.unsplash.com/photo-1599707367072-cd6ada2bc375?w=200&h=140&fit=crop', pricePerCarat: 2000, weightCarat: 8.0, color: 'Lilac Pink', clarity: 'Eye Clean'),
    Gemstone(id: 'o3', name: 'Lapis Lazuli', type: 'Other', origin: 'Afghanistan (via KPK)', seller: 'Karkhano Market', district: 'Peshawar', emoji: '🔵', grade: 'A',
      image: 'https://images.unsplash.com/photo-1599707367072-cd6ada2bc375?w=200&h=140&fit=crop', pricePerCarat: 500, weightCarat: 20.0, color: 'Royal Blue', clarity: 'Opaque'),
    Gemstone(id: 'o4', name: 'Turquoise (Feroza)', type: 'Other', origin: 'Afghanistan (via KPK)', seller: 'Tribal Gems', district: 'Bajaur', emoji: '🩵', grade: 'A',
      image: 'https://images.unsplash.com/photo-1616626625495-27d0e4c7671f?w=200&h=140&fit=crop', pricePerCarat: 800, weightCarat: 15.0, color: 'Sky Turquoise', clarity: 'Opaque'),
    Gemstone(id: 'o5', name: 'Moonstone', type: 'Other', origin: 'Afghanistan (via KPK)', seller: 'North Star Gems', district: 'Peshawar', emoji: '🌙', grade: 'AA',
      image: 'https://images.unsplash.com/photo-1586901533048-0e856d8b1b8e?w=200&h=140&fit=crop', pricePerCarat: 1500, weightCarat: 7.0, color: 'White-Blue Adularescence', clarity: 'Translucent'),

  ];

  List<Gemstone> get filtered {
    final q = searchQuery.value.toLowerCase();
    final t = selectedType.value;
    return gems.where((g) {
      final matchQ = q.isEmpty || g.name.toLowerCase().contains(q) || g.origin.toLowerCase().contains(q) || g.seller.toLowerCase().contains(q) || g.color.toLowerCase().contains(q);
      final matchT = t == 'All' || g.type == t;
      return matchQ && matchT;
    }).toList();
  }
}
