import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/agriculture_controller.dart';

class AgricultureView extends GetView<AgricultureController> {
  const AgricultureView({super.key});
  static const _green = Color(0xFF27AE60);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final hPad = w > 1100 ? (w - 1100) / 2 + 16 : 16.0;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: 160, pinned: true, backgroundColor: _green,
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white), onPressed: () => Get.back()),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: const BoxDecoration(gradient: LinearGradient(colors: [_green, Color(0xFF1E8449)], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: SafeArea(child: Padding(padding: const EdgeInsets.fromLTRB(20, 32, 20, 16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Agriculture Market', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Poppins')),
                const SizedBox(height: 4),
                const Text('Live crop & input prices across KPK', style: TextStyle(fontSize: 13, color: Colors.white70, fontFamily: 'Poppins')),
              ]))),
            ),
          ),
          bottom: PreferredSize(preferredSize: const Size.fromHeight(96), child: Container(
            color: _green, padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Column(children: [
              Container(height: 40, decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(12)),
                child: TextField(onChanged: (v) => controller.searchQuery.value = v, style: const TextStyle(color: Colors.white, fontSize: 14),
                  decoration: const InputDecoration(hintText: 'Search crop or district...', hintStyle: TextStyle(color: Colors.white60), prefixIcon: Icon(Icons.search_rounded, color: Colors.white60, size: 20), border: InputBorder.none, contentPadding: EdgeInsets.symmetric(vertical: 10)))),
              const SizedBox(height: 8),
              SizedBox(height: 28, child: Obx(() { final sel = controller.selectedCategory.value; return ListView.separated(
                scrollDirection: Axis.horizontal, itemCount: controller.categories.length, separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (_, i) { final cat = controller.categories[i]; final isSelected = sel == cat;
                  return GestureDetector(onTap: () => controller.selectedCategory.value = cat, child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(color: isSelected ? Colors.white : Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(20)),
                    child: Text(cat, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: isSelected ? _green : Colors.white)))); },
              );})),
            ]),
          )),
        ),
        Obx(() { final list = controller.filtered;
          if (list.isEmpty) return const SliverFillRemaining(child: Center(child: Text('No results', style: TextStyle(color: AppColors.textSecondary))));
          return SliverPadding(padding: EdgeInsets.fromLTRB(hPad, 12, hPad, 24), sliver: SliverList(delegate: SliverChildBuilderDelegate((context, i) {
            final c = list[i];
            final isUp = c.trend == 'up';
            final isDown = c.trend == 'down';
            final trendColor = isUp ? const Color(0xFFE74C3C) : isDown ? _green : AppColors.textSecondary;
            final trendIcon = isUp ? Icons.trending_up_rounded : isDown ? Icons.trending_down_rounded : Icons.trending_flat_rounded;
            final change = ((c.price - c.prevPrice) / c.prevPrice * 100).abs().toStringAsFixed(1);
            return Container(margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)]),
              child: Padding(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12), child: Row(children: [
                ClipRRect(borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(imageUrl: c.image, width: 56, height: 56, fit: BoxFit.cover,
                    placeholder: (_, __) => Container(width: 56, height: 56, color: _green.withOpacity(0.08), child: Center(child: Text(c.emoji, style: const TextStyle(fontSize: 24)))),
                    errorWidget: (_, __, ___) => Container(width: 56, height: 56, color: _green.withOpacity(0.08), child: Center(child: Text(c.emoji, style: const TextStyle(fontSize: 24)))))),
                const SizedBox(width: 12),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(c.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.textPrimary, fontFamily: 'Poppins')),
                  Text('${c.market} • ${c.district}', style: const TextStyle(fontSize: 11, color: AppColors.textSecondary, fontFamily: 'Poppins')),
                ])),
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Text('PKR ${c.price.toInt()}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppColors.textPrimary, fontFamily: 'Poppins')),
                  Text('per ${c.unit}', style: const TextStyle(fontSize: 10, color: AppColors.textSecondary, fontFamily: 'Poppins')),
                  const SizedBox(height: 2),
                  Row(mainAxisSize: MainAxisSize.min, children: [
                    Icon(trendIcon, size: 14, color: trendColor),
                    const SizedBox(width: 2),
                    Text('$change%', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: trendColor, fontFamily: 'Poppins')),
                  ]),
                ]),
              ])));
          }, childCount: list.length)));
        }),
      ]),
    );
  }
}