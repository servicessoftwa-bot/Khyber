import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/sports_controller.dart';

class SportsView extends GetView<SportsController> {
  const SportsView({super.key});
  static const _green = Color(0xFF16A085);

  IconData _sportIcon(String sport) {
    switch (sport) {
      case 'Cricket': return Icons.sports_cricket_rounded;
      case 'Football': return Icons.sports_soccer_rounded;
      case 'Hockey': return Icons.sports_hockey_rounded;
      case 'Wrestling': return Icons.sports_martial_arts_rounded;
      case 'Polo': return Icons.sports_rounded;
      case 'Athletics': return Icons.directions_run_rounded;
      case 'Kabaddi': return Icons.sports_kabaddi_rounded;
      case 'Skiing': return Icons.downhill_skiing_rounded;
      default: return Icons.sports_rounded;
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
          expandedHeight: 160, pinned: true, backgroundColor: _green,
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white), onPressed: () => Get.back()),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: const BoxDecoration(gradient: LinearGradient(colors: [_green, Color(0xFF0E6655)], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: SafeArea(child: Padding(padding: const EdgeInsets.fromLTRB(20, 32, 20, 16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('KPK Sports', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Poppins')),
                const SizedBox(height: 4),
                const Text('Teams, events & tournaments across KPK', style: TextStyle(fontSize: 13, color: Colors.white70, fontFamily: 'Poppins')),
              ]))),
            ),
          ),
        ),
        SliverToBoxAdapter(child: Padding(padding: EdgeInsets.fromLTRB(hPad, 16, hPad, 0), child: const Text('Teams', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.textPrimary, fontFamily: 'Poppins')))),
        SliverPadding(padding: EdgeInsets.fromLTRB(hPad, 10, hPad, 0), sliver: Builder(builder: (context) {
          final teams = controller.teams;
          return SliverList(delegate: SliverChildBuilderDelegate((context, i) {
            final team = teams[i];
            return Container(margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)]),
              child: Padding(padding: const EdgeInsets.all(14), child: Row(children: [
                Container(width: 50, height: 50, decoration: BoxDecoration(color: _green.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
                  child: Icon(_sportIcon(team.sport), color: _green, size: 26)),
                const SizedBox(width: 12),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(team.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.textPrimary, fontFamily: 'Poppins')),
                  Text('${team.sport} • ${team.district}', style: const TextStyle(fontSize: 11, color: AppColors.textSecondary, fontFamily: 'Poppins')),
                  Text(team.league, style: const TextStyle(fontSize: 11, color: _green, fontWeight: FontWeight.w600, fontFamily: 'Poppins')),
                ])),
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Row(children: [
                    _StatBadge('W', '${team.wins}', Colors.green),
                    const SizedBox(width: 4),
                    _StatBadge('L', '${team.losses}', Colors.red),
                  ]),
                  const SizedBox(height: 4),
                  Text('Pts: ${team.points}', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: _green, fontFamily: 'Poppins')),
                ]),
              ])));
          }, childCount: teams.length));
        })),
        SliverToBoxAdapter(child: Padding(padding: EdgeInsets.fromLTRB(hPad, 20, hPad, 0), child: const Text('Upcoming Events', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.textPrimary, fontFamily: 'Poppins')))),
        SliverPadding(padding: EdgeInsets.fromLTRB(hPad, 10, hPad, 24), sliver: Builder(builder: (context) {
          final events = controller.events;
          return SliverList(delegate: SliverChildBuilderDelegate((context, i) {
            final e = events[i];
            return Container(margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)]),
              child: Padding(padding: const EdgeInsets.all(14), child: Row(children: [
                Container(width: 46, height: 46, decoration: BoxDecoration(color: _green.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
                  child: Icon(_sportIcon(e.sport), color: _green, size: 24)),
                const SizedBox(width: 12),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(e.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.textPrimary, fontFamily: 'Poppins')),
                  Text('${e.venue} • ${e.district}', style: const TextStyle(fontSize: 11, color: AppColors.textSecondary, fontFamily: 'Poppins')),
                  Text('${e.date} • ${e.time}', style: const TextStyle(fontSize: 11, color: _green, fontWeight: FontWeight.w600, fontFamily: 'Poppins')),
                ])),
              ])));
          }, childCount: events.length));
        })),
      ]),
    );
  }
}

class _StatBadge extends StatelessWidget {
  final String label, value; final Color color;
  const _StatBadge(this.label, this.value, this.color);
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
    decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)),
    child: Text('$label:$value', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: color, fontFamily: 'Poppins')));
}