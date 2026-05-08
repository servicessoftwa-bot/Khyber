import 'package:get/get.dart';

class CourierService {
  final String id, name, deliveryTime, coverage, icon;
  final double pricePerKg;
  final List<String> features;
  const CourierService({required this.id, required this.name, required this.deliveryTime, required this.coverage, required this.icon, required this.pricePerKg, required this.features});
}

class CourierController extends GetxController {
  final selectedService = Rxn<CourierService>();
  final senderName = ''.obs;
  final receiverName = ''.obs;
  final senderAddress = ''.obs;
  final receiverAddress = ''.obs;
  final weight = 1.0.obs;
  final isLoading = false.obs;
  final isBooked = false.obs;
  final trackingNumber = ''.obs;

  final services = <CourierService>[
    CourierService(id: 'c1', name: 'TCS Courier', deliveryTime: 'Same Day / Next Day', coverage: 'All KPK Districts', icon: 'local_shipping', pricePerKg: 150, features: ['Tracking', 'Insurance', 'Door to Door']),
    CourierService(id: 'c2', name: 'Leopards Courier', deliveryTime: '1-2 Days', coverage: 'All KPK Districts', icon: 'delivery_dining', pricePerKg: 120, features: ['Tracking', 'Cash on Delivery', 'Fragile Handling']),
    CourierService(id: 'c3', name: 'M&P Courier', deliveryTime: 'Same Day', coverage: 'Peshawar & Major Cities', icon: 'speed', pricePerKg: 180, features: ['Express Delivery', 'Real-time Tracking', 'SMS Alert']),
    CourierService(id: 'c4', name: 'Pakistan Post', deliveryTime: '3-5 Days', coverage: 'All Pakistan', icon: 'markunread_mailbox', pricePerKg: 80, features: ['Registered Mail', 'EMS', 'Money Order']),
  ].obs;

  double get estimatedCost => (selectedService.value?.pricePerKg ?? 0) * weight.value;

  Future<void> bookCourier() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    trackingNumber.value = 'KPK${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}';
    isLoading.value = false;
    isBooked.value = true;
  }

  void reset() { isBooked.value = false; selectedService.value = null; trackingNumber.value = ''; }
}
