import 'package:get/get.dart';
import '../controllers/utility_bills_controller.dart';
class UtilityBillsBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => UtilityBillsController());
}