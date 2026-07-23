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
  final types = ['All', 'Emerald', 'Ruby', 'Tourmaline', 'Spinel', 'Aquamarine', 'Other'];

  final gems = <Gemstone>[
    Gemstone(id: 'g1', name: 'Swat Emerald', type: 'Emerald', origin: 'Mingora Mines, Swat', seller: 'Swat Gems Co.', district: 'Swat', emoji: '💚', grade: 'AAA', image: 'https://images.unsplash.com/photo-1583912268183-a34d27fe7cb2?w=200&h=140&fit=crop', pricePerCarat: 15000, weightCarat: 2.5, color: 'Deep Green', clarity: 'Eye Clean'),
    Gemstone(id: 'g2', name: 'Chitral Ruby', type: 'Ruby', origin: 'Chitral', seller: 'Chitral Gems', district: 'Chitral', emoji: '❤️', grade: 'AA', image: 'https://images.unsplash.com/photo-1573408301185-9519f94f4aca?w=200&h=140&fit=crop', pricePerCarat: 25000, weightCarat: 1.8, color: 'Pigeon Blood Red', clarity: 'Slightly Included'),
    Gemstone(id: 'g3', name: 'Tourmaline (Paraiba-type)', type: 'Tourmaline', origin: 'Kunar Valley', seller: 'KPK Minerals', district: 'Peshawar', emoji: '🩵', grade: 'AAA', image: 'https://images.unsplash.com/photo-1616626625495-27d0e4c7671f?w=200&h=140&fit=crop', pricePerCarat: 8000, weightCarat: 3.2, color: 'Neon Blue-Green', clarity: 'Eye Clean'),
    Gemstone(id: 'g4', name: 'Pink Tourmaline', type: 'Tourmaline', origin: 'Nuristan (via KPK)', seller: 'Gem Bazaar', district: 'Peshawar', emoji: '🩷', grade: 'AA', image: 'https://images.unsplash.com/photo-1616626625495-27d0e4c7671f?w=200&h=140&fit=crop', pricePerCarat: 5000, weightCarat: 4.1, color: 'Hot Pink', clarity: 'Eye Clean'),
    Gemstone(id: 'g5', name: 'Bajaur Spinel', type: 'Spinel', origin: 'Bajaur', seller: 'Tribal Gems', district: 'Bajaur', emoji: '💜', grade: 'A', image: 'https://images.unsplash.com/photo-1599707367072-cd6ada2bc375?w=200&h=140&fit=crop', pricePerCarat: 3500, weightCarat: 2.0, color: 'Purple-Red', clarity: 'Slightly Included'),
    Gemstone(id: 'g6', name: 'Aquamarine', type: 'Aquamarine', origin: 'Shigar (via KPK)', seller: 'North Star Gems', district: 'Peshawar', emoji: '💙', grade: 'AA', image: 'https://images.unsplash.com/photo-1586901533048-0e856d8b1b8e?w=200&h=140&fit=crop', pricePerCarat: 4500, weightCarat: 5.5, color: 'Sky Blue', clarity: 'Eye Clean'),
    Gemstone(id: 'g7', name: 'Peridot', type: 'Other', origin: 'Kohistan', seller: 'KPK Minerals', district: 'Kohistan', emoji: '💛', grade: 'A', image: 'https://images.unsplash.com/photo-1583912268183-a34d27fe7cb2?w=200&h=140&fit=crop', pricePerCarat: 1200, weightCarat: 6.0, color: 'Olive Green', clarity: 'Eye Clean'),
    Gemstone(id: 'g8', name: 'Kunzite', type: 'Other', origin: 'Nuristan (via KPK)', seller: 'Gem Bazaar', district: 'Peshawar', emoji: '🩷', grade: 'AA', image: 'https://images.unsplash.com/photo-1599707367072-cd6ada2bc375?w=200&h=140&fit=crop', pricePerCarat: 2000, weightCarat: 8.0, color: 'Lilac Pink', clarity: 'Eye Clean'),
  ];

  List<Gemstone> get filtered {
    final q = searchQuery.value.toLowerCase();
    final t = selectedType.value;
    return gems.where((g) {
      final matchQ = q.isEmpty || g.name.toLowerCase().contains(q) || g.origin.toLowerCase().contains(q) || g.seller.toLowerCase().contains(q);
      final matchT = t == 'All' || g.type == t;
      return matchQ && matchT;
    }).toList();
  }
}