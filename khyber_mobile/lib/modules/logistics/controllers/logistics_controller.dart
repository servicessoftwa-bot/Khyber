import 'package:get/get.dart';

class FreightService {
  final String id, name, logo, coverage, deliveryTime;
  final double pricePerKg, minWeight;
  final List<String> features;
  final int colorValue;
  const FreightService({
    required this.id, required this.name, required this.logo,
    required this.coverage, required this.deliveryTime,
    required this.pricePerKg, required this.minWeight,
    required this.features, required this.colorValue,
  });
}

class ShipmentType {
  final String id, name, icon, description;
  final double multiplier;
  const ShipmentType({
    required this.id, required this.name, required this.icon,
    required this.description, required this.multiplier,
  });
}

class LogisticsController extends GetxController {
  final isLoading   = false.obs;
  final isBooked    = false.obs;
  final isBooking   = false.obs;
  final trackingNum = ''.obs;

  final selectedService = Rxn<FreightService>();
  final selectedType    = Rxn<ShipmentType>();
  final weight          = 1.0.obs;
  final estimatedCost   = 0.0.obs;

  final senderName      = ''.obs;
  final senderPhone     = ''.obs;
  final senderAddress   = ''.obs;
  final receiverName    = ''.obs;
  final receiverPhone   = ''.obs;
  final receiverCity    = ''.obs;
  final receiverAddress = ''.obs;
  final description     = ''.obs;

  final services = <FreightService>[
    FreightService(
      id: 's1', name: 'TCS Express', logo: 'local_shipping',
      coverage: 'KPK + Nationwide', deliveryTime: '1-2 days',
      pricePerKg: 150, minWeight: 0.5,
      features: ['Door-to-door', 'Real-time tracking', 'Insurance', 'SMS alerts'],
      colorValue: 0xFFE74C3C,
    ),
    FreightService(
      id: 's2', name: 'Leopards Courier', logo: 'speed',
      coverage: 'KPK + All Pakistan', deliveryTime: '2-3 days',
      pricePerKg: 120, minWeight: 0.5,
      features: ['Express delivery', 'Online tracking', 'Fragile handling', 'Proof of delivery'],
      colorValue: 0xFFD35400,
    ),
    FreightService(
      id: 's3', name: 'M&P Express', logo: 'inventory_2',
      coverage: 'KPK Districts', deliveryTime: '1-3 days',
      pricePerKg: 180, minWeight: 1.0,
      features: ['Heavy cargo', 'Warehouse storage', 'Bulk discounts', 'Priority handling'],
      colorValue: 0xFF8E44AD,
    ),
    FreightService(
      id: 's4', name: 'Pakistan Post', logo: 'mail',
      coverage: 'Nationwide', deliveryTime: '3-5 days',
      pricePerKg: 80, minWeight: 0.1,
      features: ['Most affordable', 'COD available', 'EMS option', 'Rural coverage'],
      colorValue: 0xFF27AE60,
    ),
    FreightService(
      id: 's5', name: 'DHL KPK', logo: 'flight_takeoff',
      coverage: 'International + KPK', deliveryTime: '2-4 days',
      pricePerKg: 350, minWeight: 0.5,
      features: ['International shipping', 'Customs clearance', 'Premium insurance', '24/7 support'],
      colorValue: 0xFFD4A017,
    ),
  ].obs;

  final shipmentTypes = <ShipmentType>[
    ShipmentType(id: 't1', name: 'Documents', icon: 'description', description: 'Letters, papers, certificates', multiplier: 1.0),
    ShipmentType(id: 't2', name: 'Parcel', icon: 'inventory_2', description: 'Boxes, gifts, products', multiplier: 1.2),
    ShipmentType(id: 't3', name: 'Fragile', icon: 'broken_image', description: 'Glass, electronics, breakables', multiplier: 1.5),
    ShipmentType(id: 't4', name: 'Heavy Cargo', icon: 'scale', description: 'Machinery, bulk goods', multiplier: 0.9),
    ShipmentType(id: 't5', name: 'Food Items', icon: 'restaurant', description: 'Dry foods, packaged items', multiplier: 1.1),
  ].obs;

  void selectService(FreightService s) {
    selectedService.value = s;
    _recalculate();
  }

  void selectType(ShipmentType t) {
    selectedType.value = t;
    _recalculate();
  }

  void incrementWeight() {
    weight.value = weight.value + 0.5;
    _recalculate();
  }

  void decrementWeight() {
    if (weight.value > 0.5) {
      weight.value = weight.value - 0.5;
      _recalculate();
    }
  }

  void _recalculate() {
    final svc = selectedService.value;
    final typ = selectedType.value;
    if (svc == null) { estimatedCost.value = 0; return; }
    final multiplier = typ?.multiplier ?? 1.0;
    estimatedCost.value = svc.pricePerKg * weight.value * multiplier;
  }

  Future<void> bookShipment() async {
    isBooking.value = true;
    await Future.delayed(const Duration(seconds: 1));
    final ts = DateTime.now().millisecondsSinceEpoch.toString();
    trackingNum.value = 'KPK${ts.substring(ts.length - 6)}';
    isBooking.value = false;
    isBooked.value = true;
  }

  void reset() {
    isBooked.value = false;
    trackingNum.value = '';
    selectedService.value = null;
    selectedType.value = null;
    weight.value = 1.0;
    estimatedCost.value = 0;
    senderName.value = '';
    senderPhone.value = '';
    senderAddress.value = '';
    receiverName.value = '';
    receiverPhone.value = '';
    receiverCity.value = '';
    receiverAddress.value = '';
    description.value = '';
  }
}
