import 'package:get/get.dart';
import '../controllers/water_gas_controller.dart';
class WaterGasBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut<WaterGasController>(() => WaterGasController());
}
