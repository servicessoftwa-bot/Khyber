import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/shopping_controller.dart';

class ShoppingView extends GetView<ShoppingController> {
  const ShoppingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: 160, pinned: true, backgroundColor: AppColors.primary,
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white), onPressed: () => Get.back()),
          flexibleSpace: FlexibleSpaceBar(background: Container(
            decoration: const BoxDecoration(gradient: LinearGradient(colors: [AppColors.primary, AppColors.primaryDark], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: SafeArea(child: Padding(padding: const EdgeInsets.fromLTRB(20, 32, 20, 16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Shopping', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text('Shop local products from KPK', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70)),
            ]))))),
          bottom: PreferredSize(preferredSize: const Size.fromHeight(90), child: Container(
            color: AppColors.primary, padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
            child: Column(children: [
              Container(height: 40, decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(12)),
                child: TextField(onChanged: (v) => controller.searchQuery.value = v, style: const TextStyle(color: Colors.white, fontSize: 14),
                  decoration: const InputDecoration(hintText: 'Search products...', hintStyle: TextStyle(color: Colors.white60), prefixIcon: Icon(Icons.search_rounded, color: Colors.white60, size: 20), border: InputBorder.none, contentPadding: EdgeInsets.symmetric(vertical: 10)))),
              const SizedBox(height: 8),
              SizedBox(height: 30, child: Obx(() => ListView.separated(
                scrollDirection: Axis.horizontal, itemCount: controller.categories.length, separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (_, i) { final cat = controller.categories[i]; final sel = controller.selectedCategory.value == cat;
                  return GestureDetector(onTap: () => controller.selectedCategory.value = cat, child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                    decoration: BoxDecoration(color: sel ? Colors.white : Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(20)),
                    child: Text(cat, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: sel ? AppColors.primary : Colors.white)))); },
              ))),
            ]),
          )),
        ),
        Obx(() { final items = controller.filteredProducts;
          if (items.isEmpty) return const SliverFillRemaining(child: Center(child: Text('No products found', style: TextStyle(color: AppColors.textSecondary))));
          return SliverPadding(padding: const EdgeInsets.all(16), sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate((context, i) {
              final p = items[i];
              final discount = p.originalPrice > p.price ? ((p.originalPrice - p.price) / p.originalPrice * 100).round() : 0;
              return Container(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14),
                  boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.07), blurRadius: 10, offset: const Offset(0, 4))]),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(child: Stack(fit: StackFit.expand, children: [
                    ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
                      child: Image.network(p.image, fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(color: AppColors.primaryLight, child: const Icon(Icons.shopping_bag_rounded, color: AppColors.primary, size: 40)))),
                    if (discount > 0) Positioned(top: 8, left: 8, child: Container(padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3), decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(20)),
                      child: Text('-$discount%', style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)))),
                    if (!p.inStock) Positioned.fill(child: Container(decoration: BoxDecoration(color: Colors.black38, borderRadius: const BorderRadius.vertical(top: Radius.circular(14))),
                      child: const Center(child: Text('Out of Stock', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12))))),
                  ])),
                  Padding(padding: const EdgeInsets.all(10), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(p.name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: AppColors.textPrimary), maxLines: 2, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 2),
                    Text(p.shop, style: const TextStyle(fontSize: 10, color: AppColors.textSecondary)),
                    const SizedBox(height: 4),
                    Row(children: [
                      Text('PKR ${p.price.toInt()}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.primary)),
                      if (discount > 0) ...[const SizedBox(width: 5), Text('${p.originalPrice.toInt()}', style: const TextStyle(fontSize: 10, color: AppColors.textSecondary, decoration: TextDecoration.lineThrough))],
                    ]),
                    const SizedBox(height: 6),
                    if (p.inStock) Obx(() { final qty = controller.itemQty(p.id);
                      return qty == 0
                          ? SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => controller.addToCart(p.id),
                              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 6), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                              child: const Text('Add', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold))))
                          : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                              GestureDetector(onTap: () => controller.removeFromCart(p.id), child: Container(width: 26, height: 26, decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.12), shape: BoxShape.circle), child: const Icon(Icons.remove_rounded, color: AppColors.primary, size: 14))),
                              Padding(padding: const EdgeInsets.symmetric(horizontal: 8), child: Text('$qty', style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary))),
                              GestureDetector(onTap: () => controller.addToCart(p.id), child: Container(width: 26, height: 26, decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle), child: const Icon(Icons.add_rounded, color: Colors.white, size: 14))),
                            ]); }),
                  ])),
                ]));
            }, childCount: items.length),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 0.65),
          ));
        }),
      ]),
      floatingActionButton: Obx(() { if (controller.cartCount == 0) return const SizedBox.shrink();
        return FloatingActionButton.extended(onPressed: () {}, backgroundColor: AppColors.primary,
          icon: const Icon(Icons.shopping_bag_rounded, color: Colors.white),
          label: Text('${controller.cartCount} items  |  PKR ${controller.cartTotal.toStringAsFixed(0)}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)));
      }),
    );
  }
}
