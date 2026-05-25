import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/crafts_controller.dart';

class CraftsView extends GetView<CraftsController> {
  const CraftsView({super.key});
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final cols = w < 600 ? 2 : w < 900 ? 3 : 4;
    final hPad = w > 1100 ? (w - 1100) / 2 + 16 : 16.0;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(slivers: [
        SliverAppBar(expandedHeight: 160, pinned: true, backgroundColor: AppColors.gold,
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white), onPressed: () => Get.back()),
          flexibleSpace: FlexibleSpaceBar(background: Container(
            decoration: const BoxDecoration(gradient: LinearGradient(colors: [AppColors.gold, Color(0xFFB8860B)], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: SafeArea(child: Padding(padding: const EdgeInsets.fromLTRB(20, 32, 20, 16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Handicrafts & Artisans', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text('Authentic KPK crafts & traditional art', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70)),
            ]))))),
          bottom: PreferredSize(preferredSize: const Size.fromHeight(44), child: Container(
            color: AppColors.gold, padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
            child: SizedBox(height: 32, child: Obx(() { final sel = controller.selectedCraft.value; return ListView.separated(
              scrollDirection: Axis.horizontal, itemCount: controller.crafts.length, separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (_, i) { final c = controller.crafts[i]; final isSelected = sel == c;
                return GestureDetector(onTap: () => controller.selectedCraft.value = c, child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(color: isSelected ? Colors.white : Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(20)),
                  child: Text(c, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: isSelected ? AppColors.gold : Colors.white)))); },
            );})),
          )),
        ),
        Obx(() { final items = controller.filteredProducts;
          return SliverPadding(
            padding: EdgeInsets.fromLTRB(hPad, 16, hPad, 24),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, i) {
                final p = items[i];
                return Container(
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16),
                    boxShadow: [BoxShadow(color: AppColors.gold.withOpacity(0.12), blurRadius: 10, offset: const Offset(0, 4))]),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Expanded(child: Stack(fit: StackFit.expand, children: [
                      ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                        child: Image.network(p.image, fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(decoration: const BoxDecoration(color: Color(0xFFFFF8E1), borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
                            child: const Icon(Icons.handshake_rounded, color: AppColors.gold, size: 40)))),
                      Positioned(top: 8, right: 8, child: Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(20)),
                        child: Row(mainAxisSize: MainAxisSize.min, children: [const Icon(Icons.star_rounded, color: AppColors.gold, size: 12), const SizedBox(width: 3), Text(p.rating.toString(), style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold))]))),
                    ])),
                    Padding(padding: const EdgeInsets.all(10), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(p.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.textPrimary), maxLines: 2, overflow: TextOverflow.ellipsis),
                      const SizedBox(height: 2),
                      Text(p.artisan, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                      const SizedBox(height: 6),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        Text('PKR ${p.price.toInt()}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.primary)),
                        GestureDetector(onTap: () {}, child: Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                          decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(20)),
                          child: const Text('Buy', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)))),
                      ]),
                    ])),
                  ]));
              }, childCount: items.length),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: cols,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: cols > 2 ? 0.78 : 0.72,
              ),
            ),
          );
        }),
      ]),
    );
  }
}