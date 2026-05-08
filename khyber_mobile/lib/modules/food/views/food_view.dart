import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../controllers/food_controller.dart';
import '../models/food_model.dart';
import '../../../core/theme/app_colors.dart';
import '../../../app/routes/app_routes.dart';

class FoodView extends StatelessWidget {
  const FoodView({super.key});
  FoodController get ctrl => Get.find<FoodController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(children: [
        _FoodHeader(),
        _FilterBar(),
        Expanded(child: _RestaurantList()),
      ]),
      floatingActionButton: Obx(() => ctrl.cartCount > 0
        ? FloatingActionButton.extended(
            onPressed: () => _showCart(context),
            backgroundColor: AppColors.foodColor,
            icon: const Icon(Icons.shopping_bag_rounded, color: Colors.white),
            label: Text('${ctrl.cartCount} items  •  PKR ${ctrl.cartTotal.toStringAsFixed(0)}',
              style: const TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600, color: Colors.white)),
          )
        : const SizedBox.shrink()),
    );
  }

  void _showCart(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _CartSheet(),
    );
  }
}

// ── HEADER ────────────────────────────────────────────────────────────────────
class _FoodHeader extends StatelessWidget {
  FoodController get ctrl => Get.find<FoodController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 8, bottom: 16, left: 20, right: 20),
      color: AppColors.surface,
      child: Column(children: [
        Row(children: [
          IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20), onPressed: () => Get.back()),
          const SizedBox(width: 4),
          const Expanded(child: Text('Food & Restaurants',
            style: TextStyle(fontFamily: 'Poppins', fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.textPrimary))),
          const Icon(Icons.location_on_rounded, color: AppColors.primary, size: 18),
          const SizedBox(width: 4),
          const Text('Peshawar', style: TextStyle(fontFamily: 'Poppins', fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.primary)),
        ]),
        const SizedBox(height: 12),
        Obx(() => TextField(
          onChanged: ctrl.setSearch,
          decoration: InputDecoration(
            hintText: 'Search restaurants, dishes...',
            hintStyle: const TextStyle(fontFamily: 'Poppins', fontSize: 13, color: AppColors.textHint),
            prefixIcon: const Icon(Icons.search_rounded, size: 20, color: AppColors.textHint),
            suffixIcon: ctrl.searchQuery.value.isNotEmpty
              ? IconButton(icon: const Icon(Icons.clear_rounded, size: 18), onPressed: () => ctrl.setSearch(''))
              : null,
            filled: true, fillColor: AppColors.background,
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
          ),
        )),
      ]),
    );
  }
}

// ── FILTER BAR ────────────────────────────────────────────────────────────────
class _FilterBar extends StatelessWidget {
  FoodController get ctrl => Get.find<FoodController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surface,
      padding: const EdgeInsets.only(bottom: 12),
      child: Obx(() => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: ctrl.filters.map((f) {
            final sel = ctrl.selectedFilter.value == f;
            return GestureDetector(
              onTap: () => ctrl.setFilter(f),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
                decoration: BoxDecoration(
                  color: sel ? AppColors.foodColor : AppColors.background,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: sel ? AppColors.foodColor : AppColors.border),
                ),
                child: Text(f, style: TextStyle(fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w600,
                  color: sel ? Colors.white : AppColors.textSecondary)),
              ),
            );
          }).toList(),
        ),
      )),
    );
  }
}

// ── RESTAURANT LIST ───────────────────────────────────────────────────────────
class _RestaurantList extends StatelessWidget {
  FoodController get ctrl => Get.find<FoodController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final list = ctrl.filteredRestaurants;
      if (list.isEmpty) {
        return const Center(child: Text('No restaurants found', style: TextStyle(fontFamily: 'Poppins', color: AppColors.textSecondary)));
      }
      return ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
        itemCount: list.length,
        itemBuilder: (_, i) => _RestaurantCard(restaurant: list[i]),
      );
    });
  }
}

