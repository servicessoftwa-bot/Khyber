import 'package:get/get.dart';
import '../controllers/flood_alerts_controller.dart';
class FloodAlertsBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => FloodAlertsController());
}