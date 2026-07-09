import 'package:get/get.dart';
import '../controllers/brt_controller.dart';
class BrtBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => BrtController());
}