class _RestaurantCard extends StatelessWidget {
  final RestaurantModel restaurant;
  const _RestaurantCard({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showMenu(context),
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border, width: 0.8),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 3))],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Stack(children: [
              CachedNetworkImage(imageUrl: restaurant.image, height: 160, width: double.infinity, fit: BoxFit.cover,
                placeholder: (_, __) => Container(height: 160, color: AppColors.border),
                errorWidget: (_, __, ___) => Container(height: 160, color: AppColors.primaryLight,
                  child: const Icon(Icons.restaurant_rounded, size: 48, color: AppColors.primary))),
              if (!restaurant.isOpen)
                Container(height: 160, color: Colors.black54,
                  child: const Center(child: Text('Closed', style: TextStyle(fontFamily: 'Poppins', color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)))),
              Positioned(top: 10, right: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    const Icon(Icons.star_rounded, size: 13, color: Color(0xFFD4A017)),
                    const SizedBox(width: 3),
                    Text('${restaurant.rating}', style: const TextStyle(fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w700)),
                  ]),
                )),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(restaurant.name, style: const TextStyle(fontFamily: 'Poppins', fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
              const SizedBox(height: 2),
              Text(restaurant.cuisine, style: const TextStyle(fontFamily: 'Poppins', fontSize: 12, color: AppColors.textSecondary)),
              const SizedBox(height: 8),
              Row(children: [
                _InfoChip(Icons.access_time_rounded, '${restaurant.deliveryTime} min'),
                const SizedBox(width: 10),
                _InfoChip(Icons.delivery_dining_rounded, 'PKR ${restaurant.deliveryFee.toStringAsFixed(0)}'),
                const SizedBox(width: 10),
                _InfoChip(Icons.shopping_bag_outlined, 'Min PKR ${restaurant.minOrder.toStringAsFixed(0)}'),
              ]),
              const SizedBox(height: 8),
              Wrap(spacing: 6, children: restaurant.tags.map((t) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(color: AppColors.foodColor.withValues(alpha: 0.08), borderRadius: BorderRadius.circular(6)),
                child: Text(t, style: const TextStyle(fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w500, color: AppColors.foodColor)),
              )).toList()),
            ]),
          ),
        ]),
      ),
    );
  }

  void _showMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _MenuSheet(restaurant: restaurant),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String text;
  const _InfoChip(this.icon, this.text);
  @override
  Widget build(BuildContext context) => Row(mainAxisSize: MainAxisSize.min, children: [
    Icon(icon, size: 13, color: AppColors.textSecondary),
    const SizedBox(width: 3),
    Text(text, style: const TextStyle(fontFamily: 'Poppins', fontSize: 11, color: AppColors.textSecondary)),
  ]);
}

// ── MENU BOTTOM SHEET ─────────────────────────────────────────────────────────
class _MenuSheet extends StatelessWidget {
  final RestaurantModel restaurant;
  const _MenuSheet({required this.restaurant});
  FoodController get ctrl => Get.find<FoodController>();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.85, minChildSize: 0.5, maxChildSize: 0.95,
      builder: (_, scrollCtrl) => Container(
        decoration: const BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(children: [
          Container(width: 40, height: 4, margin: const EdgeInsets.only(top: 12, bottom: 8),
            decoration: BoxDecoration(color: AppColors.border, borderRadius: BorderRadius.circular(2))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(children: [
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(restaurant.name, style: const TextStyle(fontFamily: 'Poppins', fontSize: 17, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                Text(restaurant.cuisine, style: const TextStyle(fontFamily: 'Poppins', fontSize: 12, color: AppColors.textSecondary)),
              ])),
              GestureDetector(onTap: () => Get.back(), child: const Icon(Icons.close_rounded, color: AppColors.textSecondary)),
            ]),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView(controller: scrollCtrl, padding: const EdgeInsets.all(16),
              children: ctrl.menuItems.map((item) => _MenuItemCard(item: item)).toList()),
          ),
        ]),
      ),
    );
  }
}

