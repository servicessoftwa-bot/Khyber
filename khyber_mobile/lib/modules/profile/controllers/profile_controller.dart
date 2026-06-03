import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../app/routes/app_routes.dart';

class ProfileController extends GetxController {
  final _box = GetStorage();
  final userName  = ''.obs;
  final userEmail = ''.obs;
  final userPhone = ''.obs;

  bool get isAdmin => (_box.read('user')?['isAdmin'] ?? false) == true;

  @override
  void onInit() {
    super.onInit();
    final u = _box.read('user');
    if (u != null) {
      userName.value  = u['name']  ?? '';
      userEmail.value = u['email'] ?? '';
      userPhone.value = u['phone'] ?? '';
    }
  }

  void logout() {
    _box.remove('access_token');
    _box.remove('user');
    Get.offAllNamed(AppRoutes.login);
  }
}