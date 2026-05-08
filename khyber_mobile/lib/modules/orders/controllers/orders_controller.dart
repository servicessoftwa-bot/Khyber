import 'package:get/get.dart';

class AppOrder {
  final String id, module, title, subtitle, status;
  final double amount;
  final DateTime date;
  const AppOrder({
    required this.id, required this.module, required this.title,
    required this.subtitle, required this.status,
    required this.amount, required this.date,
  });
}

class OrdersController extends GetxController {
  final isLoading   = false.obs;
  final selectedTab = 0.obs;

  final orders = <AppOrder>[
    AppOrder(id: 'ORD001', module: 'Food', title: 'Khyber Darbar', subtitle: 'Chapli Kabab x2, Naan x4', status: 'delivered', amount: 1200, date: DateTime.now().subtract(const Duration(days: 1))),
    AppOrder(id: 'ORD002', module: 'Grocery', title: 'Metro Cash & Carry', subtitle: 'Basmati Rice 5kg, Tomatoes 2kg', status: 'delivered', amount: 970, date: DateTime.now().subtract(const Duration(days: 3))),
    AppOrder(id: 'ORD003', module: 'Courier', title: 'TCS Express', subtitle: 'Parcel to Islamabad • 2.5 kg', status: 'in_transit', amount: 375, date: DateTime.now().subtract(const Duration(hours: 5))),
    AppOrder(id: 'ORD004', module: 'Pharmacy', title: 'Al-Shifa Pharmacy', subtitle: 'Panadol x2, Brufen 400mg x1', status: 'pending', amount: 420, date: DateTime.now().subtract(const Duration(hours: 1))),
    AppOrder(id: 'ORD005', module: 'Grocery', title: 'Imtiaz Super Store', subtitle: 'Cooking Oil 5L, Dal Chana 1kg', status: 'cancelled', amount: 2030, date: DateTime.now().subtract(const Duration(days: 7))),
    AppOrder(id: 'ORD006', module: 'Logistics', title: 'M&P Express', subtitle: 'Heavy cargo to Karachi • 15 kg', status: 'delivered', amount: 2700, date: DateTime.now().subtract(const Duration(days: 10))),
    AppOrder(id: 'ORD007', module: 'Food', title: 'Lahori Tastes', subtitle: 'Chicken Karahi, Rice, Raita', status: 'preparing', amount: 890, date: DateTime.now().subtract(const Duration(minutes: 30))),
    AppOrder(id: 'ORD008', module: 'Shopping', title: 'KPK Bazaar', subtitle: 'Peshawari Chappal, Pakol Hat', status: 'delivered', amount: 3200, date: DateTime.now().subtract(const Duration(days: 5))),
  ].obs;

  List<AppOrder> get activeOrders => orders.where((o) => ['pending', 'preparing', 'in_transit'].contains(o.status)).toList();
  List<AppOrder> get pastOrders   => orders.where((o) => ['delivered', 'cancelled'].contains(o.status)).toList();
  List<AppOrder> get tabOrders    => selectedTab.value == 0 ? orders.toList() : selectedTab.value == 1 ? activeOrders : pastOrders;

  void selectTab(int t) => selectedTab.value = t;
}
