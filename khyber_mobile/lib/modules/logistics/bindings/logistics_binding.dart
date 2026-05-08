import 'package:get/get.dart';
import '../controllers/logistics_controller.dart';
class LogisticsBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut<LogisticsController>(() => LogisticsController());
}
