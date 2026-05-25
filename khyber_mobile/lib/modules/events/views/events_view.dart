import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/events_controller.dart';

class EventsView extends GetView<EventsController> {
  const EventsView({super.key});
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final hPad = w > 1100 ? (w - 1100) / 2 + 16 : 16.0;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(slivers: [
        SliverAppBar(expandedHeight: 160, pinned: true, backgroundColor: AppColors.primary,
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white), onPressed: () => Get.back()),
          flexibleSpace: FlexibleSpaceBar(background: Container(
            decoration: const BoxDecoration(gradient: LinearGradient(colors: [AppColors.primary, AppColors.primaryDark], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: SafeArea(child: Padding(padding: const EdgeInsets.fromLTRB(20, 32, 20, 16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Events', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text('Upcoming events across KPK', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70)),
            ]))))),
          bottom: PreferredSize(preferredSize: const Size.fromHeight(44), child: Container(
            color: AppColors.primary, padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
            child: SizedBox(height: 32, child: Obx(() {
              final cats = controller.categories.toList();
              final sel = controller.selectedCategory.value;
              return ListView.separated(
                scrollDirection: Axis.horizontal, itemCount: cats.length, separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (_, i) { final cat = cats[i]; final isSelected = sel == cat;
                  return GestureDetector(onTap: () => controller.selectedCategory.value = cat, child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(color: isSelected ? Colors.white : Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(20)),
                    child: Text(cat, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: isSelected ? AppColors.primary : Colors.white)))); },
              );
            })),
          )),
        ),
        Obx(() { final list = controller.filteredEvents;
          return SliverPadding(padding: EdgeInsets.fromLTRB(hPad, 12, hPad, 24), sliver: SliverList(delegate: SliverChildBuilderDelegate((context, i) {
            final ev = list[i];
            return Container(margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.07), blurRadius: 10, offset: const Offset(0, 4))]),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Stack(children: [
                  ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.network(ev.image, height: 160, width: double.infinity, fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(height: 160, color: AppColors.primaryLight, child: const Icon(Icons.event_rounded, size: 50, color: AppColors.primary)))),
                  Positioned(top: 10, left: 10, child: Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.85), borderRadius: BorderRadius.circular(20)),
                    child: Text(ev.category, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600)))),
                  Positioned(top: 10, right: 10, child: Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: ev.isFree ? Colors.green : AppColors.gold, borderRadius: BorderRadius.circular(20)),
                    child: Text(ev.isFree ? 'Free' : 'PKR ${ev.price.toInt()}', style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)))),
                ]),
                Padding(padding: const EdgeInsets.all(14), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(ev.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.textPrimary)),
                  const SizedBox(height: 6),
                  Row(children: [const Icon(Icons.calendar_today_rounded, size: 13, color: AppColors.primary), const SizedBox(width: 5), Text(ev.date, style: const TextStyle(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.w600)), const SizedBox(width: 12), const Icon(Icons.access_time_rounded, size: 13, color: AppColors.textSecondary), const SizedBox(width: 5), Text(ev.time, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary))]),
                  const SizedBox(height: 4),
                  Row(children: [const Icon(Icons.location_on_rounded, size: 13, color: AppColors.textSecondary), const SizedBox(width: 5), Text('${ev.venue}, ${ev.district}', style: const TextStyle(fontSize: 12, color: AppColors.textSecondary))]),
                  const SizedBox(height: 8),
                  Text(ev.description, style: const TextStyle(fontSize: 13, color: AppColors.textSecondary, height: 1.4), maxLines: 2, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 12),
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), padding: const EdgeInsets.symmetric(vertical: 10)),
                    child: Text(ev.isFree ? 'Register Free' : 'Get Tickets', style: const TextStyle(fontWeight: FontWeight.bold)))),
                ])),
              ]));
          }, childCount: list.length)));
        }),
      ]),
    );
  }
}