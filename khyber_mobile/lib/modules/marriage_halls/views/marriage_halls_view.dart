import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/marriage_halls_controller.dart';

class MarriageHallsView extends GetView<MarriageHallsController> {
  const MarriageHallsView({super.key});
  static const _gold = Color(0xFFD4A017);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final hPad = w > 1100 ? (w - 1100) / 2 + 16 : 16.0;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: 160, pinned: true, backgroundColor: _gold,
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white), onPressed: () => Get.back()),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: const BoxDecoration(gradient: LinearGradient(colors: [_gold, Color(0xFF8B6914)], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: SafeArea(child: Padding(padding: const EdgeInsets.fromLTRB(20, 32, 20, 16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Marriage Halls', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Poppins')),
                const SizedBox(height: 4),
                const Text('Wedding & event venues across KPK', style: TextStyle(fontSize: 13, color: Colors.white70, fontFamily: 'Poppins')),
              ]))),
            ),
          ),
          bottom: PreferredSize(preferredSize: const Size.fromHeight(96), child: Container(
            color: _gold, padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Column(children: [
              Container(height: 40, decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(12)),
                child: TextField(onChanged: (v) => controller.searchQuery.value = v, style: const TextStyle(color: Colors.white, fontSize: 14),
                  decoration: const InputDecoration(hintText: 'Search hall or area...', hintStyle: TextStyle(color: Colors.white60), prefixIcon: Icon(Icons.search_rounded, color: Colors.white60, size: 20), border: InputBorder.none, contentPadding: EdgeInsets.symmetric(vertical: 10)))),
              const SizedBox(height: 8),
              SizedBox(height: 28, child: Obx(() { final sel = controller.selectedDistrict.value; return ListView.separated(
                scrollDirection: Axis.horizontal, itemCount: controller.districts.length, separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (_, i) { final d = controller.districts[i]; final isSelected = sel == d;
                  return GestureDetector(onTap: () => controller.selectedDistrict.value = d, child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(color: isSelected ? Colors.white : Colors.white.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(20)),
                    child: Text(d, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: isSelected ? _gold : Colors.white)))); },
              );})),
            ]),
          )),
        ),
        Obx(() { final list = controller.filtered;
          if (list.isEmpty) return const SliverFillRemaining(child: Center(child: Text('No results', style: TextStyle(color: AppColors.textSecondary))));
          return SliverPadding(padding: EdgeInsets.fromLTRB(hPad, 12, hPad, 24), sliver: SliverList(delegate: SliverChildBuilderDelegate((context, i) {
            final hall = list[i];
            return Container(margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)]),
              child: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  Container(width: 44, height: 44, decoration: BoxDecoration(color: _gold.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
                    child: const Icon(Icons.villa_rounded, color: _gold, size: 24)),
                  const SizedBox(width: 12),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(hall.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppColors.textPrimary, fontFamily: 'Poppins')),
                    Text('${hall.district} • ${hall.area}', style: const TextStyle(fontSize: 11, color: AppColors.textSecondary, fontFamily: 'Poppins')),
                  ])),
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    Row(children: [const Icon(Icons.star_rounded, color: _gold, size: 14), const SizedBox(width: 2), Text(hall.rating.toStringAsFixed(1), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.textPrimary, fontFamily: 'Poppins'))]),
                    Text('${hall.capacity} guests', style: const TextStyle(fontSize: 11, color: AppColors.textSecondary, fontFamily: 'Poppins')),
                  ]),
                ]),
                const SizedBox(height: 12),
                Row(children: [
                  Expanded(child: _Stat('Capacity', '${hall.capacity} pax', _gold)),
                  const SizedBox(width: 8),
                  Expanded(child: _Stat('Rate/Event', 'PKR ${(hall.ratePerEvent / 1000).toStringAsFixed(0)}K', _gold)),
                ]),
                const SizedBox(height: 10),
                Wrap(spacing: 6, runSpacing: 6, children: hall.amenities.map((a) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(color: _gold.withValues(alpha: 0.08), borderRadius: BorderRadius.circular(20), border: Border.all(color: _gold.withValues(alpha: 0.2))),
                  child: Text(a, style: const TextStyle(fontSize: 10, color: _gold, fontWeight: FontWeight.w600, fontFamily: 'Poppins')))).toList()),
                const SizedBox(height: 10),
                SizedBox(width: double.infinity, child: OutlinedButton.icon(
                  icon: const Icon(Icons.phone_rounded, size: 16),
                  label: Text(hall.phone, style: const TextStyle(fontFamily: 'Poppins', fontSize: 13)),
                  style: OutlinedButton.styleFrom(foregroundColor: _gold, side: BorderSide(color: _gold.withValues(alpha: 0.4)), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), padding: const EdgeInsets.symmetric(vertical: 10)),
                  onPressed: () {})),
              ])));
          }, childCount: list.length)));
        }),
      ]),
    );
  }
}

class _Stat extends StatelessWidget {
  final String label, value; final Color color;
  const _Stat(this.label, this.value, this.color);
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: color.withValues(alpha: 0.06), borderRadius: BorderRadius.circular(10)),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(label, style: TextStyle(fontSize: 10, color: color.withValues(alpha: 0.8), fontFamily: 'Poppins')), const SizedBox(height: 2), Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: color, fontFamily: 'Poppins'))]));
}