import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/education_controller.dart';

class EducationView extends GetView<EducationController> {
  const EducationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(slivers: [
        SliverAppBar(expandedHeight: 160, pinned: true, backgroundColor: AppColors.primary,
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white), onPressed: () => Get.back()),
          flexibleSpace: FlexibleSpaceBar(background: Container(
            decoration: const BoxDecoration(gradient: LinearGradient(colors: [AppColors.primary, AppColors.primaryDark], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: SafeArea(child: Padding(padding: const EdgeInsets.fromLTRB(20, 32, 20, 16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Education', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text('Schools, colleges and universities in KPK', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70)),
            ]))))),
          bottom: PreferredSize(preferredSize: const Size.fromHeight(48), child: Container(
            color: AppColors.primary, padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
            child: Container(height: 38, decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(12)),
              child: TextField(onChanged: (v) => controller.searchQuery.value = v, style: const TextStyle(color: Colors.white, fontSize: 14),
                decoration: const InputDecoration(hintText: 'Search institutes...', hintStyle: TextStyle(color: Colors.white60), prefixIcon: Icon(Icons.search_rounded, color: Colors.white60, size: 20), border: InputBorder.none, contentPadding: EdgeInsets.symmetric(vertical: 10)))))),
        ),
        SliverToBoxAdapter(child: Padding(padding: const EdgeInsets.fromLTRB(16, 12, 16, 4), child: Obx(() => Wrap(spacing: 8, runSpacing: 8, children: controller.types.map((t) { final sel = controller.selectedType.value == t;
          return GestureDetector(onTap: () => controller.selectedType.value = t, child: AnimatedContainer(duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            decoration: BoxDecoration(color: sel ? AppColors.primary : Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: sel ? AppColors.primary : AppColors.border),
              boxShadow: sel ? [BoxShadow(color: AppColors.primary.withOpacity(0.2), blurRadius: 6)] : []),
            child: Text(t, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: sel ? Colors.white : AppColors.textSecondary)))); }).toList())))),
        Obx(() { final list = controller.filteredInstitutes;
          return SliverPadding(padding: const EdgeInsets.fromLTRB(16, 12, 16, 24), sliver: SliverList(delegate: SliverChildBuilderDelegate((context, i) {
            final e = list[i];
            return Container(margin: const EdgeInsets.only(bottom: 14),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.07), blurRadius: 10, offset: const Offset(0, 4))]),
              child: Padding(padding: const EdgeInsets.all(14), child: Row(children: [
                ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.network(e.image, width: 80, height: 80, fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(width: 80, height: 80, decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: BorderRadius.circular(12)),
                    child: const Icon(Icons.school_rounded, color: AppColors.primary, size: 36)))),
                const SizedBox(width: 12),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [Expanded(child: Text(e.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.textPrimary), maxLines: 2, overflow: TextOverflow.ellipsis)),
                    const SizedBox(width: 6), Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: BorderRadius.circular(20)), child: Text(e.type, style: const TextStyle(fontSize: 10, color: AppColors.primary, fontWeight: FontWeight.w600)))]),
                  const SizedBox(height: 3),
                  Text(e.level, style: const TextStyle(fontSize: 12, color: AppColors.accent, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 3),
                  Row(children: [const Icon(Icons.location_on_rounded, size: 12, color: AppColors.textSecondary), const SizedBox(width: 3), Expanded(child: Text(e.address, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary), maxLines: 1, overflow: TextOverflow.ellipsis))]),
                  const SizedBox(height: 3),
                  Row(children: [const Icon(Icons.star_rounded, color: AppColors.gold, size: 13), const SizedBox(width: 3), Text(e.rating.toString(), style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: AppColors.textPrimary))]),
                  const SizedBox(height: 6),
                  Wrap(spacing: 4, runSpacing: 4, children: e.programs.take(3).map((p) => Container(padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2), decoration: BoxDecoration(color: AppColors.background, borderRadius: BorderRadius.circular(6), border: Border.all(color: AppColors.border)),
                    child: Text(p, style: const TextStyle(fontSize: 10, color: AppColors.textSecondary)))).toList()),
                ])),
              ])));
          }, childCount: list.length)));
        }),
      ]),
    );
  }
}
