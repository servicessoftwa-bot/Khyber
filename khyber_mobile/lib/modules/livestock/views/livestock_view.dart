import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/livestock_controller.dart';

class LivestockView extends GetView<LivestockController> {
  const LivestockView({super.key});
  static const _brown = Color(0xFF8B4513);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final hPad = w > 1100 ? (w - 1100) / 2 + 16 : 16.0;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: 160, pinned: true, backgroundColor: _brown,
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white), onPressed: () => Get.back()),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: const BoxDecoration(gradient: LinearGradient(colors: [_brown, Color(0xFF5D2E0C)], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: SafeArea(child: Padding(padding: const EdgeInsets.fromLTRB(20, 32, 20, 16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Livestock Market', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Poppins')),
                const SizedBox(height: 4),
                const Text('Cattle, goats, sheep & poultry prices — KPK', style: TextStyle(fontSize: 13, color: Colors.white70, fontFamily: 'Poppins')),
              ]))),
            ),
          ),
          bottom: PreferredSize(preferredSize: const Size.fromHeight(96), child: Container(
            color: _brown, padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Column(children: [
              Container(height: 40, decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(12)),
                child: TextField(onChanged: (v) => controller.searchQuery.value = v, style: const TextStyle(color: Colors.white, fontSize: 14),
                  decoration: const InputDecoration(hintText: 'Search animal or district...', hintStyle: TextStyle(color: Colors.white60), prefixIcon: Icon(Icons.search_rounded, color: Colors.white60, size: 20), border: InputBorder.none, contentPadding: EdgeInsets.symmetric(vertical: 10)))),
              const SizedBox(height: 8),
              SizedBox(height: 28, child: Obx(() { final sel = controller.selectedCategory.value; return ListView.separated(
                scrollDirection: Axis.horizontal, itemCount: controller.categories.length, separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (_, i) { final cat = controller.categories[i]; final isSelected = sel == cat;
                  return GestureDetector(onTap: () => controller.selectedCategory.value = cat, child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(color: isSelected ? Colors.white : Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(20)),
                    child: Text(cat, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: isSelected ? _brown : Colors.white)))); },
              );})),
            ]),
          )),
        ),
        Obx(() { final list = controller.filtered;
          if (list.isEmpty) return const SliverFillRemaining(child: Center(child: Text('No results', style: TextStyle(color: AppColors.textSecondary))));
          return SliverPadding(padding: EdgeInsets.fromLTRB(hPad, 12, hPad, 24), sliver: SliverList(delegate: SliverChildBuilderDelegate((context, i) {
            final item = list[i];
            return Container(margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)]),
              child: Padding(padding: const EdgeInsets.all(14), child: Row(children: [
                ClipRRect(borderRadius: BorderRadius.circular(12), child: CachedNetworkImage(imageUrl: item.image, width: 64, height: 64, fit: BoxFit.cover, placeholder: (_, __) => Container(width: 64, height: 64, color: _brown.withOpacity(0.1), child: Center(child: Text(item.emoji, style: const TextStyle(fontSize: 28)))), errorWidget: (_, __, ___) => Container(width: 64, height: 64, color: _brown.withOpacity(0.1), child: Center(child: Text(item.emoji, style: const TextStyle(fontSize: 28)))))),
                const SizedBox(width: 12),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.textPrimary, fontFamily: 'Poppins')),
                  Text('${item.breed} • ${item.market}, ${item.district}', style: const TextStyle(fontSize: 11, color: AppColors.textSecondary, fontFamily: 'Poppins')),
                  const SizedBox(height: 4),
                  Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: _brown.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
                    child: Text(item.category, style: const TextStyle(fontSize: 10, color: _brown, fontWeight: FontWeight.w600, fontFamily: 'Poppins'))),
                ])),
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Text('PKR ${item.minPrice.toInt()}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.textPrimary, fontFamily: 'Poppins')),
                  Text('– ${item.maxPrice.toInt()}', style: const TextStyle(fontSize: 12, color: AppColors.textSecondary, fontFamily: 'Poppins')),
                ]),
              ])));
          }, childCount: list.length)));
        }),
      ]),
    );
  }
}