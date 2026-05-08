import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/orders_controller.dart';

class OrdersView extends GetView<OrdersController> {
  const OrdersView({super.key});

  static const _statusConfig = {
    'pending':    {'label': 'Pending',    'color': 0xFFE67E22, 'icon': Icons.hourglass_empty_rounded},
    'preparing':  {'label': 'Preparing',  'color': 0xFF2980B9, 'icon': Icons.restaurant_rounded},
    'in_transit': {'label': 'In Transit', 'color': 0xFF8E44AD, 'icon': Icons.local_shipping_rounded},
    'delivered':  {'label': 'Delivered',  'color': 0xFF27AE60, 'icon': Icons.check_circle_rounded},
    'cancelled':  {'label': 'Cancelled',  'color': 0xFFE74C3C, 'icon': Icons.cancel_rounded},
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 160,
            pinned: true,
            backgroundColor: AppColors.primary,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
              onPressed: () => Get.back(),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.primary, AppColors.primaryDark],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text('My Orders', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text('Track all your orders', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: Container(
                color: AppColors.primary,
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                child: Obx(() => Row(
                  children: [
                    _Tab('All', 0, controller),
                    const SizedBox(width: 8),
                    _Tab('Active', 1, controller),
                    const SizedBox(width: 8),
                    _Tab('Past', 2, controller),
                  ],
                )),
              ),
            ),
          ),
          Obx(() {
            final list = controller.tabOrders;
            if (list.isEmpty) {
              return const SliverFillRemaining(
                child: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Icon(Icons.receipt_long_outlined, size: 64, color: AppColors.textHint),
                  SizedBox(height: 12),
                  Text('No orders here', style: TextStyle(fontFamily: 'Poppins', fontSize: 15, color: AppColors.textSecondary)),
                ])),
              );
            }
            return SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) => _OrderCard(order: list[i], statusConfig: _statusConfig),
                  childCount: list.length,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _Tab extends StatelessWidget {
  final String label;
  final int index;
  final OrdersController controller;
  const _Tab(this.label, this.index, this.controller);

  @override
  Widget build(BuildContext context) {
    final selected = controller.selectedTab.value == index;
    return GestureDetector(
      onTap: () => controller.selectTab(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(label, style: TextStyle(
          fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w600,
          color: selected ? AppColors.primary : Colors.white,
        )),
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  final AppOrder order;
  final Map<String, Map<String, dynamic>> statusConfig;
  const _OrderCard({required this.order, required this.statusConfig});

  String _timeAgo(DateTime date) {
    final diff = DateTime.now().difference(date);
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24)   return '${diff.inHours}h ago';
    return '${diff.inDays}d ago';
  }

  @override
  Widget build(BuildContext context) {
    final cfg = statusConfig[order.status] ?? {'label': 'Unknown', 'color': 0xFF999999, 'icon': Icons.circle};
    final color = Color(cfg['color'] as int);
    final icon  = cfg['icon'] as IconData;
    final label = cfg['label'] as String;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
        boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.08), borderRadius: BorderRadius.circular(6)),
              child: Text(order.module, style: const TextStyle(fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w600, color: AppColors.primary)),
            ),
            const Spacer(),
            Icon(icon, size: 14, color: color),
            const SizedBox(width: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(6)),
              child: Text(label, style: TextStyle(fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w600, color: color)),
            ),
          ]),
          const SizedBox(height: 10),
          Text(order.title, style: const TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
          const SizedBox(height: 3),
          Text(order.subtitle, style: const TextStyle(fontFamily: 'Poppins', fontSize: 12, color: AppColors.textSecondary)),
          const SizedBox(height: 10),
          Row(children: [
            const Icon(Icons.receipt_outlined, size: 14, color: AppColors.textHint),
            const SizedBox(width: 4),
            Text(order.id, style: const TextStyle(fontFamily: 'Poppins', fontSize: 11, color: AppColors.textHint)),
            const Spacer(),
            Text(_timeAgo(order.date), style: const TextStyle(fontFamily: 'Poppins', fontSize: 11, color: AppColors.textHint)),
            const SizedBox(width: 12),
            Text('PKR ${order.amount.toStringAsFixed(0)}',
              style: const TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
          ]),
        ],
      ),
    );
  }
}
