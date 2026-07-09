import 'package:get/get.dart';
import '../controllers/gemstones_controller.dart';
class GemstonesBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => GemstonesController());
}