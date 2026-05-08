import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/amusement_controller.dart';

class AmusementView extends GetView<AmusementController> {
  const AmusementView({super.key});

  static const _venues = [
    {'name': 'Peshawar Funland', 'area': 'Ring Road, Peshawar', 'type': 'Theme Park', 'timing': '4 PM – 11 PM', 'price': 'PKR 200/entry', 'color': 0xFFE74C3C},
    {'name': 'KPK Cineplex', 'area': 'University Road, Peshawar', 'type': 'Cinema', 'timing': 'Multiple shows daily', 'price': 'PKR 400/ticket', 'color': 0xFF8E44AD},
    {'name': 'Swat Chairlift', 'area': 'Mingora, Swat', 'type': 'Adventure', 'timing': '9 AM – 6 PM', 'price': 'PKR 150/ride', 'color': 0xFF1A6B72},
    {'name': 'Bowling Alley Peshawar', 'area': 'Hayatabad Phase 4', 'type': 'Sports', 'timing': '2 PM – 12 AM', 'price': 'PKR 500/game', 'color': 0xFF2980B9},
    {'name': 'Nathia Gali Zip Line', 'area': 'Nathia Gali, Abbottabad', 'type': 'Adventure', 'timing': '10 AM – 5 PM', 'price': 'PKR 800/ride', 'color': 0xFFD35400},
    {'name': 'Virtual Reality Zone KPK', 'area': 'Saddar, Peshawar', 'type': 'Gaming', 'timing': '12 PM – 11 PM', 'price': 'PKR 300/30 min', 'color': 0xFF27AE60},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: 160, pinned: true,
          backgroundColor: const Color(0xFF8E44AD),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
            onPressed: () => Get.back()),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF6C3483), Color(0xFF8E44AD)],
                  begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: SafeArea(child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const SizedBox(height: 8),
                  Text('Amusement & Fun', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('Entertainment venues across KPK', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70)),
                ]),
              )),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(delegate: SliverChildListDelegate([
            const Text('Entertainment Venues', style: TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
            const SizedBox(height: 12),
            ..._venues.map((v) {
              final color = Color(v['color'] as int);
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.surface, borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.border),
                  boxShadow: [BoxShadow(color: color.withOpacity(0.07), blurRadius: 8)]),
                child: Row(children: [
                  Container(
                    width: 50, height: 50,
                    decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(14)),
                    child: Icon(Icons.local_activity_rounded, color: color, size: 26)),
                  const SizedBox(width: 12),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(v['name'] as String, style: const TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                    const SizedBox(height: 2),
                    Row(children: [
                      const Icon(Icons.location_on_rounded, size: 11, color: AppColors.textHint),
                      const SizedBox(width: 2),
                      Text(v['area'] as String, style: const TextStyle(fontFamily: 'Poppins', fontSize: 11, color: AppColors.textSecondary)),
                    ]),
                    const SizedBox(height: 4),
                    Row(children: [
                      const Icon(Icons.access_time_rounded, size: 11, color: AppColors.textHint),
                      const SizedBox(width: 3),
                      Text(v['timing'] as String, style: const TextStyle(fontFamily: 'Poppins', fontSize: 11, color: AppColors.textSecondary)),
                    ]),
                    const SizedBox(height: 4),
                    Row(children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                        decoration: BoxDecoration(color: color.withOpacity(0.08), borderRadius: BorderRadius.circular(6)),
                        child: Text(v['type'] as String, style: TextStyle(fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w600, color: color))),
                      const SizedBox(width: 8),
                      Text(v['price'] as String, style: TextStyle(fontFamily: 'Poppins', fontSize: 11, fontWeight: FontWeight.bold, color: color)),
                    ]),
                  ])),
                ]),
              );
            }),
            const SizedBox(height: 24),
          ])),
        ),
      ]),
    );
  }
}
