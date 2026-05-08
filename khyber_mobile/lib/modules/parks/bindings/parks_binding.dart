import 'package:get/get.dart';
import '../controllers/parks_controller.dart';
class ParksBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut<ParksController>(() => ParksController());
}
