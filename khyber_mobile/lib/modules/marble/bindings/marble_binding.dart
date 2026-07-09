import 'package:get/get.dart';
import '../controllers/marble_controller.dart';
class MarbleBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => MarbleController());
}