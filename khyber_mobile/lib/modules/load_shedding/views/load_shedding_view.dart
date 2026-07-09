import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/load_shedding_controller.dart';

class LoadSheddingView extends GetView<LoadSheddingController> {
  const LoadSheddingView({super.key});

  static const _orange = Color(0xFFE67E22);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final hPad = w > 1100 ? (w - 1100) / 2 + 16 : 16.0;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: 160, pinned: true, backgroundColor: _orange,
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white), onPressed: () => Get.back()),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: const BoxDecoration(gradient: LinearGradient(colors: [_orange, Color(0xFFD35400)], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: SafeArea(child: Padding(padding: const EdgeInsets.fromLTRB(20, 32, 20, 16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('PESCO Load Shedding', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Poppins')),
                const SizedBox(height: 4),
                const Text('Area-wise schedule — Khyber Pakhtunkhwa', style: TextStyle(fontSize: 13, color: Colors.white70, fontFamily: 'Poppins')),
              ]))),
            ),
          ),
          bottom: PreferredSize(preferredSize: const Size.fromHeight(96), child: Container(
            color: _orange, padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Column(children: [
              Container(height: 40, decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(12)),
                child: TextField(onChanged: (v) => controller.searchQuery.value = v, style: const TextStyle(color: Colors.white, fontSize: 14),
                  decoration: const InputDecoration(hintText: 'Search area or feeder...', hintStyle: TextStyle(color: Colors.white60), prefixIcon: Icon(Icons.search_rounded, color: Colors.white60, size: 20), border: InputBorder.none, contentPadding: EdgeInsets.symmetric(vertical: 10)))),
              const SizedBox(height: 8),
              SizedBox(height: 28, child: Obx(() { final sel = controller.selectedDistrict.value; return ListView.separated(
                scrollDirection: Axis.horizontal, itemCount: controller.districts.length, separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (_, i) { final d = controller.districts[i]; final isSelected = sel == d;
                  return GestureDetector(onTap: () => controller.selectedDistrict.value = d, child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(color: isSelected ? Colors.white : Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(20)),
                    child: Text(d, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: isSelected ? _orange : Colors.white)))); },
              );})),
            ]),
          )),
        ),
        SliverToBoxAdapter(child: Padding(
          padding: EdgeInsets.fromLTRB(hPad, 12, hPad, 4),
          child: Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: _orange.withOpacity(0.08), borderRadius: BorderRadius.circular(12), border: Border.all(color: _orange.withOpacity(0.25))),
            child: Row(children: [
              const Icon(Icons.info_outline_rounded, color: _orange, size: 18),
              const SizedBox(width: 10),
              const Expanded(child: Text('Schedules are indicative and may change. Check PESCO official site for updates.', style: TextStyle(fontSize: 12, color: _orange, fontFamily: 'Poppins'))),
            ])),
        )),
        Obx(() { final list = controller.filtered;
          if (list.isEmpty) return const SliverFillRemaining(child: Center(child: Text('No areas found', style: TextStyle(color: AppColors.textSecondary, fontFamily: 'Poppins'))));
          return SliverPadding(
            padding: EdgeInsets.fromLTRB(hPad, 8, hPad, 24),
            sliver: SliverList(delegate: SliverChildBuilderDelegate((context, i) {
              final a = list[i];
              final hours = a.hoursPerDay;
              final Color statusColor = hours <= 4 ? const Color(0xFF27AE60) : hours <= 8 ? _orange : const Color(0xFFE74C3C);
              return Container(margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 3))]),
                child: Padding(padding: const EdgeInsets.all(14), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    Container(width: 40, height: 40, decoration: BoxDecoration(color: statusColor.withOpacity(0.12), shape: BoxShape.circle),
                      child: Icon(Icons.electric_bolt_rounded, color: statusColor, size: 20)),
                    const SizedBox(width: 12),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(a.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.textPrimary, fontFamily: 'Poppins')),
                      Text('${a.district} • ${a.feeder}', style: const TextStyle(fontSize: 11, color: AppColors.textSecondary, fontFamily: 'Poppins')),
                    ])),
                    Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(color: statusColor.withOpacity(0.12), borderRadius: BorderRadius.circular(20)),
                      child: Text('$hours hrs/day', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: statusColor, fontFamily: 'Poppins'))),
                  ]),
                  const SizedBox(height: 10),
                  const Text('Schedule:', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.textSecondary, fontFamily: 'Poppins')),
                  const SizedBox(height: 6),
                  Wrap(spacing: 8, runSpacing: 6, children: a.schedule.map((s) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(color: _orange.withOpacity(0.08), borderRadius: BorderRadius.circular(8), border: Border.all(color: _orange.withOpacity(0.3))),
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      const Icon(Icons.access_time_rounded, size: 12, color: _orange),
                      const SizedBox(width: 4),
                      Text(s, style: const TextStyle(fontSize: 12, color: _orange, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                    ]),
                  )).toList()),
                ])));
            }, childCount: list.length)),
          );
        }),
      ]),
    );
  }
}