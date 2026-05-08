import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/hospitals_controller.dart';

class HospitalsView extends GetView<HospitalsController> {
  const HospitalsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: 160, pinned: true, backgroundColor: AppColors.primary,
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white), onPressed: () => Get.back()),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: const BoxDecoration(gradient: LinearGradient(colors: [AppColors.primary, AppColors.primaryDark], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: SafeArea(child: Padding(padding: const EdgeInsets.fromLTRB(20, 32, 20, 16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Hospitals', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('Find hospitals across KPK', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70)),
              ]))),
            ),
          ),
          bottom: PreferredSize(preferredSize: const Size.fromHeight(90), child: Container(
            color: AppColors.primary, padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
            child: Column(children: [
              Container(height: 40, decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(12)),
                child: TextField(onChanged: (v) => controller.searchQuery.value = v, style: const TextStyle(color: Colors.white, fontSize: 14),
                  decoration: const InputDecoration(hintText: 'Search hospitals...', hintStyle: TextStyle(color: Colors.white60), prefixIcon: Icon(Icons.search_rounded, color: Colors.white60, size: 20), border: InputBorder.none, contentPadding: EdgeInsets.symmetric(vertical: 10)))),
              const SizedBox(height: 8),
              SizedBox(height: 28, child: Obx(() => ListView.separated(
                scrollDirection: Axis.horizontal, itemCount: controller.districts.length, separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (_, i) { final d = controller.districts[i]; final sel = controller.selectedDistrict.value == d;
                  return GestureDetector(onTap: () => controller.selectedDistrict.value = d, child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(color: sel ? Colors.white : Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(20)),
                    child: Text(d, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: sel ? AppColors.primary : Colors.white)))); },
              ))),
            ]),
          )),
        ),
        Obx(() { final list = controller.filteredHospitals;
          return SliverPadding(padding: const EdgeInsets.fromLTRB(16, 12, 16, 24), sliver: SliverList(delegate: SliverChildBuilderDelegate((context, i) {
            final h = list[i];
            return Container(margin: const EdgeInsets.only(bottom: 14),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.07), blurRadius: 10, offset: const Offset(0, 4))]),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Stack(children: [
                    Image.network(h.image, height: 140, width: double.infinity, fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(height: 140, color: AppColors.primaryLight, child: const Icon(Icons.local_hospital_rounded, size: 50, color: AppColors.primary))),
                    if (h.emergency) Positioned(top: 10, right: 10, child: Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(20)),
                      child: const Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.emergency_rounded, color: Colors.white, size: 12), SizedBox(width: 4), Text('24/7 Emergency', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold))]))),
                    Positioned(top: 10, left: 10, child: Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.85), borderRadius: BorderRadius.circular(20)),
                      child: Text(h.type, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600)))),
                  ])),
                Padding(padding: const EdgeInsets.all(14), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    Expanded(child: Text(h.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppColors.textPrimary))),
                    const Icon(Icons.star_rounded, color: AppColors.gold, size: 16),
                    const SizedBox(width: 3),
                    Text(h.rating.toString(), style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                  ]),
                  const SizedBox(height: 4),
                  Row(children: [const Icon(Icons.location_on_rounded, size: 14, color: AppColors.textSecondary), const SizedBox(width: 4), Expanded(child: Text(h.address, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)))]),
                  const SizedBox(height: 10),
                  Wrap(spacing: 6, runSpacing: 6, children: h.specialties.map((s) => Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: BorderRadius.circular(20)),
                    child: Text(s, style: const TextStyle(fontSize: 11, color: AppColors.primary, fontWeight: FontWeight.w500)))).toList()),
                  const SizedBox(height: 12),
                  Row(children: [
                    Expanded(child: OutlinedButton.icon(onPressed: () async { final uri = Uri.parse("tel:${h.phone}"); if (await canLaunchUrl(uri)) launchUrl(uri); },
                      icon: const Icon(Icons.call_rounded, size: 16), label: Text(h.phone, style: const TextStyle(fontSize: 12)),
                      style: OutlinedButton.styleFrom(foregroundColor: AppColors.primary, side: const BorderSide(color: AppColors.primary), padding: const EdgeInsets.symmetric(vertical: 8), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))))),
                  ]),
                ])),
              ]));
          }, childCount: list.length)));
        }),
      ]),
    );
  }
}
