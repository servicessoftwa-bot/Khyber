import 'package:get/get.dart';
import '../controllers/crafts_controller.dart';
class CraftsBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut<CraftsController>(() => CraftsController());
}
