import 'package:get/get.dart';
import '../models/hotel_model.dart';

class HotelsController extends GetxController {
  final isLoading      = false.obs;
  final selectedFilter = 'All'.obs;
  final searchQuery    = ''.obs;

  final filters = ['All', 'Hotel', 'Resort', 'Villa', 'Guest House'];

  final allProperties = <HotelModel>[
    HotelModel(
      id: '1', name: 'Pearl Continental Peshawar', type: 'hotel',
      location: 'Khyber Road, Peshawar',
      image: 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=600&h=400&fit=crop',
      rating: 4.8, reviews: 342, pricePerNight: 18000,
      amenities: ['WiFi', 'Pool', 'Gym', 'Restaurant', 'Parking', 'Spa'],
    ),
    HotelModel(
      id: '2', name: 'Greens Hotel Peshawar', type: 'hotel',
      location: 'Saddar Road, Peshawar',
      image: 'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?w=600&h=400&fit=crop',
      rating: 4.3, reviews: 178, pricePerNight: 8500,
      amenities: ['WiFi', 'Restaurant', 'Parking', 'Conference Room'],
    ),
    HotelModel(
      id: '3', name: 'Malam Jabba Ski Resort', type: 'resort',
      location: 'Malam Jabba, Swat',
      image: 'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?w=600&h=400&fit=crop',
      rating: 4.7, reviews: 215, pricePerNight: 22000,
      amenities: ['Ski Slopes', 'WiFi', 'Fireplace', 'Restaurant', 'Adventure Sports'],
    ),
    HotelModel(
      id: '4', name: 'Swat Serena Hotel', type: 'resort',
      location: 'Saidu Sharif, Swat',
      image: 'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=600&h=400&fit=crop',
      rating: 4.9, reviews: 487, pricePerNight: 25000,
      amenities: ['Pool', 'Spa', 'WiFi', 'Garden', 'Restaurant', 'Gym'],
    ),
    HotelModel(
      id: '5', name: 'Kaghan Valley Villa', type: 'villa',
      location: 'Naran, Kaghan Valley',
      image: 'https://images.unsplash.com/photo-1499793983690-e29da59ef1c2?w=600&h=400&fit=crop',
      rating: 4.6, reviews: 93, pricePerNight: 35000,
      amenities: ['Private Garden', 'Mountain View', 'Fireplace', 'Full Kitchen', 'BBQ'],
    ),
    HotelModel(
      id: '6', name: 'Chitral Mountain Villa', type: 'villa',
      location: 'Chitral Town, KPK',
      image: 'https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=600&h=400&fit=crop',
      rating: 4.5, reviews: 61, pricePerNight: 28000,
      amenities: ['River View', 'Private Kitchen', 'WiFi', 'Parking', 'Terrace'],
    ),
    HotelModel(
      id: '7', name: 'Old City Guest House', type: 'guesthouse',
      location: 'Qissa Khwani, Peshawar',
      image: 'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=600&h=400&fit=crop',
      rating: 4.2, reviews: 134, pricePerNight: 3500,
      amenities: ['WiFi', 'Breakfast', 'Shared Kitchen', 'Rooftop'],
    ),
    HotelModel(
      id: '8', name: 'Abbottabad Guest House', type: 'guesthouse',
      location: 'Mansehra Road, Abbottabad',
      image: 'https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?w=600&h=400&fit=crop',
      rating: 4.0, reviews: 89, pricePerNight: 2800,
      amenities: ['WiFi', 'Garden', 'Parking', 'Breakfast'],
    ),
    HotelModel(
      id: '9', name: 'Kalam Hilltop Resort', type: 'resort',
      location: 'Kalam, Upper Swat',
      image: 'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=600&h=400&fit=crop',
      rating: 4.8, reviews: 302, pricePerNight: 19500,
      amenities: ['Waterfall View', 'Bonfire', 'Trekking', 'Restaurant', 'WiFi'],
    ),
    HotelModel(
      id: '10', name: 'Naran Luxury Villa', type: 'villa',
      location: 'Naran, KPK',
      image: 'https://images.unsplash.com/photo-1602343168117-bb8ffe3e2e9f?w=600&h=400&fit=crop',
      rating: 4.7, reviews: 55, pricePerNight: 42000,
      amenities: ['Lake View', 'Private Pool', 'Chef on Request', 'Helipad Access', 'WiFi'],
    ),
  ].obs;

  List<HotelModel> get filtered {
    final f = selectedFilter.value;
    final q = searchQuery.value.toLowerCase();
    return allProperties.where((p) {
      final matchType = f == 'All' ||
          (f == 'Hotel'       && p.type == 'hotel') ||
          (f == 'Resort'      && p.type == 'resort') ||
          (f == 'Villa'       && p.type == 'villa') ||
          (f == 'Guest House' && p.type == 'guesthouse');
      final matchSearch = q.isEmpty || p.name.toLowerCase().contains(q) || p.location.toLowerCase().contains(q);
      return matchType && matchSearch;
    }).toList();
  }

  void setFilter(String f) => selectedFilter.value = f;
  void setSearch(String q) => searchQuery.value = q;

  String typeLabel(String type) {
    switch (type) {
      case 'hotel':      return 'Hotel';
      case 'resort':     return 'Resort';
      case 'villa':      return 'Villa';
      case 'guesthouse': return 'Guest House';
      default:           return type;
    }
  }
}
