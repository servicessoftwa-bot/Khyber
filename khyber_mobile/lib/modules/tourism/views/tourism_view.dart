import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/tourism_controller.dart';

class TourismView extends GetView<TourismController> {
  const TourismView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: 160, pinned: true, backgroundColor: AppColors.accent,
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white), onPressed: () => Get.back()),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: const BoxDecoration(gradient: LinearGradient(colors: [AppColors.accent, Color(0xFF0D4A50)], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: SafeArea(child: Padding(padding: const EdgeInsets.fromLTRB(20, 32, 20, 16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Tourism KPK', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('Explore the beauty of Khyber Pakhtunkhwa', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70)),
              ]))),
            ),
          ),
          bottom: PreferredSize(preferredSize: const Size.fromHeight(50), child: Container(
            color: AppColors.accent, padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Container(height: 40, decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(12)),
              child: TextField(onChanged: (v) => controller.searchQuery.value = v, style: const TextStyle(color: Colors.white, fontSize: 14),
                decoration: const InputDecoration(hintText: 'Search destinations...', hintStyle: TextStyle(color: Colors.white60), prefixIcon: Icon(Icons.search_rounded, color: Colors.white60, size: 20), border: InputBorder.none, contentPadding: EdgeInsets.symmetric(vertical: 10)))),
          )),
        ),
        SliverToBoxAdapter(child: Padding(padding: const EdgeInsets.fromLTRB(16, 14, 16, 4), child: SizedBox(height: 36, child: Obx(() => ListView.separated(
          scrollDirection: Axis.horizontal, itemCount: controller.categories.length, separatorBuilder: (_, __) => const SizedBox(width: 8),
          itemBuilder: (_, i) { final cat = controller.categories[i]; final sel = controller.selectedCategory.value == cat;
            return GestureDetector(onTap: () => controller.selectedCategory.value = cat, child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(color: sel ? AppColors.accent : Colors.white, borderRadius: BorderRadius.circular(20),
                border: Border.all(color: sel ? AppColors.accent : AppColors.border),
                boxShadow: sel ? [BoxShadow(color: AppColors.accent.withOpacity(0.3), blurRadius: 8)] : []),
              child: Text(cat, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: sel ? Colors.white : AppColors.textSecondary)))); },
        ))))),
        Obx(() { final spots = controller.filteredSpots;
          return SliverPadding(padding: const EdgeInsets.fromLTRB(16, 12, 16, 24), sliver: SliverList(delegate: SliverChildBuilderDelegate((context, i) {
            final spot = spots[i];
            return Container(margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: AppColors.accent.withOpacity(0.08), blurRadius: 12, offset: const Offset(0, 4))]),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Stack(children: [
                  ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.network(spot.image, height: 180, width: double.infinity, fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(height: 180, color: AppColors.accent.withOpacity(0.1), child: const Icon(Icons.landscape_rounded, size: 60, color: AppColors.accent)))),
                  Positioned(top: 12, right: 12, child: Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(20)),
                    child: Row(mainAxisSize: MainAxisSize.min, children: [const Icon(Icons.star_rounded, color: AppColors.gold, size: 14), const SizedBox(width: 4), Text(spot.rating.toString(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13))]))),
                  Positioned(top: 12, left: 12, child: Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(color: AppColors.accent, borderRadius: BorderRadius.circular(20)),
                    child: Text(spot.category, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600)))),
                ]),
                Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(spot.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: AppColors.textPrimary)),
                  const SizedBox(height: 4),
                  Row(children: [const Icon(Icons.location_on_rounded, size: 14, color: AppColors.textSecondary), const SizedBox(width: 4), Text('${spot.location}, KPK', style: const TextStyle(fontSize: 12, color: AppColors.textSecondary))]),
                  const SizedBox(height: 10),
                  Text(spot.description, style: const TextStyle(fontSize: 13, color: AppColors.textSecondary, height: 1.5), maxLines: 3, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 12),
                  Wrap(spacing: 8, runSpacing: 6, children: spot.highlights.map((h) => Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(color: AppColors.accent.withOpacity(0.08), borderRadius: BorderRadius.circular(20), border: Border.all(color: AppColors.accent.withOpacity(0.2))),
                    child: Text(h, style: const TextStyle(fontSize: 11, color: AppColors.accent, fontWeight: FontWeight.w500)))).toList()),
                ])),
              ]));
          }, childCount: spots.length)));
        }),
      ]),
    );
  }
}
