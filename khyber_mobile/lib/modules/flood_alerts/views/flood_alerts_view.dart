import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/flood_alerts_controller.dart';

class FloodAlertsView extends GetView<FloodAlertsController> {
  const FloodAlertsView({super.key});
  static const _deepBlue = Color(0xFF2471A3);

  Color _levelColor(String level) {
    if (level.contains('High')) return Colors.red;
    if (level.contains('Medium')) return Colors.orange;
    if (level == 'Normal') return Colors.green;
    return Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final hPad = w > 1100 ? (w - 1100) / 2 + 16 : 16.0;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: 160, pinned: true, backgroundColor: _deepBlue,
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white), onPressed: () => Get.back()),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: const BoxDecoration(gradient: LinearGradient(colors: [_deepBlue, Color(0xFF1A5276)], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: SafeArea(child: Padding(padding: const EdgeInsets.fromLTRB(20, 32, 20, 16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Flood Alerts', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Poppins')),
                const SizedBox(height: 4),
                const Text('River levels, weather stations & PDMA alerts for KPK', style: TextStyle(fontSize: 12, color: Colors.white70, fontFamily: 'Poppins')),
              ]))),
            ),
          ),
        ),
        SliverToBoxAdapter(child: Builder(builder: (context) {
          final criticalCount = controller.criticalCount;
          if (criticalCount == 0) return const SizedBox.shrink();
          return Container(margin: EdgeInsets.fromLTRB(hPad, 12, hPad, 0),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: Colors.red.shade50, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.red.shade200)),
            child: Row(children: [
              const Icon(Icons.warning_amber_rounded, color: Colors.red, size: 22),
              const SizedBox(width: 10),
              Expanded(child: Text('$criticalCount CRITICAL flood alert(s) in KPK. Stay away from riverbanks.', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.red, fontFamily: 'Poppins'))),
            ]));
        })),
        SliverToBoxAdapter(child: Padding(padding: EdgeInsets.fromLTRB(hPad, 16, hPad, 8), child: const Text('River Alerts', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.textPrimary, fontFamily: 'Poppins')))),
        SliverPadding(padding: EdgeInsets.fromLTRB(hPad, 0, hPad, 0), sliver: SliverList(delegate: SliverChildBuilderDelegate((context, i) {
          final alert = controller.alerts[i];
          final lc = _levelColor(alert.level);
          return Container(margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)]),
            child: Padding(padding: const EdgeInsets.all(14), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Container(width: 42, height: 42, decoration: BoxDecoration(color: lc.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(10)),
                  child: Icon(Icons.water_rounded, color: lc, size: 22)),
                const SizedBox(width: 12),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(alert.river, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.textPrimary, fontFamily: 'Poppins')),
                  Text('${alert.district} • ${alert.time}', style: const TextStyle(fontSize: 11, color: AppColors.textSecondary, fontFamily: 'Poppins')),
                ])),
                Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), decoration: BoxDecoration(color: lc.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(20)),
                  child: Text(alert.status, style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: lc, fontFamily: 'Poppins'))),
              ]),
              const SizedBox(height: 8),
              Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: lc.withValues(alpha: 0.07), borderRadius: BorderRadius.circular(8)),
                child: Text(alert.level, style: TextStyle(fontSize: 11, color: lc, fontWeight: FontWeight.w600, fontFamily: 'Poppins'))),
              const SizedBox(height: 8),
              Text(alert.message, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary, fontFamily: 'Poppins', height: 1.5)),
            ])));
        }, childCount: controller.alerts.length))),
        SliverToBoxAdapter(child: Padding(padding: EdgeInsets.fromLTRB(hPad, 20, hPad, 8), child: const Text('Weather Stations', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.textPrimary, fontFamily: 'Poppins')))),
        SliverPadding(padding: EdgeInsets.fromLTRB(hPad, 0, hPad, 24), sliver: SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 1.5),
          delegate: SliverChildBuilderDelegate((context, i) {
            final s = controller.weatherStations[i];
            return Container(decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)]),
              child: Padding(padding: const EdgeInsets.all(12), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  Text(s.condition.split(' ').first, style: const TextStyle(fontSize: 20)),
                  const Spacer(),
                  Text(s.temp, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: AppColors.textPrimary, fontFamily: 'Poppins')),
                ]),
                const Spacer(),
                Text(s.district, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppColors.textPrimary, fontFamily: 'Poppins')),
                Text('Humidity: ${s.humidity} • Wind: ${s.windSpeed}', style: const TextStyle(fontSize: 10, color: AppColors.textSecondary, fontFamily: 'Poppins')),
              ])));
          }, childCount: controller.weatherStations.length))),
      ]),
    );
  }
}