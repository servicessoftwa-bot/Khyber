import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/businesses_controller.dart';

class BusinessesView extends GetView<BusinessesController> {
  const BusinessesView({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final hPad = w > 1100 ? (w - 1100) / 2 + 16 : 16.0;
    final cols = w >= 800 ? 2 : 1;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 160, pinned: true, backgroundColor: AppColors.primary,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
              onPressed: () => Get.back(),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.primary, AppColors.primaryDark],
                    begin: Alignment.topLeft, end: Alignment.bottomRight,
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text('Local Businesses',
                          style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text('Discover businesses across KPK',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(96),
              child: Container(
                color: AppColors.primary,
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                child: Column(children: [
                  Container(
                    height: 40,
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      onChanged: (v) => controller.searchQuery.value = v,
                      style: const TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'Poppins'),
                      decoration: const InputDecoration(
                        hintText: 'Search businesses...',
                        hintStyle: TextStyle(color: Colors.white60, fontFamily: 'Poppins'),
                        prefixIcon: Icon(Icons.search_rounded, color: Colors.white60, size: 20),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 32,
                    child: Obx(() { final sel = controller.selectedCategory.value; return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.categories.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemBuilder: (_, i) {
                        final cat = controller.categories[i];
                        final isSelected = sel == cat;
                        return GestureDetector(
                          onTap: () => controller.selectedCategory.value = cat,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.white : Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(20)),
                            child: Text(cat, style: TextStyle(
                              fontFamily: 'Poppins', fontSize: 11, fontWeight: FontWeight.w600,
                              color: isSelected ? AppColors.primary : Colors.white)),
                          ),
                        );
                      },
                    );}),
                  ),
                ]),
              ),
            ),
          ),
          Obx(() {
            final list = controller.filtered;
            if (list.isEmpty) {
              return const SliverFillRemaining(
                child: Center(child: Text('No businesses found',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 14, color: AppColors.textSecondary))),
              );
            }
            if (cols == 1) {
              return SliverPadding(
                padding: EdgeInsets.fromLTRB(hPad, 16, hPad, 24),
                sliver: SliverList(delegate: SliverChildBuilderDelegate(
                  (context, i) => _BusinessCard(biz: list[i]),
                  childCount: list.length,
                )),
              );
            }
            return SliverPadding(
              padding: EdgeInsets.fromLTRB(hPad, 16, hPad, 24),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, i) => _BusinessCard(biz: list[i]),
                  childCount: list.length,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 14, mainAxisSpacing: 14, childAspectRatio: 1.6,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _BusinessCard extends StatelessWidget {
  final Business biz;
  const _BusinessCard({required this.biz});

  Color get _catColor {
    switch (biz.category) {
      case 'Food': return AppColors.primary;
      case 'Retail': return const Color(0xFF8E44AD);
      case 'Services': return const Color(0xFF2980B9);
      case 'Health': return const Color(0xFFE74C3C);
      case 'Education': return const Color(0xFF27AE60);
      case 'Tech': return const Color(0xFF1A6B72);
      case 'Crafts': return const Color(0xFFD4A017);
      default: return AppColors.textSecondary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface, borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
        boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Photo banner
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: CachedNetworkImage(
              imageUrl: biz.image,
              height: 130, width: double.infinity, fit: BoxFit.cover,
              placeholder: (_, __) => Container(height: 130, color: _catColor.withOpacity(0.15),
                child: Center(child: Icon(Icons.business_rounded, size: 40, color: _catColor.withOpacity(0.4)))),
              errorWidget: (_, __, ___) => Container(height: 130, color: _catColor.withOpacity(0.15),
                child: Center(child: Icon(Icons.business_rounded, size: 40, color: _catColor.withOpacity(0.4)))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Expanded(child: Text(biz.name,
                  style: const TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.textPrimary))),
                if (biz.isVerified) const Icon(Icons.verified_rounded, size: 16, color: Color(0xFF2980B9)),
              ]),
              const SizedBox(height: 2),
              Row(children: [
                const Icon(Icons.location_on_rounded, size: 12, color: AppColors.textHint),
                const SizedBox(width: 3),
                Expanded(child: Text(biz.area,
                  style: const TextStyle(fontFamily: 'Poppins', fontSize: 11, color: AppColors.textSecondary))),
              ]),
            ])),
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Row(mainAxisSize: MainAxisSize.min, children: [
                const Icon(Icons.star_rounded, size: 13, color: Color(0xFFD4A017)),
                const SizedBox(width: 3),
                Text('${biz.rating}', style: const TextStyle(fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
              ]),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  color: biz.isOpen ? const Color(0xFF27AE60).withOpacity(0.1) : AppColors.border,
                  borderRadius: BorderRadius.circular(6)),
                child: Text(biz.isOpen ? 'Open' : 'Closed',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w600,
                    color: biz.isOpen ? const Color(0xFF27AE60) : AppColors.textHint)),
              ),
            ]),
          ]),
          const SizedBox(height: 10),
          Text(biz.description,
            style: const TextStyle(fontFamily: 'Poppins', fontSize: 12, color: AppColors.textSecondary, height: 1.4),
            maxLines: 2, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 10),
          Row(children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(color: _catColor.withOpacity(0.08), borderRadius: BorderRadius.circular(6)),
              child: Text(biz.category, style: TextStyle(fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w600, color: _catColor)),
            ),
            const SizedBox(width: 6),
            ...biz.tags.take(2).map((t) => Padding(
              padding: const EdgeInsets.only(right: 6),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                decoration: BoxDecoration(color: AppColors.background, borderRadius: BorderRadius.circular(6), border: Border.all(color: AppColors.border)),
                child: Text(t, style: const TextStyle(fontFamily: 'Poppins', fontSize: 10, color: AppColors.textSecondary)),
              ),
            )),
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(8)),
                child: const Text('View', style: TextStyle(fontFamily: 'Poppins', fontSize: 11, fontWeight: FontWeight.w600, color: Colors.white)),
              ),
            ),
          ]),
        ])),
      ],
      ),
    );
  }
}