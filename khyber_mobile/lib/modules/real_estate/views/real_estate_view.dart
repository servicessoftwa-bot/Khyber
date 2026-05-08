import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/real_estate_controller.dart';

class RealEstateView extends GetView<RealEstateController> {
  const RealEstateView({super.key});

  static const _listings = [
    {'title': '3-Bed House for Sale', 'area': 'Phase 5, Hayatabad, Peshawar', 'price': 'PKR 1.8 Crore', 'type': 'Sale', 'size': '5 Marla', 'color': 0xFFB03A2E},
    {'title': '2-Bed Apartment for Rent', 'area': 'University Road, Peshawar', 'price': 'PKR 35,000/mo', 'type': 'Rent', 'size': '950 sqft', 'color': 0xFF2980B9},
    {'title': 'Commercial Shop Available', 'area': 'Saddar Bazaar, Peshawar', 'price': 'PKR 60,000/mo', 'type': 'Rent', 'size': '400 sqft', 'color': 0xFF27AE60},
    {'title': 'Plot for Sale', 'area': 'Abbottabad City', 'price': 'PKR 45 Lakh', 'type': 'Sale', 'size': '4 Marla', 'color': 0xFF8E44AD},
    {'title': 'Farm House for Rent', 'area': 'Charsadda Road, Peshawar', 'price': 'PKR 1.2 Lakh/mo', 'type': 'Rent', 'size': '2 Kanal', 'color': 0xFF1A6B72},
    {'title': '5-Bed House for Sale', 'area': 'Model Town, Mardan', 'price': 'PKR 2.5 Crore', 'type': 'Sale', 'size': '10 Marla', 'color': 0xFFD4A017},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: 160, pinned: true,
          backgroundColor: AppColors.primary,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
            onPressed: () => Get.back()),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primary, AppColors.primaryDark],
                  begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: SafeArea(child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const SizedBox(height: 8),
                  Text('Real Estate', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('Properties for sale & rent in KPK', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70)),
                ]),
              )),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(delegate: SliverChildListDelegate([
            const Text('Featured Listings', style: TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
            const SizedBox(height: 12),
            ..._listings.map((l) {
              final color = Color(l['color'] as int);
              final isRent = l['type'] == 'Rent';
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.surface, borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.border),
                  boxShadow: [BoxShadow(color: color.withOpacity(0.06), blurRadius: 8)]),
                child: Row(children: [
                  Container(
                    width: 50, height: 50,
                    decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(14)),
                    child: Icon(isRent ? Icons.apartment_rounded : Icons.home_rounded, color: color, size: 26)),
                  const SizedBox(width: 12),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(l['title'] as String, style: const TextStyle(fontFamily: 'Poppins', fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                    const SizedBox(height: 2),
                    Row(children: [
                      const Icon(Icons.location_on_rounded, size: 11, color: AppColors.textHint),
                      const SizedBox(width: 2),
                      Expanded(child: Text(l['area'] as String, style: const TextStyle(fontFamily: 'Poppins', fontSize: 11, color: AppColors.textSecondary))),
                    ]),
                    const SizedBox(height: 5),
                    Row(children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                        decoration: BoxDecoration(
                          color: isRent ? const Color(0xFF2980B9).withOpacity(0.1) : const Color(0xFF27AE60).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6)),
                        child: Text(l['type'] as String, style: TextStyle(fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w600,
                          color: isRent ? const Color(0xFF2980B9) : const Color(0xFF27AE60)))),
                      const SizedBox(width: 6),
                      Icon(Icons.straighten_rounded, size: 11, color: AppColors.textHint),
                      const SizedBox(width: 3),
                      Text(l['size'] as String, style: const TextStyle(fontFamily: 'Poppins', fontSize: 11, color: AppColors.textSecondary)),
                      const Spacer(),
                      Text(l['price'] as String, style: TextStyle(fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.bold, color: color)),
                    ]),
                  ])),
                ]),
              );
            }),
            const SizedBox(height: 24),
          ])),
        ),
      ]),
    );
  }
}
