import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/marble_controller.dart';

class MarbleView extends GetView<MarbleController> {
  const MarbleView({super.key});
  static const _slate = Color(0xFF7F8C8D);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final hPad = w > 1100 ? (w - 1100) / 2 + 16 : 16.0;
    final crossCount = w > 700 ? 3 : 2;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: 160, pinned: true, backgroundColor: _slate,
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white), onPressed: () => Get.back()),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: const BoxDecoration(gradient: LinearGradient(colors: [_slate, Color(0xFF2C3E50)], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: SafeArea(child: Padding(padding: const EdgeInsets.fromLTRB(20, 32, 20, 16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Marble & Stone', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Poppins')),
                const SizedBox(height: 4),
                const Text('Premium marble, granite & stone from KPK', style: TextStyle(fontSize: 13, color: Colors.white70, fontFamily: 'Poppins')),
              ]))),
            ),
          ),
          bottom: PreferredSize(preferredSize: const Size.fromHeight(96), child: Container(
            color: _slate, padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Column(children: [
              Container(height: 40, decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(12)),
                child: TextField(onChanged: (v) => controller.searchQuery.value = v, style: const TextStyle(color: Colors.white, fontSize: 14),
                  decoration: const InputDecoration(hintText: 'Search marble or supplier...', hintStyle: TextStyle(color: Colors.white60), prefixIcon: Icon(Icons.search_rounded, color: Colors.white60, size: 20), border: InputBorder.none, contentPadding: EdgeInsets.symmetric(vertical: 10)))),
              const SizedBox(height: 8),
              SizedBox(height: 28, child: Obx(() { final sel = controller.selectedType.value; return ListView.separated(
                scrollDirection: Axis.horizontal, itemCount: controller.types.length, separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (_, i) { final t = controller.types[i]; final isSelected = sel == t;
                  return GestureDetector(onTap: () => controller.selectedType.value = t, child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(color: isSelected ? Colors.white : Colors.white.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(20)),
                    child: Text(t, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: isSelected ? _slate : Colors.white)))); },
              );})),
            ]),
          )),
        ),
        Obx(() { final list = controller.filtered;
          if (list.isEmpty) return const SliverFillRemaining(child: Center(child: Text('No results', style: TextStyle(color: AppColors.textSecondary))));
          return SliverPadding(padding: EdgeInsets.fromLTRB(hPad, 12, hPad, 24), sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: crossCount, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 0.88),
            delegate: SliverChildBuilderDelegate((context, i) {
              final item = list[i];
              return Container(decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 8)]),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
                    child: Stack(fit: StackFit.passthrough, children: [
                      CachedNetworkImage(imageUrl: item.image, height: 90, width: double.infinity, fit: BoxFit.cover,
                        placeholder: (_, __) => Container(height: 90, color: _slate.withValues(alpha: 0.1), child: Center(child: Text(item.emoji, style: const TextStyle(fontSize: 40)))),
                        errorWidget: (_, __, ___) => Container(height: 90, color: _slate.withValues(alpha: 0.1), child: Center(child: Text(item.emoji, style: const TextStyle(fontSize: 40))))),
                      if (!item.available) Positioned(top: 8, right: 8, child: Container(padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2), decoration: BoxDecoration(color: Colors.red.withValues(alpha: 0.9), borderRadius: BorderRadius.circular(10)),
                        child: const Text('Out', style: TextStyle(fontSize: 9, color: Colors.white, fontWeight: FontWeight.bold)))),
                    ])),
                  Padding(padding: const EdgeInsets.fromLTRB(10, 8, 10, 10), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppColors.textPrimary, fontFamily: 'Poppins'), maxLines: 2, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 2),
                    Text('${item.type} • ${item.finish}', style: const TextStyle(fontSize: 10, color: AppColors.textSecondary, fontFamily: 'Poppins')),
                    Text(item.origin, style: const TextStyle(fontSize: 10, color: AppColors.textSecondary, fontFamily: 'Poppins')),
                    const SizedBox(height: 6),
                    Text('PKR ${item.pricePerSqFt.toInt()}/sq.ft', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: _slate, fontFamily: 'Poppins')),
                  ])),
                ]));
            }, childCount: list.length)));
        }),
      ]),
    );
  }
}