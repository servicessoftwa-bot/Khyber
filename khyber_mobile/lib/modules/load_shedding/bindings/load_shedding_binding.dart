import 'package:get/get.dart';
import '../controllers/load_shedding_controller.dart';

class LoadSheddingBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => LoadSheddingController());
}