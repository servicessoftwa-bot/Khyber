import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/wallet_controller.dart';

class WalletView extends GetView<WalletController> {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 240,
            pinned: true,
            backgroundColor: const Color(0xFF27AE60),
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF27AE60), Color(0xFF1E8449)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 28),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Text('KPK Wallet', style: TextStyle(fontFamily: 'Poppins', fontSize: 14, color: Colors.white.withOpacity(0.85))),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(20)),
                            child: const Row(mainAxisSize: MainAxisSize.min, children: [
                              Icon(Icons.shield_rounded, size: 12, color: Colors.white),
                              SizedBox(width: 4),
                              Text('Secured', style: TextStyle(fontFamily: 'Poppins', fontSize: 11, color: Colors.white)),
                            ]),
                          ),
                        ]),
                        const SizedBox(height: 12),
                        Obx(() => Text('PKR ${controller.balance.value.toStringAsFixed(0)}',
                          style: const TextStyle(fontFamily: 'Poppins', fontSize: 36, fontWeight: FontWeight.w800, color: Colors.white))),
                        const Text('Available Balance', style: TextStyle(fontFamily: 'Poppins', fontSize: 12, color: Colors.white70)),
                        const SizedBox(height: 16),
                        Row(children: [
                          Expanded(child: Obx(() => _StatPill('Spent', 'PKR ${controller.totalSpent.toStringAsFixed(0)}', Icons.arrow_upward_rounded))),
                          const SizedBox(width: 10),
                          Expanded(child: Obx(() => _StatPill('Added', 'PKR ${controller.totalAdded.toStringAsFixed(0)}', Icons.arrow_downward_rounded))),
                        ]),
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
                // Quick top-up buttons
                const Text('Quick Top Up', style: TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                const SizedBox(height: 10),
                Row(children: [500, 1000, 2000, 5000].map((amount) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Obx(() => ElevatedButton(
                      onPressed: controller.isAddingFunds.value ? null : () => controller.addFunds(amount.toDouble()),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF27AE60), foregroundColor: Colors.white,
                        disabledBackgroundColor: AppColors.border,
                        elevation: 0, padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        textStyle: const TextStyle(fontFamily: 'Poppins', fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                      child: controller.isAddingFunds.value
                          ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                          : Text('+$amount'),
                    )),
                  ),
                )).toList()),
                const SizedBox(height: 20),

                // Payment methods banner
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xFF27AE60).withOpacity(0.07),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF27AE60).withOpacity(0.2)),
                  ),
                  child: Row(children: [
                    const Icon(Icons.payments_rounded, color: Color(0xFF27AE60), size: 20),
                    const SizedBox(width: 10),
                    const Expanded(child: Text('Accepted: EasyPaisa, JazzCash, Bank Transfer, Debit Card',
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 12, color: Color(0xFF27AE60), fontWeight: FontWeight.w500))),
                  ]),
                ),
                const SizedBox(height: 20),

                // Transactions
                Row(children: [
                  const Expanded(child: Text('Transaction History', style: TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.textPrimary))),
                  TextButton(onPressed: () {}, child: const Text('See All', style: TextStyle(fontFamily: 'Poppins', fontSize: 12, color: Color(0xFF27AE60)))),
                ]),
                const SizedBox(height: 8),
                Obx(() => Column(
                  children: controller.transactions.map((t) => _TransactionTile(tx: t)).toList(),
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

class _StatPill extends StatelessWidget {
  final String label, value;
  final IconData icon;
  const _StatPill(this.label, this.value, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(10)),
      child: Row(children: [
        Icon(icon, size: 14, color: Colors.white70),
        const SizedBox(width: 6),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(label, style: TextStyle(fontFamily: 'Poppins', fontSize: 10, color: Colors.white.withOpacity(0.8))),
          Text(value, style: const TextStyle(fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white)),
        ]),
      ]),
    );
  }
}

class _TransactionTile extends StatelessWidget {
  final WalletTransaction tx;
  const _TransactionTile({required this.tx});

  String _timeLabel(DateTime date) {
    final diff = DateTime.now().difference(date);
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24)   return '${diff.inHours}h ago';
    return '${diff.inDays}d ago';
  }

  @override
  Widget build(BuildContext context) {
    final isCredit = tx.type == 'credit';
    final color = isCredit ? const Color(0xFF27AE60) : AppColors.primary;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(children: [
        Container(
          width: 40, height: 40,
          decoration: BoxDecoration(color: color.withOpacity(0.1), shape: BoxShape.circle),
          child: Icon(isCredit ? Icons.add_rounded : Icons.remove_rounded, color: color, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(tx.title, style: const TextStyle(fontFamily: 'Poppins', fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
          Text(tx.subtitle, style: const TextStyle(fontFamily: 'Poppins', fontSize: 11, color: AppColors.textSecondary)),
        ])),
        Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Text('${isCredit ? '+' : '-'} PKR ${tx.amount.toStringAsFixed(0)}',
            style: TextStyle(fontFamily: 'Poppins', fontSize: 13, fontWeight: FontWeight.bold, color: color)),
          Text(_timeLabel(tx.date), style: const TextStyle(fontFamily: 'Poppins', fontSize: 10, color: AppColors.textHint)),
        ]),
      ]),
    );
  }
}
