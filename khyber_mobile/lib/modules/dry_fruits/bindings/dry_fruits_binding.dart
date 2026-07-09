import 'package:get/get.dart';
import '../controllers/dry_fruits_controller.dart';
class DryFruitsBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => DryFruitsController());
}