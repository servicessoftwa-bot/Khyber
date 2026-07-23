import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/dry_fruits_controller.dart';

class DryFruitsView extends GetView<DryFruitsController> {
  const DryFruitsView({super.key});
  static const _rust = Color(0xFFB7410E);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final hPad = w > 1100 ? (w - 1100) / 2 + 16 : 16.0;
    final crossCount = w > 700 ? 3 : 2;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: 160, pinned: true, backgroundColor: _rust,
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white), onPressed: () => Get.back()),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: const BoxDecoration(gradient: LinearGradient(colors: [_rust, Color(0xFF7A2A08)], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: SafeArea(child: Padding(padding: const EdgeInsets.fromLTRB(20, 32, 20, 16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Dry Fruits & Honey', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Poppins')),
                const SizedBox(height: 4),
                const Text('Premium KPK dry fruits, nuts & wild honey', style: TextStyle(fontSize: 13, color: Colors.white70, fontFamily: 'Poppins')),
              ]))),
            ),
          ),
          bottom: PreferredSize(preferredSize: const Size.fromHeight(96), child: Container(
            color: _rust, padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Column(children: [
              Container(height: 40, decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(12)),
                child: TextField(onChanged: (v) => controller.searchQuery.value = v, style: const TextStyle(color: Colors.white, fontSize: 14),
                  decoration: const InputDecoration(hintText: 'Search product...', hintStyle: TextStyle(color: Colors.white60), prefixIcon: Icon(Icons.search_rounded, color: Colors.white60, size: 20), border: InputBorder.none, contentPadding: EdgeInsets.symmetric(vertical: 10)))),
              const SizedBox(height: 8),
              SizedBox(height: 28, child: Obx(() { final sel = controller.selectedCategory.value; return ListView.separated(
                scrollDirection: Axis.horizontal, itemCount: controller.categories.length, separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (_, i) { final cat = controller.categories[i]; final isSelected = sel == cat;
                  return GestureDetector(onTap: () => controller.selectedCategory.value = cat, child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(color: isSelected ? Colors.white : Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(20)),
                    child: Text(cat, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: isSelected ? _rust : Colors.white)))); },
              );})),
            ]),
          )),
        ),
        Obx(() { final list = controller.filtered;
          if (list.isEmpty) return const SliverFillRemaining(child: Center(child: Text('No results', style: TextStyle(color: AppColors.textSecondary))));
          return SliverPadding(padding: EdgeInsets.fromLTRB(hPad, 12, hPad, 24), sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: crossCount, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 0.82),
            delegate: SliverChildBuilderDelegate((context, i) {
              final item = list[i];
              return Container(decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)]),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
                    child: Stack(fit: StackFit.passthrough, children: [
                      CachedNetworkImage(imageUrl: item.image, height: 90, width: double.infinity, fit: BoxFit.cover,
                        placeholder: (_, __) => Container(height: 90, color: _rust.withOpacity(0.08), child: Center(child: Text(item.emoji, style: const TextStyle(fontSize: 36)))),
                        errorWidget: (_, __, ___) => Container(height: 90, color: _rust.withOpacity(0.08), child: Center(child: Text(item.emoji, style: const TextStyle(fontSize: 36))))),
                      if (!item.inStock) Positioned(top: 8, right: 8, child: Container(padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2), decoration: BoxDecoration(color: Colors.red.withOpacity(0.9), borderRadius: BorderRadius.circular(10)),
                        child: const Text('Out', style: TextStyle(fontSize: 9, color: Colors.white, fontWeight: FontWeight.bold)))),
                    ])),
                  Padding(padding: const EdgeInsets.all(10), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const SizedBox(height: 2),
                  Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.textPrimary, fontFamily: 'Poppins'), maxLines: 1, overflow: TextOverflow.ellipsis),
                  Text(item.origin, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary, fontFamily: 'Poppins')),
                  Text(item.seller, style: const TextStyle(fontSize: 10, color: AppColors.textSecondary, fontFamily: 'Poppins'), maxLines: 1, overflow: TextOverflow.ellipsis),
                  const Spacer(),
                  Row(children: [
                    Row(children: List.generate(5, (j) => Icon(j < item.rating.floor() ? Icons.star_rounded : Icons.star_outline_rounded, size: 12, color: _rust))),
                  ]),
                  const SizedBox(height: 6),
                  Text('PKR ${item.pricePerKg.toInt()}/kg', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: _rust, fontFamily: 'Poppins')),
                ])),
                ]));
            }, childCount: list.length)));
        }),
      ]),
    );
  }
}