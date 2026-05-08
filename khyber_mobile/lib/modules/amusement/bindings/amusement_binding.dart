import 'package:get/get.dart';
import '../controllers/amusement_controller.dart';
class AmusementBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut<AmusementController>(() => AmusementController());
}
