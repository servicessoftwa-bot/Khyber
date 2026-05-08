import 'package:get/get.dart';
import '../controllers/businesses_controller.dart';
class BusinessesBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut<BusinessesController>(() => BusinessesController());
}
