import 'package:get/get.dart';

class AppNotification {
  final String id, title, body, type;
  final DateTime time;
  bool isRead;
  AppNotification({
    required this.id, required this.title, required this.body,
    required this.type, required this.time, this.isRead = false,
  });
}

class NotificationsController extends GetxController {
  final isLoading = false.obs;

  final notifications = <AppNotification>[
    AppNotification(id: 'n1', title: 'Order Delivered!', body: 'Your food order from Khyber Darbar has been delivered. Enjoy your meal!', type: 'order', time: DateTime.now().subtract(const Duration(minutes: 15))),
    AppNotification(id: 'n2', title: 'Courier Update', body: 'Your TCS shipment KPK483921 is out for delivery. Expected by 5 PM.', type: 'courier', time: DateTime.now().subtract(const Duration(hours: 2))),
    AppNotification(id: 'n3', title: 'Cashback Earned!', body: 'You earned PKR 60 cashback on your last grocery order.', type: 'wallet', time: DateTime.now().subtract(const Duration(hours: 5))),
    AppNotification(id: 'n4', title: 'New Jobs in Peshawar', body: '12 new job listings in Software & IT have been posted. Apply now!', type: 'jobs', time: DateTime.now().subtract(const Duration(days: 1)), isRead: true),
    AppNotification(id: 'n5', title: 'Nurse Booking Confirmed', body: 'Nurse Fatima Bibi is confirmed for your home nursing appointment tomorrow at 10 AM.', type: 'nursing', time: DateTime.now().subtract(const Duration(days: 1)), isRead: true),
    AppNotification(id: 'n6', title: 'Shandur Polo Festival', body: 'Shandur Polo Festival starts in 3 days! Book your accommodation in Chitral now.', type: 'event', time: DateTime.now().subtract(const Duration(days: 2)), isRead: true),
    AppNotification(id: 'n7', title: 'Order Cancelled', body: 'Your grocery order ORD005 from Imtiaz Super Store was cancelled. Refund in 2-3 days.', type: 'order', time: DateTime.now().subtract(const Duration(days: 3)), isRead: true),
    AppNotification(id: 'n8', title: 'Welcome to Khyber App!', body: 'Discover the best of KPK — food, jobs, tourism, and more. All in one place.', type: 'system', time: DateTime.now().subtract(const Duration(days: 7)), isRead: true),
  ].obs;

  int get unreadCount => notifications.where((n) => !n.isRead).length;

  void markRead(String id) {
    final n = notifications.firstWhereOrNull((n) => n.id == id);
    if (n != null) { n.isRead = true; notifications.refresh(); }
  }

  void markAllRead() {
    for (final n in notifications) { n.isRead = true; }
    notifications.refresh();
  }

  void delete(String id) => notifications.removeWhere((n) => n.id == id);
}
