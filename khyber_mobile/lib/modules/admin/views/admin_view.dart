import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/admin_controller.dart';

class AdminView extends GetView<AdminController> {
  const AdminView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 160,
            pinned: true,
            backgroundColor: AppColors.primaryDark,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
              onPressed: () => Get.back(),
            ),
            actions: [
              IconButton(icon: const Icon(Icons.notifications_outlined, color: Colors.white), onPressed: () {}),
              IconButton(icon: const Icon(Icons.settings_outlined, color: Colors.white), onPressed: () {}),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF0D3B42), AppColors.primaryDark],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 24),
                        const Text('Admin Dashboard',
                          style: TextStyle(fontFamily: 'Poppins', fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                        const SizedBox(height: 4),
                        Text('Khyber App — KPK Province',
                          style: TextStyle(fontFamily: 'Poppins', fontSize: 13, color: Colors.white.withOpacity(0.75))),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Stats grid
                const _SectionTitle('Overview'),
                const SizedBox(height: 10),
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.6,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: controller.stats.map((s) => _StatCard(stat: s)).toList(),
                ),
                const SizedBox(height: 20),

                // Quick actions
                const _SectionTitle('Quick Actions'),
                const SizedBox(height: 10),
                Row(children: [
                  _ActionBtn(Icons.people_rounded, 'Users', const Color(0xFF1A6B72)),
                  const SizedBox(width: 10),
                  _ActionBtn(Icons.receipt_long_rounded, 'Orders', AppColors.primary),
                  const SizedBox(width: 10),
                  _ActionBtn(Icons.store_rounded, 'Vendors', const Color(0xFF8E44AD)),
                  const SizedBox(width: 10),
                  _ActionBtn(Icons.bar_chart_rounded, 'Reports', const Color(0xFF27AE60)),
                ]),
                const SizedBox(height: 20),

                // Module status
                const _SectionTitle('Module Status'),
                const SizedBox(height: 10),
                ...[
                  _ModuleRow('Food & Restaurants', '24 vendors', true),
                  _ModuleRow('Grocery Stores', '5 stores', true),
                  _ModuleRow('Pharmacy', '4 pharmacies', true),
                  _ModuleRow('Transport', 'Live tracking', true),
                  _ModuleRow('Courier Services', '4 providers', true),
                  _ModuleRow('Jobs Portal', '8 listings', true),
                  _ModuleRow('Hotels & Stays', '6 hotels', true),
                  _ModuleRow('Home Nursing', '4 nurses', true),
                  _ModuleRow('Logistics', '5 freight services', true),
                  _ModuleRow('Tourism', '8 spots', true),
                  _ModuleRow('Crafts', '8 products', true),
                ].map((w) => w),
                const SizedBox(height: 20),

                // Recent activity
                Row(children: [
                  const Expanded(child: _SectionTitle('Recent Activity')),
                  TextButton(onPressed: () {}, child: const Text('See All', style: TextStyle(fontFamily: 'Poppins', fontSize: 12, color: AppColors.primary))),
                ]),
                const SizedBox(height: 8),
                Obx(() => Column(
                  children: controller.recentActivity.map((a) => _ActivityTile(activity: a)).toList(),
                )),
                const SizedBox(height: 24),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) => Text(text,
    style: const TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.textPrimary));
}

class _StatCard extends StatelessWidget {
  final AdminStat stat;
  const _StatCard({required this.stat});

  @override
  Widget build(BuildContext context) {
    final color = Color(stat.colorValue);
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withOpacity(0.15)),
        boxShadow: [BoxShadow(color: color.withOpacity(0.07), blurRadius: 10, offset: const Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Container(
              width: 32, height: 32,
              decoration: BoxDecoration(color: color.withOpacity(0.12), borderRadius: BorderRadius.circular(8)),
              child: Icon(Icons.trending_up_rounded, size: 16, color: color),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: stat.isUp ? const Color(0xFF27AE60).withOpacity(0.1) : const Color(0xFFE74C3C).withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Icon(stat.isUp ? Icons.arrow_upward_rounded : Icons.arrow_downward_rounded,
                  size: 10, color: stat.isUp ? const Color(0xFF27AE60) : const Color(0xFFE74C3C)),
                Text(stat.change, style: TextStyle(fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w600,
                  color: stat.isUp ? const Color(0xFF27AE60) : const Color(0xFFE74C3C))),
              ]),
            ),
          ]),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(stat.value, style: TextStyle(fontFamily: 'Poppins', fontSize: 20, fontWeight: FontWeight.w800, color: color)),
            Text(stat.label, style: const TextStyle(fontFamily: 'Poppins', fontSize: 11, color: AppColors.textSecondary)),
          ]),
        ],
      ),
    );
  }
}

class _ActionBtn extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  const _ActionBtn(this.icon, this.label, this.color);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.08),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color.withOpacity(0.2)),
          ),
          child: Column(children: [
            Icon(icon, size: 22, color: color),
            const SizedBox(height: 4),
            Text(label, style: TextStyle(fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w600, color: color)),
          ]),
        ),
      ),
    );
  }
}

class _ModuleRow extends StatelessWidget {
  final String name, detail;
  final bool active;
  const _ModuleRow(this.name, this.detail, this.active);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(children: [
        Container(
          width: 8, height: 8,
          decoration: BoxDecoration(
            color: active ? const Color(0xFF27AE60) : const Color(0xFFE74C3C),
            shape: BoxShape.circle),
        ),
        const SizedBox(width: 10),
        Expanded(child: Text(name, style: const TextStyle(fontFamily: 'Poppins', fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textPrimary))),
        Text(detail, style: const TextStyle(fontFamily: 'Poppins', fontSize: 11, color: AppColors.textSecondary)),
      ]),
    );
  }
}

class _ActivityTile extends StatelessWidget {
  final AdminActivity activity;
  const _ActivityTile({required this.activity});

  String _timeAgo(DateTime t) {
    final diff = DateTime.now().difference(t);
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    return '${diff.inDays}d ago';
  }

  IconData get _icon {
    switch (activity.type) {
      case 'user': return Icons.person_add_rounded;
      case 'order': return Icons.receipt_long_rounded;
      case 'vendor': return Icons.store_rounded;
      case 'courier': return Icons.local_shipping_rounded;
      case 'business': return Icons.business_rounded;
      case 'job': return Icons.work_rounded;
      default: return Icons.circle;
    }
  }

  Color get _color {
    switch (activity.type) {
      case 'user': return const Color(0xFF1A6B72);
      case 'order': return AppColors.primary;
      case 'vendor': return const Color(0xFF27AE60);
      case 'courier': return const Color(0xFF8E44AD);
      case 'business': return const Color(0xFF2980B9);
      case 'job': return const Color(0xFFD4A017);
      default: return AppColors.textSecondary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(children: [
        Container(
          width: 38, height: 38,
          decoration: BoxDecoration(color: _color.withOpacity(0.1), shape: BoxShape.circle),
          child: Icon(_icon, size: 18, color: _color),
        ),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(activity.title, style: const TextStyle(fontFamily: 'Poppins', fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
          Text(activity.subtitle, style: const TextStyle(fontFamily: 'Poppins', fontSize: 11, color: AppColors.textSecondary)),
        ])),
        Text(_timeAgo(activity.time), style: const TextStyle(fontFamily: 'Poppins', fontSize: 10, color: AppColors.textHint)),
      ]),
    );
  }
}
