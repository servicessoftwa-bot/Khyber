import 'package:get/get.dart';

class AdminStat {
  final String label, value, change;
  final int colorValue;
  final bool isUp;
  const AdminStat({required this.label, required this.value, required this.change, required this.colorValue, required this.isUp});
}

class AdminActivity {
  final String title, subtitle, type;
  final DateTime time;
  const AdminActivity({required this.title, required this.subtitle, required this.type, required this.time});
}

class AdminController extends GetxController {
  final isLoading = false.obs;
  final selectedTab = 0.obs;

  final stats = <AdminStat>[
    AdminStat(label: 'Total Users', value: '4,821', change: '+12%', colorValue: 0xFF1A6B72, isUp: true),
    AdminStat(label: 'Orders Today', value: '186', change: '+8%', colorValue: 0xFF1A4D2E, isUp: true),
    AdminStat(label: 'Revenue', value: 'PKR 92K', change: '+15%', colorValue: 0xFF27AE60, isUp: true),
    AdminStat(label: 'Active Vendors', value: '243', change: '-2%', colorValue: 0xFF8E44AD, isUp: false),
  ];

  final recentActivity = <AdminActivity>[
    AdminActivity(title: 'New user registered', subtitle: 'Ahmad Khan — Peshawar', type: 'user', time: DateTime.now().subtract(const Duration(minutes: 5))),
    AdminActivity(title: 'Food order placed', subtitle: 'ORD#2841 — Khyber Darbar', type: 'order', time: DateTime.now().subtract(const Duration(minutes: 12))),
    AdminActivity(title: 'Vendor approved', subtitle: 'Green Valley Mart — Hayatabad', type: 'vendor', time: DateTime.now().subtract(const Duration(minutes: 30))),
    AdminActivity(title: 'Courier booked', subtitle: 'TCS Express — 2.5 kg to Karachi', type: 'courier', time: DateTime.now().subtract(const Duration(hours: 1))),
    AdminActivity(title: 'New business listed', subtitle: 'Frontier Sweets — Food & Dining', type: 'business', time: DateTime.now().subtract(const Duration(hours: 2))),
    AdminActivity(title: 'Job posting added', subtitle: 'Flutter Developer — Tech Peshawar', type: 'job', time: DateTime.now().subtract(const Duration(hours: 3))),
  ].obs;

  void selectTab(int t) => selectedTab.value = t;
}
