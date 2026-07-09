import 'package:get/get.dart';

class UtilityBillInfo {
  final String type, accountNumber, consumerName, dueDate, amount, status, billMonth;
  const UtilityBillInfo({required this.type, required this.accountNumber, required this.consumerName, required this.dueDate, required this.amount, required this.status, required this.billMonth});
}

class UtilityBillsController extends GetxController {
  final selectedTab = 0.obs;
  final refInput = ''.obs;
  final isSearching = false.obs;
  final billResult = Rxn<UtilityBillInfo>();

  final tabs = ['PESCO (Electricity)', 'SNGPL (Gas)', 'PTCL', 'WASA (Water)'];

  // Mock PESCO rates
  final pescoSlabs = [
    {'units': '0–50',   'rate': 'PKR 4.85/unit'},
    {'units': '51–100', 'rate': 'PKR 9.45/unit'},
    {'units': '101–200','rate': 'PKR 14.70/unit'},
    {'units': '201–300','rate': 'PKR 20.15/unit'},
    {'units': '301–700','rate': 'PKR 25.05/unit'},
    {'units': '700+',   'rate': 'PKR 30.50/unit'},
  ];

  // Mock SNGPL rates
  final sngplSlabs = [
    {'units': '0–25 HM3',  'rate': 'PKR 400/month'},
    {'units': '26–35 HM3', 'rate': 'PKR 1,100/month'},
    {'units': '36–60 HM3', 'rate': 'PKR 1,860/month'},
    {'units': '60+ HM3',   'rate': 'PKR 2,900/month'},
  ];

  Future<void> searchBill() async {
    if (refInput.value.trim().isEmpty) return;
    isSearching.value = true;
    billResult.value = null;
    await Future.delayed(const Duration(seconds: 1));
    billResult.value = UtilityBillInfo(
      type: tabs[selectedTab.value],
      accountNumber: refInput.value.trim(),
      consumerName: 'Muhammad Arif Khan',
      dueDate: '20 Jun 2026',
      amount: 'PKR ${(2000 + (refInput.value.length * 300)).toInt()}',
      status: 'Unpaid',
      billMonth: 'May 2026',
    );
    isSearching.value = false;
  }

  void clearResult() { billResult.value = null; refInput.value = ''; }
}