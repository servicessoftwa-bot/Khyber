import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/gandhara_controller.dart';

class GandharaView extends GetView<GandharaController> {
  const GandharaView({super.key});
  static const _golden = Color(0xFF8E6B00);

  IconData _typeIcon(String type) {
    switch (type) {
      case 'Museum': return Icons.museum_rounded;
      case 'Stupa': return Icons.account_balance_rounded;
      case 'Monastery': return Icons.temple_buddhist_rounded;
      case 'Fort': return Icons.castle_rounded;
      default: return Icons.location_city_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final hPad = w > 1100 ? (w - 1100) / 2 + 16 : 16.0;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: 160, pinned: true, backgroundColor: _golden,
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white), onPressed: () => Get.back()),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: const BoxDecoration(gradient: LinearGradient(colors: [_golden, Color(0xFF5A4300)], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: SafeArea(child: Padding(padding: const EdgeInsets.fromLTRB(20, 32, 20, 16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Gandhara Heritage', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Poppins')),
                const SizedBox(height: 4),
                const Text('Ancient Buddhist sites, museums & archaeological wonders', style: TextStyle(fontSize: 12, color: Colors.white70, fontFamily: 'Poppins')),
              ]))),
            ),
          ),
          bottom: PreferredSize(preferredSize: const Size.fromHeight(96), child: Container(
            color: _golden, padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Column(children: [
              Container(height: 40, decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(12)),
                child: TextField(onChanged: (v) => controller.searchQuery.value = v, style: const TextStyle(color: Colors.white, fontSize: 14),
                  decoration: const InputDecoration(hintText: 'Search site or district...', hintStyle: TextStyle(color: Colors.white60), prefixIcon: Icon(Icons.search_rounded, color: Colors.white60, size: 20), border: InputBorder.none, contentPadding: EdgeInsets.symmetric(vertical: 10)))),
              const SizedBox(height: 8),
              SizedBox(height: 28, child: Obx(() { final sel = controller.selectedType.value; return ListView.separated(
                scrollDirection: Axis.horizontal, itemCount: controller.types.length, separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (_, i) { final t = controller.types[i]; final isSelected = sel == t;
                  return GestureDetector(onTap: () => controller.selectedType.value = t, child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(color: isSelected ? Colors.white : Colors.white.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(20)),
                    child: Text(t, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: isSelected ? _golden : Colors.white)))); },
              );})),
            ]),
          )),
        ),
        Obx(() { final list = controller.filtered;
          if (list.isEmpty) return const SliverFillRemaining(child: Center(child: Text('No results', style: TextStyle(color: AppColors.textSecondary))));
          return SliverPadding(padding: EdgeInsets.fromLTRB(hPad, 12, hPad, 24), sliver: SliverList(delegate: SliverChildBuilderDelegate((context, i) {
            final site = list[i];
            return Container(margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)]),
              child: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(width: 52, height: 52, decoration: BoxDecoration(color: _golden.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(14)),
                    child: Icon(_typeIcon(site.type), color: _golden, size: 26)),
                  const SizedBox(width: 12),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row(children: [
                      Expanded(child: Text(site.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.textPrimary, fontFamily: 'Poppins'))),
                      if (site.isUnescoListed) Container(padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2), decoration: BoxDecoration(color: Colors.blue.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)),
                        child: const Text('UNESCO', style: TextStyle(fontSize: 9, color: Colors.blue, fontWeight: FontWeight.bold, fontFamily: 'Poppins'))),
                    ]),
                    Text('${site.district} • ${site.period}', style: const TextStyle(fontSize: 11, color: AppColors.textSecondary, fontFamily: 'Poppins')),
                    const SizedBox(height: 4),
                    Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: _golden.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(20)),
                      child: Text(site.type, style: const TextStyle(fontSize: 10, color: _golden, fontWeight: FontWeight.w600, fontFamily: 'Poppins'))),
                  ])),
                ]),
                const SizedBox(height: 12),
                Text(site.description, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary, fontFamily: 'Poppins', height: 1.5)),
                const SizedBox(height: 10),
                Row(children: [
                  Icon(Icons.access_time_rounded, size: 14, color: _golden),
                  const SizedBox(width: 4),
                  Text(site.timings, style: const TextStyle(fontSize: 12, color: AppColors.textPrimary, fontFamily: 'Poppins')),
                  const Spacer(),
                  Icon(Icons.confirmation_number_outlined, size: 14, color: _golden),
                  const SizedBox(width: 4),
                  Text(site.entryFee == 'Free' ? 'Free Entry' : site.entryFee, style: TextStyle(fontSize: 12, color: site.entryFee == 'Free' ? Colors.green : AppColors.textPrimary, fontWeight: site.entryFee == 'Free' ? FontWeight.bold : FontWeight.normal, fontFamily: 'Poppins')),
                ]),
              ])));
          }, childCount: list.length)));
        }),
      ]),
    );
  }
}