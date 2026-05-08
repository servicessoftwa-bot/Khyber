import 'package:get/get.dart';

class WalletTransaction {
  final String id, title, subtitle, type;
  final double amount;
  final DateTime date;
  const WalletTransaction({
    required this.id, required this.title, required this.subtitle,
    required this.type, required this.amount, required this.date,
  });
}

class WalletController extends GetxController {
  final balance      = 2450.0.obs;
  final isLoading    = false.obs;
  final isAddingFunds = false.obs;

  final transactions = <WalletTransaction>[
    WalletTransaction(id: 't1', title: 'Food Order — Khyber Darbar', subtitle: 'Chapli Kabab + Naan', type: 'debit', amount: 1200, date: DateTime.now().subtract(const Duration(days: 1))),
    WalletTransaction(id: 't2', title: 'Top Up via EasyPaisa', subtitle: 'Wallet recharge', type: 'credit', amount: 5000, date: DateTime.now().subtract(const Duration(days: 2))),
    WalletTransaction(id: 't3', title: 'Grocery — Metro C&C', subtitle: 'Rice, Tomatoes, Flour', type: 'debit', amount: 970, date: DateTime.now().subtract(const Duration(days: 3))),
    WalletTransaction(id: 't4', title: 'Courier — TCS Express', subtitle: 'Parcel to Islamabad', type: 'debit', amount: 375, date: DateTime.now().subtract(const Duration(days: 4))),
    WalletTransaction(id: 't5', title: 'Cashback Reward', subtitle: '5% cashback on food order', type: 'credit', amount: 60, date: DateTime.now().subtract(const Duration(days: 5))),
    WalletTransaction(id: 't6', title: 'Shopping — KPK Bazaar', subtitle: 'Peshawari Chappal', type: 'debit', amount: 2200, date: DateTime.now().subtract(const Duration(days: 6))),
    WalletTransaction(id: 't7', title: 'Top Up via JazzCash', subtitle: 'Wallet recharge', type: 'credit', amount: 3000, date: DateTime.now().subtract(const Duration(days: 8))),
    WalletTransaction(id: 't8', title: 'Pharmacy — Al-Shifa', subtitle: 'Medicines', type: 'debit', amount: 420, date: DateTime.now().subtract(const Duration(days: 9))),
  ].obs;

  List<WalletTransaction> get credits => transactions.where((t) => t.type == 'credit').toList();
  List<WalletTransaction> get debits  => transactions.where((t) => t.type == 'debit').toList();

  double get totalSpent => debits.fold(0, (sum, t) => sum + t.amount);
  double get totalAdded => credits.fold(0, (sum, t) => sum + t.amount);

  Future<void> addFunds(double amount) async {
    isAddingFunds.value = true;
    await Future.delayed(const Duration(seconds: 1));
    balance.value += amount;
    transactions.insert(0, WalletTransaction(
      id: 't${DateTime.now().millisecondsSinceEpoch}',
      title: 'Top Up',
      subtitle: 'Manual top up',
      type: 'credit',
      amount: amount,
      date: DateTime.now(),
    ));
    isAddingFunds.value = false;
  }
}
