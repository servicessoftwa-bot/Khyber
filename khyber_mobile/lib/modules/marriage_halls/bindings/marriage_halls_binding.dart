import 'package:get/get.dart';
import '../controllers/marriage_halls_controller.dart';
class MarriageHallsBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => MarriageHallsController());
}