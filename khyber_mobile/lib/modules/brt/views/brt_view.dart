import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/brt_controller.dart';

class BrtView extends GetView<BrtController> {
  const BrtView({super.key});
  static const _blue = Color(0xFF2980B9);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final hPad = w > 1100 ? (w - 1100) / 2 + 16 : 16.0;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: 140, pinned: true, backgroundColor: _blue,
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white), onPressed: () => Get.back()),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: const BoxDecoration(gradient: LinearGradient(colors: [_blue, Color(0xFF1A5276)], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: SafeArea(child: Padding(padding: const EdgeInsets.fromLTRB(20, 32, 20, 16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('BRT Peshawar', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Poppins')),
                const SizedBox(height: 4),
                const Text('Bus Rapid Transit routes, stops & schedules', style: TextStyle(fontSize: 13, color: Colors.white70, fontFamily: 'Poppins')),
              ]))),
            ),
          ),
        ),
        SliverPadding(padding: EdgeInsets.fromLTRB(hPad, 16, hPad, 24), sliver: Builder(builder: (context) {
          final routes = controller.routes;
          return SliverList(delegate: SliverChildBuilderDelegate((context, i) {
            final route = routes[i];
            final routeColor = Color(int.parse(route.color));
            return Container(margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)]),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(color: routeColor, borderRadius: const BorderRadius.vertical(top: Radius.circular(16))),
                  child: Row(children: [
                    const Icon(Icons.directions_bus_rounded, color: Colors.white, size: 22),
                    const SizedBox(width: 10),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(route.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white, fontFamily: 'Poppins')),
                      Text('${route.from} → ${route.to}', style: const TextStyle(fontSize: 12, color: Colors.white70, fontFamily: 'Poppins')),
                    ])),
                    Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(20)),
                      child: Text('PKR ${route.fare.toInt()}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13, fontFamily: 'Poppins'))),
                  ])),
                Padding(padding: const EdgeInsets.all(14), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Wrap(spacing: 8, children: [
                    _InfoChip(Icons.schedule_rounded, route.frequency, routeColor),
                    _InfoChip(Icons.wb_sunny_outlined, route.firstBus, routeColor),
                    _InfoChip(Icons.nights_stay_outlined, route.lastBus, routeColor),
                  ]),
                  const SizedBox(height: 14),
                  const Text('Stops', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.textPrimary, fontFamily: 'Poppins')),
                  const SizedBox(height: 8),
                  SizedBox(height: 32, child: ListView.separated(
                    scrollDirection: Axis.horizontal, itemCount: route.stops.length,
                    separatorBuilder: (_, __) => Padding(padding: const EdgeInsets.symmetric(horizontal: 4), child: Icon(Icons.arrow_forward_ios_rounded, size: 12, color: routeColor.withValues(alpha: 0.5))),
                    itemBuilder: (_, j) => Center(child: Text(route.stops[j], style: TextStyle(fontSize: 11, color: j == 0 || j == route.stops.length - 1 ? routeColor : AppColors.textSecondary, fontWeight: j == 0 || j == route.stops.length - 1 ? FontWeight.bold : FontWeight.normal, fontFamily: 'Poppins'))),
                  )),
                ])),
              ]));
          }, childCount: routes.length));
        })),
      ]),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon; final String label; final Color color;
  const _InfoChip(this.icon, this.label, this.color);
  @override
  Widget build(BuildContext context) => Container(margin: const EdgeInsets.only(bottom: 6), padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(color: color.withValues(alpha: 0.08), borderRadius: BorderRadius.circular(20)),
    child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(icon, size: 12, color: color), const SizedBox(width: 4), Text(label, style: TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.w600, fontFamily: 'Poppins'))]));
}