class _MenuItemCard extends StatelessWidget {
  final MenuItemModel item;
  const _MenuItemCard({required this.item});
  FoodController get ctrl => Get.find<FoodController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border, width: 0.8),
      ),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(imageUrl: item.image, width: 80, height: 80, fit: BoxFit.cover,
            placeholder: (_, __) => Container(width: 80, height: 80, color: AppColors.border),
            errorWidget: (_, __, ___) => Container(width: 80, height: 80, color: AppColors.primaryLight,
              child: const Icon(Icons.fastfood_rounded, color: AppColors.primary))),
        ),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            if (item.isVeg) Container(width: 12, height: 12, margin: const EdgeInsets.only(right: 5),
              decoration: BoxDecoration(border: Border.all(color: Colors.green), borderRadius: BorderRadius.circular(2)),
              child: const Center(child: Icon(Icons.circle, size: 7, color: Colors.green))),
            Expanded(child: Text(item.name, style: const TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary))),
            if (item.isPopular) Container(padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(color: AppColors.foodColor.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(6)),
              child: const Text('Popular', style: TextStyle(fontFamily: 'Poppins', fontSize: 9, fontWeight: FontWeight.w600, color: AppColors.foodColor))),
          ]),
          const SizedBox(height: 3),
          Text(item.description, style: const TextStyle(fontFamily: 'Poppins', fontSize: 11, color: AppColors.textSecondary), maxLines: 2, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 8),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('PKR ${item.price.toStringAsFixed(0)}', style: const TextStyle(fontFamily: 'Poppins', fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.primary)),
            Obx(() {
              final qty = ctrl.itemQty(item.id);
              return qty == 0
                ? GestureDetector(
                    onTap: () => ctrl.addToCart(item),
                    child: Container(width: 32, height: 32,
                      decoration: BoxDecoration(color: AppColors.foodColor, borderRadius: BorderRadius.circular(8)),
                      child: const Icon(Icons.add_rounded, color: Colors.white, size: 20)),
                  )
                : Container(
                    decoration: BoxDecoration(color: AppColors.foodColor, borderRadius: BorderRadius.circular(8)),
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      GestureDetector(onTap: () => ctrl.removeFromCart(item),
                        child: const Padding(padding: EdgeInsets.all(6), child: Icon(Icons.remove_rounded, color: Colors.white, size: 16))),
                      Text('$qty', style: const TextStyle(fontFamily: 'Poppins', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14)),
                      GestureDetector(onTap: () => ctrl.addToCart(item),
                        child: const Padding(padding: EdgeInsets.all(6), child: Icon(Icons.add_rounded, color: Colors.white, size: 16))),
                    ]),
                  );
            }),
          ]),
        ])),
      ]),
    );
  }
}

// ── CART BOTTOM SHEET ─────────────────────────────────────────────────────────
class _CartSheet extends StatelessWidget {
  FoodController get ctrl => Get.find<FoodController>();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6, minChildSize: 0.4, maxChildSize: 0.9,
      builder: (_, scrollCtrl) => Container(
        decoration: const BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(children: [
          Container(width: 40, height: 4, margin: const EdgeInsets.only(top: 12, bottom: 8),
            decoration: BoxDecoration(color: AppColors.border, borderRadius: BorderRadius.circular(2))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(children: [
              const Expanded(child: Text('Your Cart', style: TextStyle(fontFamily: 'Poppins', fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.textPrimary))),
              GestureDetector(onTap: () => Get.back(), child: const Icon(Icons.close_rounded, color: AppColors.textSecondary)),
            ]),
          ),
          const Divider(height: 1),
          Expanded(
            child: Obx(() => ListView(controller: scrollCtrl, padding: const EdgeInsets.all(16),
              children: ctrl.cart.map((c) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(children: [
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(c.item.name, style: const TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                    Text('PKR ${c.item.price.toStringAsFixed(0)} x ${c.quantity}',
                      style: const TextStyle(fontFamily: 'Poppins', fontSize: 12, color: AppColors.textSecondary)),
                  ])),
                  Text('PKR ${(c.item.price * c.quantity).toStringAsFixed(0)}',
                    style: const TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.primary)),
                ]),
              )).toList())),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(border: Border(top: BorderSide(color: AppColors.border))),
            child: Obx(() => Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text('Total', style: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                Text('PKR ${ctrl.cartTotal.toStringAsFixed(0)}',
                  style: const TextStyle(fontFamily: 'Poppins', fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.primary)),
              ]),
              const SizedBox(height: 14),
              SizedBox(width: double.infinity, height: 52,
                child: ElevatedButton(
                  onPressed: () { Get.back(); Get.snackbar('Order Placed!', 'Your order is being prepared.', snackPosition: SnackPosition.BOTTOM, backgroundColor: AppColors.success, colorText: Colors.white); ctrl.cart.clear(); },
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.foodColor, foregroundColor: Colors.white, elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                  child: const Text('Place Order', style: TextStyle(fontFamily: 'Poppins', fontSize: 15, fontWeight: FontWeight.w700)),
                )),
            ])),
          ),
        ]),
      ),
    );
  }
}