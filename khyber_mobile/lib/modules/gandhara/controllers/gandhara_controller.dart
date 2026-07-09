import 'package:get/get.dart';

class GandharaSite {
  final String id, name, district, period, type, description, image;
  final double rating;
  final bool isUnescoListed;
  final String entryFee, timings;
  const GandharaSite({required this.id, required this.name, required this.district, required this.period, required this.type, required this.description, required this.image, required this.rating, required this.isUnescoListed, required this.entryFee, required this.timings});
}

class GandharaController extends GetxController {
  final searchQuery = ''.obs;
  final selectedType = 'All'.obs;
  final types = ['All', 'Stupa', 'Museum', 'Monastery', 'Fort', 'City Ruins'];

  final sites = <GandharaSite>[
    GandharaSite(id: 's1', name: 'Takht-i-Bahi', district: 'Mardan', period: '1st century BCE – 7th century CE', type: 'Monastery', description: 'UNESCO World Heritage Site. One of the best-preserved Buddhist monastery complexes in the world, perched on a hilltop near Mardan.', image: 'https://images.unsplash.com/photo-1558618047-3c8d46dc2f14?w=600', rating: 4.9, isUnescoListed: true, entryFee: 'PKR 30', timings: '08:00 – 17:00'),
    GandharaSite(id: 's2', name: 'Sehri Bahlol (Sahri Bahlol)', district: 'Mardan', period: '1st–5th century CE', type: 'City Ruins', description: 'Ancient Gandharan city ruins with significant Buddhist artifacts. Nearby Takht-i-Bahi, part of UNESCO listing.', image: 'https://images.unsplash.com/photo-1587474260584-136574528ed5?w=600', rating: 4.5, isUnescoListed: true, entryFee: 'Free', timings: 'Daylight hours'),
    GandharaSite(id: 's3', name: 'Peshawar Museum', district: 'Peshawar', period: 'Collection: 1st–7th CE', type: 'Museum', description: 'Houses one of the world\'s finest collections of Gandharan Buddhist art, including thousands of sculptures, coins, and artifacts.', image: 'https://images.unsplash.com/photo-1565967511849-76a60a516170?w=600', rating: 4.8, isUnescoListed: false, entryFee: 'PKR 50', timings: '09:00 – 16:00'),
    GandharaSite(id: 's4', name: 'Charsadda (Pushkalavati)', district: 'Charsadda', period: '6th BCE – 2nd CE', type: 'City Ruins', description: 'Ancient capital of Gandhara kingdom, mentioned by Greek historian Herodotus. Site of Bala Hisar Fort ruins.', image: 'https://images.unsplash.com/photo-1582560475093-ba66accbc424?w=600', rating: 4.3, isUnescoListed: false, entryFee: 'Free', timings: 'Daylight hours'),
    GandharaSite(id: 's5', name: 'Butkara Stupa, Swat', district: 'Swat', period: '3rd BCE – 10th CE', type: 'Stupa', description: 'Major Buddhist stupa in Swat Valley. Excavated by Italian archaeologists, revealing Buddhist relics spanning over 1000 years.', image: 'https://images.unsplash.com/photo-1580327344181-c1163234e5a0?w=600', rating: 4.7, isUnescoListed: false, entryFee: 'PKR 20', timings: '08:00 – 17:00'),
    GandharaSite(id: 's6', name: 'Swat Museum', district: 'Swat', period: 'Collection: 1st–10th CE', type: 'Museum', description: 'Rebuilt after Taliban damage, the Swat Museum houses remarkable Gandharan and Islamic-era artifacts from across Swat Valley.', image: 'https://images.unsplash.com/photo-1550159930-40066082a4fc?w=600', rating: 4.8, isUnescoListed: false, entryFee: 'PKR 40', timings: '09:00 – 16:00'),
    GandharaSite(id: 's7', name: 'Shingardar Stupa', district: 'Swat', period: '2nd–5th century CE', type: 'Stupa', description: 'One of the largest stupas in Swat, standing 20m tall. Believed to enshrine relics of Buddha brought from India.', image: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=600', rating: 4.5, isUnescoListed: false, entryFee: 'Free', timings: 'Daylight hours'),
    GandharaSite(id: 's8', name: 'Bala Hisar Fort, Peshawar', district: 'Peshawar', period: 'Ancient – Mughal Era', type: 'Fort', description: 'The High Fort of Peshawar, continuously inhabited for over 2000 years. Currently used by Pakistan Army but partially open to public.', image: 'https://images.unsplash.com/photo-1597773150796-e5c14ebecbf5?w=600', rating: 4.4, isUnescoListed: false, entryFee: 'Restricted', timings: 'Limited access'),
  ];

  List<GandharaSite> get filtered {
    final q = searchQuery.value.toLowerCase();
    final t = selectedType.value;
    return sites.where((s) {
      final matchQ = q.isEmpty || s.name.toLowerCase().contains(q) || s.district.toLowerCase().contains(q) || s.period.toLowerCase().contains(q);
      final matchT = t == 'All' || s.type == t;
      return matchQ && matchT;
    }).toList();
  }
}