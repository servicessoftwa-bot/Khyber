import 'package:get/get.dart';
import '../controllers/real_estate_controller.dart';
class RealEstateBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut<RealEstateController>(() => RealEstateController());
}
