import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../app/routes/app_routes.dart';

class AuthController extends GetxController {
  final _box = GetStorage();
  final isLoading = false.obs;
  final isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    isLoggedIn.value = _box.read('access_token') != null;
  }

  Future<void> checkAuth() async {
    final token = _box.read('access_token');
    if (token != null) {
      Get.offAllNamed(AppRoutes.home);
    } else {
      final seen = _box.read('onboarding_seen') ?? false;
      Get.offAllNamed(seen ? AppRoutes.login : AppRoutes.onboarding);
    }
  }

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    try {
      await Future.delayed(const Duration(seconds: 1));
      final isAdmin = email.trim().toLowerCase() == 'admin@khyber.pk' && password == 'Admin@123';
      _box.write('access_token', isAdmin ? 'admin_token' : 'mock_token');
      _box.write('user', {
        'name': isAdmin ? 'Admin' : 'KPK User',
        'email': email.trim().toLowerCase(),
        'isAdmin': isAdmin,
      });
      isLoggedIn.value = true;
      Get.offAllNamed(AppRoutes.home);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> register(String name, String email, String phone, String password) async {
    isLoading.value = true;
    try {
      await Future.delayed(const Duration(seconds: 1));
      _box.write('access_token', 'mock_token');
      _box.write('user', {'name': name, 'email': email, 'phone': phone, 'isAdmin': false});
      isLoggedIn.value = true;
      Get.offAllNamed(AppRoutes.home);
    } finally {
      isLoading.value = false;
    }
  }

  void logout() {
    _box.remove('access_token');
    _box.remove('user');
    isLoggedIn.value = false;
    Get.offAllNamed(AppRoutes.login);
  }

  Map<String, dynamic>? get currentUser => _box.read('user');
  String get userName => currentUser?['name'] ?? 'Guest';
}