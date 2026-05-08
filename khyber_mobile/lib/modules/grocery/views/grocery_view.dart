import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/grocery_controller.dart';

class GroceryView extends GetView<GroceryController> {
  const GroceryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Obx(() => controller.selectedStore.value == null
          ? _StoreListView(controller: controller)
          : _ProductsView(controller: controller)),
    );
  }
}

class _StoreListView extends StatelessWidget {
  final GroceryController controller;
  const _StoreListView({required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 160,
          pinned: true,
          backgroundColor: AppColors.primary,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
            onPressed: () => Get.back(),
          ),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primary, AppColors.primaryDark],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Text('Grocery Delivery', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text('Fresh items delivered to your door', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) {
                final store = controller.stores[i];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: GestureDetector(
                    onTap: () => controller.selectStore(store),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.08), blurRadius: 12, offset: const Offset(0, 4))],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                            child: Image.network(store.image, height: 130, width: double.infinity, fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Container(height: 130, color: AppColors.primaryLight,
                                child: const Icon(Icons.store_rounded, size: 50, color: AppColors.primary))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(store.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppColors.textPrimary)),
                                const SizedBox(height: 4),
                                Text(store.area, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Icon(Icons.star_rounded, color: AppColors.gold, size: 16),
                                    const SizedBox(width: 3),
                                    Text(store.rating.toString(), style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                                    const SizedBox(width: 12),
                                    const Icon(Icons.access_time_rounded, size: 14, color: AppColors.textSecondary),
                                    const SizedBox(width: 3),
                                    Text(store.deliveryTime, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                                    const SizedBox(width: 12),
                                    const Icon(Icons.delivery_dining_rounded, size: 14, color: AppColors.textSecondary),
                                    const SizedBox(width: 3),
                                    Text('PKR ${store.deliveryFee.toInt()}', style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Wrap(
                                  spacing: 6,
                                  children: store.tags.map((t) => Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                    decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: BorderRadius.circular(20)),
                                    child: Text(t, style: const TextStyle(fontSize: 11, color: AppColors.primary, fontWeight: FontWeight.w500)),
                                  )).toList(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              childCount: controller.stores.length,
            ),
          ),
        ),
      ],
    );
  }
}

class _ProductsView extends StatelessWidget {
  final GroceryController controller;
  const _ProductsView({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: AppColors.primary,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
              onPressed: () => controller.selectedStore.value = null,
            ),
            title: Obx(() => Text(controller.selectedStore.value?.name ?? '', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16))),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(96),
              child: Container(
                color: AppColors.primary,
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(12)),
                      child: TextField(
                        onChanged: (v) => controller.searchQuery.value = v,
                        style: const TextStyle(color: Colors.white, fontSize: 14),
                        decoration: const InputDecoration(
                          hintText: 'Search products...',
                          hintStyle: TextStyle(color: Colors.white60),
                          prefixIcon: Icon(Icons.search_rounded, color: Colors.white60, size: 20),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 32,
                      child: Obx(() => ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.categories.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 8),
                        itemBuilder: (_, i) {
                          final cat = controller.categories[i];
                          final selected = controller.selectedCategory.value == cat;
                          return GestureDetector(
                            onTap: () => controller.selectedCategory.value = cat,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                              decoration: BoxDecoration(
                                color: selected ? Colors.white : Colors.white.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(cat, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600,
                                color: selected ? AppColors.primary : Colors.white)),
                            ),
                          );
                        },
                      )),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Obx(() {
            final items = controller.filteredProducts;
            if (items.isEmpty) {
              return const SliverFillRemaining(
                child: Center(child: Text('No products found', style: TextStyle(color: AppColors.textSecondary))),
              );
            }
            return SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, i) {
                    final p = items[i];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
                              child: Image.network(p.image, width: double.infinity, fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => Container(color: AppColors.primaryLight,
                                  child: const Icon(Icons.shopping_basket_rounded, color: AppColors.primary, size: 36))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(p.name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: AppColors.textPrimary), maxLines: 2, overflow: TextOverflow.ellipsis),
                                const SizedBox(height: 2),
                                Text('Per ${p.unit}', style: const TextStyle(fontSize: 10, color: AppColors.textSecondary)),
                                const SizedBox(height: 6),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('PKR ${p.price.toInt()}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.primary)),
                                    Obx(() {
                                      final qty = controller.itemQty(p.id);
                                      return qty == 0
                                          ? GestureDetector(
                                              onTap: () => controller.addToCart(p.id),
                                              child: Container(
                                                width: 28, height: 28,
                                                decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                                                child: const Icon(Icons.add_rounded, color: Colors.white, size: 18),
                                              ),
                                            )
                                          : Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                GestureDetector(
                                                  onTap: () => controller.removeFromCart(p.id),
                                                  child: Container(width: 24, height: 24,
                                                    decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.15), shape: BoxShape.circle),
                                                    child: const Icon(Icons.remove_rounded, color: AppColors.primary, size: 14)),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 6),
                                                  child: Text('$qty', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.primary)),
                                                ),
                                                GestureDetector(
                                                  onTap: () => controller.addToCart(p.id),
                                                  child: Container(width: 24, height: 24,
                                                    decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                                                    child: const Icon(Icons.add_rounded, color: Colors.white, size: 14)),
                                                ),
                                              ],
                                            );
                                    }),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: items.length,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 0.72,
                ),
              ),
            );
          }),
        ],
      ),
      floatingActionButton: Obx(() {
        if (controller.cartCount == 0) return const SizedBox.shrink();
        return FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: AppColors.primary,
          icon: const Icon(Icons.shopping_cart_rounded, color: Colors.white),
          label: Text('${controller.cartCount} items  |  PKR ${controller.cartTotal.toStringAsFixed(0)}',
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        );
      }),
    );
  }
}
