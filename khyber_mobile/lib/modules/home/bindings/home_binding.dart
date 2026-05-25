import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../orders/controllers/orders_controller.dart';
import '../../wallet/controllers/wallet_controller.dart';
import '../../profile/controllers/profile_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<OrdersController>(OrdersController());
    Get.put<WalletController>(WalletController());
    Get.put<ProfileController>(ProfileController());
  }
}