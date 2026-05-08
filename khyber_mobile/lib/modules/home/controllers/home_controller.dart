import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final _box = GetStorage();
  final currentIndex = 0.obs;
  final isLoading    = false.obs;
  final userName     = 'Guest'.obs;
  final greeting     = ''.obs;

  final banners = <Map<String, String>>[
    {'image': 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=600&h=300&fit=crop', 'title': 'Explore KPK', 'subtitle': 'Mountains, culture & heritage', 'route': '/tourism'},
    {'image': 'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?w=600&h=300&fit=crop', 'title': 'Best Food in Peshawar', 'subtitle': 'Order from top restaurants', 'route': '/food'},
    {'image': 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=600&h=300&fit=crop', 'title': 'Peshawari Crafts', 'subtitle': 'Authentic handmade goods', 'route': '/crafts'},
    {'image': 'https://images.unsplash.com/photo-1532375810709-75b1da00537c?w=600&h=300&fit=crop', 'title': 'Book a Ride', 'subtitle': 'Fast & affordable transport', 'route': '/transport'},
  ].obs;

  @override
  void onInit() {
    super.onInit();
    _setGreeting();
    final user = _box.read('user');
    if (user != null) userName.value = user['name'] ?? 'Guest';
  }

  void _setGreeting() {
    final h = DateTime.now().hour;
    if (h < 12) greeting.value = 'Good Morning';
    else if (h < 17) greeting.value = 'Good Afternoon';
    else greeting.value = 'Good Evening';
  }

  void changeTab(int index) => currentIndex.value = index;
}
