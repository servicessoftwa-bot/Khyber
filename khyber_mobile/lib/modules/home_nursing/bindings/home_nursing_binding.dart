import 'package:get/get.dart';
import '../controllers/home_nursing_controller.dart';
class HomeNursingBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut<HomeNursingController>(() => HomeNursingController());
}
