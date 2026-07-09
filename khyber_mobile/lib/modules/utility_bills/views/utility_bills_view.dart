import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/utility_bills_controller.dart';

class UtilityBillsView extends GetView<UtilityBillsController> {
  const UtilityBillsView({super.key});
  static const _dark = Color(0xFF2C3E50);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final hPad = w > 1100 ? (w - 1100) / 2 + 16 : 16.0;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: 160, pinned: true, backgroundColor: _dark,
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white), onPressed: () => Get.back()),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: const BoxDecoration(gradient: LinearGradient(colors: [_dark, Color(0xFF1A252F)], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: SafeArea(child: Padding(padding: const EdgeInsets.fromLTRB(20, 32, 20, 16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Utility Bills', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Poppins')),
                const SizedBox(height: 4),
                const Text('Check PESCO, SNGPL, PTCL & WASA bills', style: TextStyle(fontSize: 13, color: Colors.white70, fontFamily: 'Poppins')),
              ]))),
            ),
          ),
          bottom: PreferredSize(preferredSize: const Size.fromHeight(48), child: Container(
            color: _dark,
            child: Obx(() {
              final selected = controller.selectedTab.value;
              return SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(children: List.generate(controller.tabs.length, (i) {
                final isSelected = selected == i;
                return GestureDetector(onTap: () => controller.selectedTab.value = i, child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: isSelected ? Colors.white : Colors.transparent, width: 2))),
                  child: Text(controller.tabs[i], style: TextStyle(fontSize: 13, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal, color: isSelected ? Colors.white : Colors.white54, fontFamily: 'Poppins'))));
              })));
            }),
          )),
        ),
        SliverToBoxAdapter(child: Obx(() {
          final tab = controller.selectedTab.value;
          final slabs = tab == 0 ? controller.pescoSlabs : tab == 1 ? controller.sngplSlabs : <Map<String, String>>[];
          return Padding(padding: EdgeInsets.fromLTRB(hPad, 20, hPad, 0), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Check Your Bill', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.textPrimary, fontFamily: 'Poppins')),
            const SizedBox(height: 12),
            Row(children: [
              Expanded(child: Container(height: 44, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.shade200), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)]),
                child: TextField(
                  onChanged: (v) => controller.refInput.value = v,
                  style: const TextStyle(fontSize: 14, color: AppColors.textPrimary),
                  decoration: InputDecoration(hintText: 'Enter reference / account number', hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13), prefixIcon: const Icon(Icons.numbers_rounded, size: 20, color: AppColors.textSecondary), border: InputBorder.none, contentPadding: const EdgeInsets.symmetric(vertical: 13))))),
              const SizedBox(width: 10),
              Obx(() => ElevatedButton(
                onPressed: controller.isSearching.value ? null : controller.searchBill,
                style: ElevatedButton.styleFrom(backgroundColor: _dark, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                child: controller.isSearching.value ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)) : const Text('Check', style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold)))),
            ]),
            Obx(() { final result = controller.billResult.value;
              if (result == null) return const SizedBox.shrink();
              return Padding(padding: const EdgeInsets.only(top: 16), child: Container(
                decoration: BoxDecoration(color: _dark, borderRadius: BorderRadius.circular(14)),
                child: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [const Icon(Icons.receipt_long_rounded, color: Colors.white70, size: 18), const SizedBox(width: 8), Expanded(child: Text(result.consumerName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white, fontFamily: 'Poppins')))]),
                  const SizedBox(height: 4),
                  Text('Ref: ${result.accountNumber} • ${result.billMonth}', style: const TextStyle(fontSize: 12, color: Colors.white60, fontFamily: 'Poppins')),
                  const Divider(color: Colors.white24, height: 20),
                  Row(children: [
                    Expanded(child: _BillStat('Due Date', result.dueDate, Colors.orange)),
                    Expanded(child: _BillStat('Status', result.status, result.status == 'Unpaid' ? Colors.red.shade300 : Colors.greenAccent)),
                    Expanded(child: _BillStat('Amount', result.amount, Colors.greenAccent)),
                  ]),
                ]))));
            }),
            if (slabs.isNotEmpty) ...[
              const SizedBox(height: 20),
              const Text('Rate Slabs', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.textPrimary, fontFamily: 'Poppins')),
              const SizedBox(height: 10),
              ...slabs.map((s) => Container(margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 6)]),
                child: Padding(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10), child: Row(children: [
                  Expanded(child: Text(s['units'] ?? '', style: const TextStyle(fontSize: 13, color: AppColors.textPrimary, fontFamily: 'Poppins', fontWeight: FontWeight.w500))),
                  Text(s['rate'] ?? '', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: _dark, fontFamily: 'Poppins')),
                ])))),
            ],
            const SizedBox(height: 24),
          ]));
        })),
      ]),
    );
  }
}

class _BillStat extends StatelessWidget {
  final String label, value; final Color color;
  const _BillStat(this.label, this.value, this.color);
  @override
  Widget build(BuildContext context) => Column(children: [
    Text(label, style: const TextStyle(fontSize: 10, color: Colors.white60, fontFamily: 'Poppins')),
    const SizedBox(height: 2),
    Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: color, fontFamily: 'Poppins'), textAlign: TextAlign.center)]);
}