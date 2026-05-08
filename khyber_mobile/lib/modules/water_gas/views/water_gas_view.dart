import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/water_gas_controller.dart';

class WaterGasView extends GetView<WaterGasController> {
  const WaterGasView({super.key});

  static const _services = [
    {'icon': Icons.water_drop_rounded, 'title': 'Water Bill Payment', 'subtitle': 'Pay WSSP & PESCO bills online', 'color': 0xFF2980B9},
    {'icon': Icons.local_fire_department_rounded, 'title': 'Gas Bill Payment', 'subtitle': 'SNGPL & SSGC bill payments', 'color': 0xFFE74C3C},
    {'icon': Icons.report_problem_rounded, 'title': 'Report Water Issue', 'subtitle': 'Leakage, shortage, quality complaint', 'color': 0xFFD4A017},
    {'icon': Icons.bolt_rounded, 'title': 'New Connection', 'subtitle': 'Apply for water or gas connection', 'color': 0xFF27AE60},
    {'icon': Icons.history_rounded, 'title': 'Payment History', 'subtitle': 'View past utility payments', 'color': 0xFF8E44AD},
    {'icon': Icons.contact_phone_rounded, 'title': 'Emergency Helpline', 'subtitle': 'Gas leak: 1199 | Water: 1234', 'color': 0xFFE74C3C},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: 160, pinned: true,
          backgroundColor: const Color(0xFF2980B9),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
            onPressed: () => Get.back()),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF2980B9), Color(0xFF1A5276)],
                  begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: SafeArea(child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const SizedBox(height: 8),
                  Text('Water & Gas', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('Utility services for KPK residents', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70)),
                ]),
              )),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(delegate: SliverChildListDelegate([
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFD4A017).withOpacity(0.08),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFD4A017).withOpacity(0.3))),
              child: const Row(children: [
                Icon(Icons.construction_rounded, color: Color(0xFFD4A017), size: 18),
                SizedBox(width: 10),
                Expanded(child: Text('Online payments launching soon. In-person payment at utility offices available.',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 12, color: Color(0xFFD4A017), fontWeight: FontWeight.w500))),
              ]),
            ),
            const SizedBox(height: 16),
            const Text('Available Services', style: TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
            const SizedBox(height: 10),
            GridView.count(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10,
              childAspectRatio: 1.4, shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: _services.map((s) {
                final color = Color(s['color'] as int);
                return Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppColors.surface, borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: color.withOpacity(0.15)),
                    boxShadow: [BoxShadow(color: color.withOpacity(0.06), blurRadius: 8)]),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Container(
                      width: 38, height: 38,
                      decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
                      child: Icon(s['icon'] as IconData, color: color, size: 20)),
                    const SizedBox(height: 8),
                    Text(s['title'] as String, style: TextStyle(fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w700, color: color)),
                    const SizedBox(height: 2),
                    Text(s['subtitle'] as String, style: const TextStyle(fontFamily: 'Poppins', fontSize: 10, color: AppColors.textSecondary), maxLines: 2),
                  ]),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
          ])),
        ),
      ]),
    );
  }
}
