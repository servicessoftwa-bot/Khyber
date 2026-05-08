import 'package:get/get.dart';
import '../controllers/govt_controller.dart';
class GovtBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut<GovtController>(() => GovtController());
}
