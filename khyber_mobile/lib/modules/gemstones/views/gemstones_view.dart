import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/gemstones_controller.dart';

class GemstonesView extends GetView<GemstonesController> {
  const GemstonesView({super.key});
  static const _teal = Color(0xFF1A6B72);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final hPad = w > 1100 ? (w - 1100) / 2 + 16 : 16.0;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: 160, pinned: true, backgroundColor: _teal,
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white), onPressed: () => Get.back()),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: const BoxDecoration(gradient: LinearGradient(colors: [_teal, Color(0xFF0D3B42)], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: SafeArea(child: Padding(padding: const EdgeInsets.fromLTRB(20, 32, 20, 16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Gemstones', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Poppins')),
                const SizedBox(height: 4),
                const Text('Precious & semi-precious gems from KPK mines', style: TextStyle(fontSize: 13, color: Colors.white70, fontFamily: 'Poppins')),
              ]))),
            ),
          ),
          bottom: PreferredSize(preferredSize: const Size.fromHeight(96), child: Container(
            color: _teal, padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Column(children: [
              Container(height: 40, decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(12)),
                child: TextField(onChanged: (v) => controller.searchQuery.value = v, style: const TextStyle(color: Colors.white, fontSize: 14),
                  decoration: const InputDecoration(hintText: 'Search gemstone or origin...', hintStyle: TextStyle(color: Colors.white60), prefixIcon: Icon(Icons.search_rounded, color: Colors.white60, size: 20), border: InputBorder.none, contentPadding: EdgeInsets.symmetric(vertical: 10)))),
              const SizedBox(height: 8),
              SizedBox(height: 28, child: Obx(() { final sel = controller.selectedType.value; return ListView.separated(
                scrollDirection: Axis.horizontal, itemCount: controller.types.length, separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (_, i) { final t = controller.types[i]; final isSelected = sel == t;
                  return GestureDetector(onTap: () => controller.selectedType.value = t, child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(color: isSelected ? Colors.white : Colors.white.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(20)),
                    child: Text(t, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: isSelected ? _teal : Colors.white)))); },
              );})),
            ]),
          )),
        ),
        Obx(() { final list = controller.filtered;
          if (list.isEmpty) return const SliverFillRemaining(child: Center(child: Text('No results', style: TextStyle(color: AppColors.textSecondary))));
          return SliverPadding(padding: EdgeInsets.fromLTRB(hPad, 12, hPad, 24), sliver: SliverList(delegate: SliverChildBuilderDelegate((context, i) {
            final gem = list[i];
            return Container(margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)]),
              child: Padding(padding: const EdgeInsets.all(14), child: Row(children: [
                Container(width: 56, height: 56, decoration: BoxDecoration(color: _teal.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(14), border: Border.all(color: _teal.withValues(alpha: 0.2))),
                  child: Center(child: Text(gem.emoji, style: const TextStyle(fontSize: 28)))),
                const SizedBox(width: 12),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(gem.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.textPrimary, fontFamily: 'Poppins')),
                  Text('${gem.type} • ${gem.origin}', style: const TextStyle(fontSize: 11, color: AppColors.textSecondary, fontFamily: 'Poppins')),
                  Text(gem.seller, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary, fontFamily: 'Poppins')),
                  const SizedBox(height: 6),
                  Wrap(spacing: 6, children: [
                    _GemTag('Grade: ${gem.grade}', _teal),
                    _GemTag('Clarity: ${gem.clarity}', _teal),
                    _GemTag(gem.color, _teal),
                  ]),
                ])),
                const SizedBox(width: 8),
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  const Text('PKR', style: TextStyle(fontSize: 10, color: _teal, fontFamily: 'Poppins')),
                  Text('${gem.pricePerCarat.toInt()}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: _teal, fontFamily: 'Poppins')),
                  const Text('/carat', style: TextStyle(fontSize: 10, color: _teal, fontFamily: 'Poppins')),
                ]),
              ])));
          }, childCount: list.length)));
        }),
      ]),
    );
  }
}

class _GemTag extends StatelessWidget {
  final String label; final Color color;
  const _GemTag(this.label, this.color);
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
    decoration: BoxDecoration(color: color.withValues(alpha: 0.08), borderRadius: BorderRadius.circular(20)),
    child: Text(label, style: TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.w600, fontFamily: 'Poppins')));
}