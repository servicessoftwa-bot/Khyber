import 'package:get/get.dart';
import '../controllers/agriculture_controller.dart';
class AgricultureBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => AgricultureController());
}