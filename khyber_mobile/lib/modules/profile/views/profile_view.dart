import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/profile_controller.dart';
import '../../orders/views/orders_view.dart';
import '../../wallet/views/wallet_view.dart';
import '../../notifications/views/notifications_view.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            backgroundColor: AppColors.primary,
            automaticallyImplyLeading: false,
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
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 32),
                        Container(
                          width: 80, height: 80,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2.5),
                          ),
                          child: const Icon(Icons.person_rounded, size: 44, color: Colors.white),
                        ),
                        const SizedBox(height: 12),
                        Obx(() => Text(
                          controller.userName.value.isEmpty ? 'KPK User' : controller.userName.value,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Poppins'),
                        )),
                        Obx(() => Text(
                          controller.userPhone.value.isEmpty ? 'Guest' : controller.userPhone.value,
                          style: TextStyle(fontSize: 13, color: Colors.white.withOpacity(0.8), fontFamily: 'Poppins'),
                        )),
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
                // Stats row
                Row(children: [
                  _StatCard('8', 'Orders', Icons.receipt_long_rounded),
                  const SizedBox(width: 10),
                  _StatCard('PKR 2,450', 'Wallet', Icons.account_balance_wallet_rounded),
                  const SizedBox(width: 10),
                  _StatCard('4.8 ★', 'Rating', Icons.star_rounded),
                ]),
                const SizedBox(height: 20),

                // Quick links
                _MenuSection('My Activity', [
                  _MenuItem(Icons.receipt_long_rounded, 'My Orders', 'View order history', AppColors.primary, () => Get.to(() => const OrdersView())),
                  _MenuItem(Icons.account_balance_wallet_rounded, 'My Wallet', 'Balance & transactions', const Color(0xFF27AE60), () => Get.to(() => const WalletView())),
                  _MenuItem(Icons.notifications_rounded, 'Notifications', 'Alerts & updates', const Color(0xFFD4A017), () => Get.to(() => const NotificationsView())),
                ]),
                const SizedBox(height: 16),

                _MenuSection('Settings', [
                  _MenuItem(Icons.person_outline_rounded, 'Edit Profile', 'Update your information', AppColors.primary, () {}),
                  _MenuItem(Icons.location_on_outlined, 'Saved Addresses', 'Home, office & more', const Color(0xFF8E44AD), () {}),
                  _MenuItem(Icons.lock_outline_rounded, 'Change Password', 'Update your password', const Color(0xFFE67E22), () {}),
                  _MenuItem(Icons.language_rounded, 'Language', 'English / اردو', const Color(0xFF16A085), () {}),
                ]),
                const SizedBox(height: 16),

                _MenuSection('Support', [
                  _MenuItem(Icons.help_outline_rounded, 'Help Center', 'FAQs and guides', const Color(0xFF2980B9), () {}),
                  _MenuItem(Icons.chat_bubble_outline_rounded, 'Contact Us', 'Chat with support', const Color(0xFF16A085), () {}),
                  _MenuItem(Icons.star_outline_rounded, 'Rate This App', 'Share your feedback', const Color(0xFFD4A017), () {}),
                  _MenuItem(Icons.info_outline_rounded, 'About Khyber App', 'Version 1.0.0', AppColors.textSecondary, () {}),
                ]),
                const SizedBox(height: 16),

                // Logout
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: ListTile(
                    leading: Container(
                      width: 38, height: 38,
                      decoration: BoxDecoration(color: const Color(0xFFE74C3C).withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
                      child: const Icon(Icons.logout_rounded, size: 20, color: Color(0xFFE74C3C)),
                    ),
                    title: const Text('Logout', style: TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFFE74C3C))),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Color(0xFFE74C3C)),
                    onTap: controller.logout,
                  ),
                ),
                const SizedBox(height: 32),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value, label;
  final IconData icon;
  const _StatCard(this.value, this.label, this.icon);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(children: [
          Icon(icon, size: 22, color: AppColors.primary),
          const SizedBox(height: 6),
          Text(value, style: const TextStyle(fontFamily: 'Poppins', fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
          Text(label, style: const TextStyle(fontFamily: 'Poppins', fontSize: 10, color: AppColors.textSecondary)),
        ]),
      ),
    );
  }
}

class _MenuSection extends StatelessWidget {
  final String title;
  final List<_MenuItem> items;
  const _MenuSection(this.title, this.items);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8, left: 2),
          child: Text(title, style: const TextStyle(fontFamily: 'Poppins', fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.textSecondary)),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            children: List.generate(items.length, (i) => Column(children: [
              items[i],
              if (i < items.length - 1) const Divider(height: 1, indent: 56, color: AppColors.border),
            ])),
          ),
        ),
      ],
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;
  final Color color;
  final VoidCallback onTap;
  const _MenuItem(this.icon, this.title, this.subtitle, this.color, this.onTap);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 38, height: 38,
        decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
        child: Icon(icon, size: 20, color: color),
      ),
      title: Text(title, style: const TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
      subtitle: Text(subtitle, style: const TextStyle(fontFamily: 'Poppins', fontSize: 11, color: AppColors.textSecondary)),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: AppColors.textHint),
      onTap: onTap,
    );
  }
}
