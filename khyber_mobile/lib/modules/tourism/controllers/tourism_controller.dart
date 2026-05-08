import 'package:get/get.dart';

class TouristSpot {
  final String id, name, location, district, image, description, category;
  final double rating;
  final List<String> highlights;
  const TouristSpot({required this.id, required this.name, required this.location, required this.district, required this.image, required this.description, required this.category, required this.rating, required this.highlights});
}

class TourismController extends GetxController {
  final selectedCategory = 'All'.obs;
  final searchQuery = ''.obs;

  final categories = ['All', 'Valley', 'Historical', 'Adventure', 'Lakes', 'Waterfalls', 'Forts'];

  final spots = <TouristSpot>[
    TouristSpot(id: 't1', name: 'Swat Valley', location: 'Swat', district: 'Swat', image: 'https://picsum.photos/seed/swat/400/250', description: 'Known as the Switzerland of Pakistan, Swat Valley offers breathtaking mountain scenery, green meadows and ancient Buddhist heritage sites.', category: 'Valley', rating: 4.9, highlights: ['Mingora City', 'Kalam Valley', 'Malam Jabba', 'Ushu Forest']),
    TouristSpot(id: 't2', name: 'Nathia Gali', location: 'Nathia Gali, Abbottabad', district: 'Abbottabad', image: 'https://picsum.photos/seed/nathiagali/400/250', description: 'A beautiful hill station in the Galyat region, famous for its pine forests, cool weather and scenic hiking trails.', category: 'Valley', rating: 4.7, highlights: ['Pine Forests', 'Miranjani Peak', 'Mushkpuri Top', 'Colonial Buildings']),
    TouristSpot(id: 't3', name: 'Kaghan Valley', location: 'Kaghan, Mansehra', district: 'Mansehra', image: 'https://picsum.photos/seed/kaghan/400/250', description: 'A picturesque valley in Mansehra known for Saiful Muluk Lake, Babusar Pass and the breathtaking Naran town.', category: 'Valley', rating: 4.8, highlights: ['Saiful Muluk Lake', 'Naran', 'Babusar Pass', 'Lulusar Lake']),
    TouristSpot(id: 't4', name: 'Takht-e-Bahi', location: 'Mardan', district: 'Mardan', image: 'https://picsum.photos/seed/takht/400/250', description: 'A UNESCO World Heritage Site — the ruins of an ancient Buddhist monastery dating back to 1st century BCE.', category: 'Historical', rating: 4.6, highlights: ['Buddhist Monastery', 'UNESCO Heritage', 'Ancient Ruins', 'Museum']),
    TouristSpot(id: 't5', name: 'Chitral Fort', location: 'Chitral', district: 'Chitral', image: 'https://picsum.photos/seed/chitral/400/250', description: 'Historic fort in Chitral city surrounded by magnificent Hindu Kush mountains and the unique Kalash culture nearby.', category: 'Forts', rating: 4.5, highlights: ['Kalash Valleys', 'Hindu Kush', 'Shandur Pass', 'Polo Festival']),
    TouristSpot(id: 't6', name: 'Banjosa Lake', location: 'Rawalakot', district: 'Poonch', image: 'https://picsum.photos/seed/banjosa/400/250', description: 'A serene artificial lake surrounded by lush forests, perfect for boating and picnicking.', category: 'Lakes', rating: 4.3, highlights: ['Boating', 'Pine Forests', 'Picnic Spots', 'Viewpoints']),
    TouristSpot(id: 't7', name: 'Shahi Bagh', location: 'Peshawar', district: 'Peshawar', image: 'https://picsum.photos/seed/shahbagh/400/250', description: 'Historic Mughal-era gardens in Peshawar featuring ancient trees, fountains and a rich cultural heritage.', category: 'Historical', rating: 4.2, highlights: ['Mughal Architecture', 'Ancient Trees', 'Fountains', 'Picnic Area']),
    TouristSpot(id: 't8', name: 'Mahodand Lake', location: 'Kalam, Swat', district: 'Swat', image: 'https://picsum.photos/seed/mahodand/400/250', description: 'A stunning glacial lake at 9,600 feet near Kalam, surrounded by snow-capped peaks and crystal clear water.', category: 'Lakes', rating: 4.9, highlights: ['Glacial Lake', 'Snow Peaks', 'Trout Fishing', 'Camping']),
  ].obs;

  List<TouristSpot> get filteredSpots => spots.where((s) {
    final matchCat = selectedCategory.value == 'All' || s.category == selectedCategory.value;
    final matchSearch = searchQuery.value.isEmpty || s.name.toLowerCase().contains(searchQuery.value.toLowerCase()) || s.district.toLowerCase().contains(searchQuery.value.toLowerCase());
    return matchCat && matchSearch;
  }).toList();
}
