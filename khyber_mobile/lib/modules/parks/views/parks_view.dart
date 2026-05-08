import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/parks_controller.dart';

class ParksView extends GetView<ParksController> {
  const ParksView({super.key});

  static const _parks = [
    {'name': 'Shahi Bagh', 'area': 'Saddar, Peshawar', 'type': 'Historic', 'highlights': ['Mughal-era garden', 'Rose garden', 'Walking tracks'], 'color': 0xFF27AE60},
    {'name': 'Hayatabad Sports Complex', 'area': 'Hayatabad, Peshawar', 'type': 'Sports', 'highlights': ['Olympic pool', 'Cricket ground', 'Football pitch'], 'color': 0xFF2980B9},
    {'name': 'Swat River Promenade', 'area': 'Mingora, Swat', 'type': 'Nature', 'highlights': ['Riverside walk', 'Picnic spots', 'Food stalls'], 'color': 0xFF1A6B72},
    {'name': 'Nathia Gali Meadows', 'area': 'Nathia Gali, Abbottabad', 'type': 'Nature', 'highlights': ['Alpine meadows', 'Pine forests', 'Paragliding'], 'color': 0xFF27AE60},
    {'name': 'Peshawar Zoo', 'area': 'Bacha Khan Chowk, Peshawar', 'type': 'Wildlife', 'highlights': ['200+ species', 'Kids section', 'Safari area'], 'color': 0xFFD35400},
    {'name': 'Iqbal Park Abbottabad', 'area': 'Abbottabad City', 'type': 'Urban', 'highlights': ['Jogging track', 'Fountain', 'Family area'], 'color': 0xFF8E44AD},
  ];

  Color _typeColor(String type) {
    switch (type) {
      case 'Historic': return const Color(0xFFD4A017);
      case 'Sports': return const Color(0xFF2980B9);
      case 'Nature': return const Color(0xFF27AE60);
      case 'Wildlife': return const Color(0xFFD35400);
      case 'Urban': return const Color(0xFF8E44AD);
      default: return AppColors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: 160, pinned: true,
          backgroundColor: const Color(0xFF27AE60),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
            onPressed: () => Get.back()),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1E8449), Color(0xFF27AE60)],
                  begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: SafeArea(child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const SizedBox(height: 8),
                  Text('Parks & Recreation', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('Green spaces across KPK', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70)),
                ]),
              )),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(delegate: SliverChildListDelegate([
            const Text('Parks & Recreational Spots', style: TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
            const SizedBox(height: 12),
            ..._parks.map((p) {
              final color = Color(p['color'] as int);
              final typeColor = _typeColor(p['type'] as String);
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.surface, borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.border),
                  boxShadow: [BoxShadow(color: color.withOpacity(0.06), blurRadius: 8)]),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    Container(
                      width: 44, height: 44,
                      decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                      child: Icon(Icons.park_rounded, color: color, size: 24)),
                    const SizedBox(width: 12),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(p['name'] as String, style: const TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                      Row(children: [
                        const Icon(Icons.location_on_rounded, size: 11, color: AppColors.textHint),
                        const SizedBox(width: 2),
                        Text(p['area'] as String, style: const TextStyle(fontFamily: 'Poppins', fontSize: 11, color: AppColors.textSecondary)),
                      ]),
                    ])),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(color: typeColor.withOpacity(0.1), borderRadius: BorderRadius.circular(6)),
                      child: Text(p['type'] as String, style: TextStyle(fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w600, color: typeColor))),
                  ]),
                  const SizedBox(height: 10),
                  Wrap(spacing: 6, runSpacing: 6,
                    children: (p['highlights'] as List).map((h) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(color: color.withOpacity(0.07), borderRadius: BorderRadius.circular(6)),
                      child: Text(h as String, style: TextStyle(fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w500, color: color)),
                    )).toList()),
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
