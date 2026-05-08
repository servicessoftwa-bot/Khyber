import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/pharmacy_controller.dart';

class PharmacyView extends GetView<PharmacyController> {
  const PharmacyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Obx(() => controller.selectedPharmacy.value == null
          ? _PharmacyListView(ctrl: controller)
          : _MedicineView(ctrl: controller)),
    );
  }
}

class _PharmacyListView extends StatelessWidget {
  final PharmacyController ctrl;
  const _PharmacyListView({required this.ctrl});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverAppBar(
        expandedHeight: 160, pinned: true, backgroundColor: AppColors.primary,
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white), onPressed: () => Get.back()),
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            decoration: const BoxDecoration(gradient: LinearGradient(colors: [AppColors.primary, AppColors.primaryDark], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: SafeArea(child: Padding(padding: const EdgeInsets.fromLTRB(20, 32, 20, 16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Pharmacy', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text('Order medicines online', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70)),
            ]))),
          ),
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.all(16),
        sliver: SliverList(delegate: SliverChildBuilderDelegate((context, i) {
          final ph = ctrl.pharmacies[i];
          return Padding(padding: const EdgeInsets.only(bottom: 14), child: GestureDetector(
            onTap: () => ctrl.selectPharmacy(ph),
            child: Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.08), blurRadius: 12, offset: const Offset(0, 4))]),
              child: Row(children: [
                ClipRRect(borderRadius: const BorderRadius.horizontal(left: Radius.circular(16)),
                  child: Image.network(ph.image, width: 100, height: 100, fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(width: 100, height: 100, color: AppColors.primaryLight, child: const Icon(Icons.local_pharmacy_rounded, color: AppColors.primary, size: 40)))),
                Expanded(child: Padding(padding: const EdgeInsets.all(12), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    Expanded(child: Text(ph.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.textPrimary))),
                    Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(color: ph.isOpen ? Colors.green.withOpacity(0.12) : Colors.red.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
                      child: Text(ph.isOpen ? 'Open' : 'Closed', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: ph.isOpen ? Colors.green : Colors.red))),
                  ]),
                  const SizedBox(height: 4),
                  Text(ph.area, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                  const SizedBox(height: 6),
                  Row(children: [
                    const Icon(Icons.star_rounded, color: AppColors.gold, size: 14),
                    const SizedBox(width: 3),
                    Text(ph.rating.toString(), style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                    if (ph.delivery) ...[const SizedBox(width: 10), const Icon(Icons.delivery_dining_rounded, size: 14, color: AppColors.accent), const SizedBox(width: 3), const Text('Delivery', style: TextStyle(fontSize: 11, color: AppColors.accent))],
                  ]),
                  const SizedBox(height: 6),
                  Wrap(spacing: 6, children: ph.tags.map((t) => Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: BorderRadius.circular(20)),
                    child: Text(t, style: const TextStyle(fontSize: 10, color: AppColors.primary, fontWeight: FontWeight.w500)))).toList()),
                ]))),
              ]),
            ),
          ));
        }, childCount: ctrl.pharmacies.length)),
      ),
    ]);
  }
}

class _MedicineView extends StatelessWidget {
  final PharmacyController ctrl;
  const _MedicineView({required this.ctrl});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          pinned: true, backgroundColor: AppColors.primary,
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white), onPressed: () => ctrl.selectedPharmacy.value = null),
          title: Obx(() => Text(ctrl.selectedPharmacy.value?.name ?? '', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15))),
          bottom: PreferredSize(preferredSize: const Size.fromHeight(88), child: Container(
            color: AppColors.primary, padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Column(children: [
              Container(height: 40, decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(12)),
                child: TextField(onChanged: (v) => ctrl.searchQuery.value = v,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                  decoration: const InputDecoration(hintText: 'Search medicines...', hintStyle: TextStyle(color: Colors.white60), prefixIcon: Icon(Icons.search_rounded, color: Colors.white60, size: 20), border: InputBorder.none, contentPadding: EdgeInsets.symmetric(vertical: 10)))),
              const SizedBox(height: 8),
              SizedBox(height: 30, child: Obx(() => ListView.separated(
                scrollDirection: Axis.horizontal, itemCount: ctrl.categories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (_, i) { final cat = ctrl.categories[i]; final sel = ctrl.selectedCategory.value == cat;
                  return GestureDetector(onTap: () => ctrl.selectedCategory.value = cat, child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                    decoration: BoxDecoration(color: sel ? Colors.white : Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(20)),
                    child: Text(cat, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: sel ? AppColors.primary : Colors.white)))); },
              ))),
            ]),
          )),
        ),
        Obx(() { final items = ctrl.filteredMedicines;
          if (items.isEmpty) return const SliverFillRemaining(child: Center(child: Text('No medicines found', style: TextStyle(color: AppColors.textSecondary))));
          return SliverPadding(padding: const EdgeInsets.all(16), sliver: SliverList(delegate: SliverChildBuilderDelegate((context, i) {
            final m = items[i];
            return Container(margin: const EdgeInsets.only(bottom: 12), padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)]),
              child: Row(children: [
                ClipRRect(borderRadius: BorderRadius.circular(10),
                  child: Image.network(m.image, width: 64, height: 64, fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(width: 64, height: 64, decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: BorderRadius.circular(10)),
                      child: const Icon(Icons.medication_rounded, color: AppColors.primary, size: 32)))),
                const SizedBox(width: 12),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    Expanded(child: Text(m.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.textPrimary))),
                    if (m.requiresPrescription) Container(padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                      decoration: BoxDecoration(color: Colors.orange.withOpacity(0.12), borderRadius: BorderRadius.circular(8)),
                      child: const Text('Rx', style: TextStyle(fontSize: 10, color: Colors.orange, fontWeight: FontWeight.bold))),
                  ]),
                  Text(m.brand, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                  const SizedBox(height: 6),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text('PKR ${m.price.toInt()}', style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary, fontSize: 15)),
                    Obx(() { final qty = ctrl.itemQty(m.id);
                      return qty == 0
                          ? GestureDetector(onTap: () => ctrl.addToCart(m.id), child: Container(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                              decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(20)),
                              child: const Text('Add', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12))))
                          : Row(mainAxisSize: MainAxisSize.min, children: [
                              GestureDetector(onTap: () => ctrl.removeFromCart(m.id), child: Container(width: 28, height: 28, decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.12), shape: BoxShape.circle), child: const Icon(Icons.remove_rounded, color: AppColors.primary, size: 16))),
                              Padding(padding: const EdgeInsets.symmetric(horizontal: 8), child: Text('$qty', style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary))),
                              GestureDetector(onTap: () => ctrl.addToCart(m.id), child: Container(width: 28, height: 28, decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle), child: const Icon(Icons.add_rounded, color: Colors.white, size: 16))),
                            ]); }),
                  ]),
                ])),
              ]));
          }, childCount: items.length)));
        }),
      ]),
      floatingActionButton: Obx(() { if (ctrl.cartCount == 0) return const SizedBox.shrink();
        return FloatingActionButton.extended(onPressed: () {}, backgroundColor: AppColors.primary,
          icon: const Icon(Icons.shopping_cart_rounded, color: Colors.white),
          label: Text('${ctrl.cartCount} items  |  PKR ${ctrl.cartTotal.toStringAsFixed(0)}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)));
      }),
    );
  }
}
