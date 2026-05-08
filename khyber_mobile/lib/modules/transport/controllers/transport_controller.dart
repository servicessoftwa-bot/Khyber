import 'package:get/get.dart';

class VehicleType {
  final String id, name, emoji;
  final double baseFare, perKm;
  const VehicleType({required this.id, required this.name, required this.emoji, required this.baseFare, required this.perKm});
}

class Driver {
  final String name, vehicleNumber, vehicleType;
  final double rating;
  final int etaMinutes;
  const Driver({required this.name, required this.vehicleNumber, required this.vehicleType, required this.rating, required this.etaMinutes});
}

class TransportController extends GetxController {
  final selectedType   = 'rickshaw'.obs;
  final isBooked       = false.obs;
  final isLoading      = false.obs;
  final pickup         = ''.obs;
  final dropoff        = ''.obs;
  final estimatedFare  = 0.0.obs;
  final assignedDriver = Rxn<Driver>();

  final vehicleTypes = const <VehicleType>[
    VehicleType(id: 'rickshaw', name: 'Rickshaw',  emoji: '\u{1F6FA}', baseFare: 80,  perKm: 25),
    VehicleType(id: 'taxi',     name: 'Taxi',       emoji: '\u{1F695}', baseFare: 150, perKm: 45),
    VehicleType(id: 'chinchi',  name: 'Chinchi',    emoji: '\u{1F690}', baseFare: 50,  perKm: 15),
    VehicleType(id: 'van',      name: 'Van',        emoji: '\u{1F68C}', baseFare: 200, perKm: 55),
    VehicleType(id: 'bike',     name: 'Bike',       emoji: '\u{1F3CD}', baseFare: 60,  perKm: 18),
  ];

  final nearbyDrivers = const <Driver>[
    Driver(name: 'Asad Khan',    vehicleNumber: 'KPK-1234', vehicleType: 'Rickshaw', rating: 4.8, etaMinutes: 3),
    Driver(name: 'Naveed Ahmed', vehicleNumber: 'KPK-5678', vehicleType: 'Taxi',     rating: 4.9, etaMinutes: 5),
    Driver(name: 'Imran Gul',    vehicleNumber: 'KPK-9012', vehicleType: 'Bike',     rating: 4.6, etaMinutes: 2),
    Driver(name: 'Fawad Zaman',  vehicleNumber: 'KPK-3456', vehicleType: 'Van',      rating: 4.7, etaMinutes: 7),
  ];

  void selectType(String id) {
    selectedType.value = id;
    _calcFare();
  }

  void _calcFare() {
    final type = vehicleTypes.firstWhereOrNull((v) => v.id == selectedType.value);
    if (type != null) {
      estimatedFare.value = type.baseFare + (type.perKm * 4.5);
    }
  }

  Future<void> bookRide() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    assignedDriver.value = nearbyDrivers.first;
    isLoading.value = false;
    isBooked.value = true;
  }

  void cancelRide() {
    isBooked.value = false;
    assignedDriver.value = null;
  }

  @override
  void onInit() {
    super.onInit();
    _calcFare();
  }
}
