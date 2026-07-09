import 'package:get/get.dart';
import '../controllers/gandhara_controller.dart';
class GandharaBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => GandharaController());
}