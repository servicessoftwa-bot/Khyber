import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/govt_controller.dart';

class GovtView extends GetView<GovtController> {
  const GovtView({super.key});

  static const _services = [
    {'icon': Icons.badge_rounded, 'title': 'NADRA / CNIC', 'subtitle': 'ID card renewal & verification', 'color': 0xFF1A6B72},
    {'icon': Icons.directions_car_rounded, 'title': 'Driving License', 'subtitle': 'Apply, renew, or duplicate', 'color': 0xFF2980B9},
    {'icon': Icons.home_work_rounded, 'title': 'Property Records', 'subtitle': 'Land registration & Fard', 'color': 0xFF8E44AD},
    {'icon': Icons.school_rounded, 'title': 'Education Dept', 'subtitle': 'KPK BISE results & certificates', 'color': 0xFF27AE60},
    {'icon': Icons.local_hospital_rounded, 'title': 'Health Department', 'subtitle': 'Health facilities & programs', 'color': 0xFFE74C3C},
    {'icon': Icons.gavel_rounded, 'title': 'Court Services', 'subtitle': 'Peshawar High Court services', 'color': 0xFFD4A017},
    {'icon': Icons.business_center_rounded, 'title': 'Business License', 'subtitle': 'SMEDA & trade registration', 'color': 0xFFD35400},
    {'icon': Icons.agriculture_rounded, 'title': 'Agriculture Dept', 'subtitle': 'Farming support & subsidies', 'color': 0xFF27AE60},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: 160, pinned: true,
          backgroundColor: const Color(0xFF1A6B72),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
            onPressed: () => Get.back()),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0D3B42), Color(0xFF1A6B72)],
                  begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: SafeArea(child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const SizedBox(height: 8),
                  Text('Govt Services', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('KPK Government services portal', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70)),
                ]),
              )),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(delegate: SliverChildListDelegate([
            const Text('Government Services', style: TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
            const SizedBox(height: 10),
            GridView.count(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10,
              childAspectRatio: 1.4, shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: _services.map((s) {
                final color = Color(s['color'] as int);
                return GestureDetector(
                  onTap: () {},
                  child: Container(
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
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFF1A6B72).withOpacity(0.07),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF1A6B72).withOpacity(0.2))),
              child: const Row(children: [
                Icon(Icons.info_outline_rounded, color: Color(0xFF1A6B72), size: 18),
                SizedBox(width: 10),
                Expanded(child: Text('Direct links to KPK government portals. Full integration coming in v2.0.',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 12, color: Color(0xFF1A6B72)))),
              ]),
            ),
            const SizedBox(height: 24),
          ])),
        ),
      ]),
    );
  }
}
