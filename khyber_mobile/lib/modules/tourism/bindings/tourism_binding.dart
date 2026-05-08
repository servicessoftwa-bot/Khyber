import 'package:get/get.dart';
import '../controllers/tourism_controller.dart';
class TourismBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut<TourismController>(() => TourismController());
}
