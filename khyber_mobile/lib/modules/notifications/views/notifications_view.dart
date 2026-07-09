import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({super.key});

  static const _typeConfig = {
    'order':   {'color': 0xFF1A4D2E, 'icon': Icons.receipt_long_rounded},
    'courier': {'color': 0xFF8E44AD, 'icon': Icons.local_shipping_rounded},
    'wallet':  {'color': 0xFF27AE60, 'icon': Icons.account_balance_wallet_rounded},
    'jobs':    {'color': 0xFF2980B9, 'icon': Icons.work_rounded},
    'nursing': {'color': 0xFFE74C3C, 'icon': Icons.medical_services_rounded},
    'event':   {'color': 0xFFD4A017, 'icon': Icons.event_rounded},
    'system':  {'color': 0xFF1A6B72, 'icon': Icons.info_rounded},
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
            actions: [
              Obx(() => controller.unreadCount > 0
                ? TextButton(
                    onPressed: controller.markAllRead,
                    child: const Text('Mark all read', style: TextStyle(color: Colors.white70, fontFamily: 'Poppins', fontSize: 12)),
                  )
                : const SizedBox.shrink()),
            ],
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
                        Text('Notifications', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Obx(() => Text(
                          controller.unreadCount > 0
                              ? '${controller.unreadCount} unread notifications'
                              : 'All caught up',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Obx(() {
            if (controller.notifications.isEmpty) {
              return const SliverFillRemaining(
                child: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Icon(Icons.notifications_none_rounded, size: 64, color: AppColors.textHint),
                  SizedBox(height: 12),
                  Text('No notifications', style: TextStyle(fontFamily: 'Poppins', fontSize: 15, color: AppColors.textSecondary)),
                ])),
              );
            }
            return SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) {
                    final n = controller.notifications[i];
                    final cfg = _typeConfig[n.type] ?? {'color': 0xFF999999, 'icon': Icons.circle};
                    final color = Color(cfg['color'] as int);
                    final icon  = cfg['icon'] as IconData;
                    final isUnread = !n.isRead;
                    return Dismissible(
                      key: Key(n.id),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20),
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE74C3C).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(Icons.delete_rounded, color: Color(0xFFE74C3C)),
                      ),
                      onDismissed: (_) => controller.delete(n.id),
                      child: GestureDetector(
                        onTap: () => controller.markRead(n.id),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: isUnread ? color.withOpacity(0.04) : AppColors.surface,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: isUnread ? color.withOpacity(0.2) : AppColors.border,
                              width: isUnread ? 1.5 : 1,
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 42, height: 42,
                                decoration: BoxDecoration(color: color.withOpacity(0.12), shape: BoxShape.circle),
                                child: Icon(icon, size: 20, color: color),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(children: [
                                      Expanded(child: Text(n.title, style: TextStyle(
                                        fontFamily: 'Poppins', fontSize: 13,
                                        fontWeight: isUnread ? FontWeight.w700 : FontWeight.w600,
                                        color: AppColors.textPrimary,
                                      ))),
                                      if (isUnread)
                                        Container(
                                          width: 8, height: 8,
                                          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                                        ),
                                    ]),
                                    const SizedBox(height: 4),
                                    Text(n.body, style: const TextStyle(fontFamily: 'Poppins', fontSize: 12, color: AppColors.textSecondary, height: 1.4)),
                                    const SizedBox(height: 6),
                                    Text(_timeLabel(n.time), style: const TextStyle(fontFamily: 'Poppins', fontSize: 10, color: AppColors.textHint)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: controller.notifications.length,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  String _timeLabel(DateTime time) {
    final diff = DateTime.now().difference(time);
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24)   return '${diff.inHours}h ago';
    return '${diff.inDays}d ago';
  }
}