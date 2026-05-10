import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/courier_controller.dart';

class CourierView extends GetView<CourierController> {
  const CourierView({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final hPad = w > 1100 ? (w - 1100) / 2 + 16 : 16.0;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Obx(() => controller.isBooked.value
          ? _BookedView(ctrl: controller)
          : _BookingView(ctrl: controller)),
    );
  }
}

class _BookingView extends StatelessWidget {
  final CourierController ctrl;
  const _BookingView({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final hPad = w > 1100 ? (w - 1100) / 2 + 16 : 16.0;
    return CustomScrollView(slivers: [
      SliverAppBar(
        expandedHeight: 160, pinned: true, backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () => Get.back()),
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primary, AppColors.primaryDark],
                begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: SafeArea(child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 32, 20, 16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Courier Services',
                  style: Theme.of(context).textTheme.headlineSmall
                    ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('Send parcels anywhere in KPK',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70)),
              ]))))),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(hPad, 16, hPad, 24),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Choose Service',
              style: Theme.of(context).textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
            const SizedBox(height: 12),
            ...ctrl.services.map((s) => Obx(() {
              final sel = ctrl.selectedService.value?.id == s.id;
              return GestureDetector(
                onTap: () => ctrl.selectedService.value = s,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: sel ? AppColors.primaryLight : Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: sel ? AppColors.primary : AppColors.border,
                      width: sel ? 2 : 1),
                    boxShadow: [BoxShadow(
                      color: AppColors.primary.withOpacity(0.06), blurRadius: 8)]),
                  child: Row(children: [
                    Container(
                      width: 44, height: 44,
                      decoration: BoxDecoration(
                        color: sel ? AppColors.primary : AppColors.primaryLight,
                        borderRadius: BorderRadius.circular(12)),
                      child: Icon(Icons.local_shipping_rounded,
                        color: sel ? Colors.white : AppColors.primary, size: 24)),
                    const SizedBox(width: 12),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(s.name, style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14,
                        color: sel ? AppColors.primary : AppColors.textPrimary)),
                      Text(s.deliveryTime,
                        style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                      const SizedBox(height: 4),
                      Wrap(spacing: 6, children: s.features.map((f) => Text(f,
                        style: TextStyle(fontSize: 10,
                          color: sel ? AppColors.primary : AppColors.textSecondary))).toList()),
                    ])),
                    Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                      Text('PKR ${s.pricePerKg.toInt()}/kg',
                        style: TextStyle(fontWeight: FontWeight.bold,
                          color: sel ? AppColors.primary : AppColors.textPrimary, fontSize: 13)),
                      Text(s.coverage,
                        style: const TextStyle(fontSize: 10, color: AppColors.textSecondary),
                        textAlign: TextAlign.right),
                    ]),
                  ]),
                ),
              );
            })).toList(),
            const SizedBox(height: 16),
            Text('Parcel Details',
              style: Theme.of(context).textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
            const SizedBox(height: 12),
            _inputField('Sender Name', Icons.person_rounded, (v) => ctrl.senderName.value = v),
            const SizedBox(height: 10),
            _inputField('Sender Address', Icons.location_on_rounded, (v) => ctrl.senderAddress.value = v),
            const SizedBox(height: 10),
            _inputField('Receiver Name', Icons.person_outline_rounded, (v) => ctrl.receiverName.value = v),
            const SizedBox(height: 10),
            _inputField('Receiver Address', Icons.location_on_outlined, (v) => ctrl.receiverAddress.value = v),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.border)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Weight (kg)',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: AppColors.textPrimary)),
                const SizedBox(height: 8),
                Obx(() => Row(children: [
                  GestureDetector(
                    onTap: () {
                      if (ctrl.weight.value > 0.5) {
                        ctrl.weight.value = (ctrl.weight.value - 0.5).clamp(0.5, 50.0);
                      }
                    },
                    child: Container(
                      width: 32, height: 32,
                      decoration: BoxDecoration(color: AppColors.primaryLight, shape: BoxShape.circle),
                      child: const Icon(Icons.remove_rounded, color: AppColors.primary, size: 18))),
                  Expanded(child: Center(child: Text(
                    '${ctrl.weight.value.toStringAsFixed(1)} kg',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.primary)))),
                  GestureDetector(
                    onTap: () => ctrl.weight.value = (ctrl.weight.value + 0.5).clamp(0.5, 50.0),
                    child: Container(
                      width: 32, height: 32,
                      decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                      child: const Icon(Icons.add_rounded, color: Colors.white, size: 18))),
                ])),
              ])),
            const SizedBox(height: 16),
            Obx(() {
              if (ctrl.selectedService.value == null) return const SizedBox.shrink();
              return Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.primaryLight, borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.primary.withOpacity(0.2))),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  const Text('Estimated Cost',
                    style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                  Text('PKR ${ctrl.estimatedCost.toStringAsFixed(0)}',
                    style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary, fontSize: 18)),
                ]));
            }),
            const SizedBox(height: 16),
            Obx(() => SizedBox(
              width: double.infinity, height: 52,
              child: ElevatedButton(
                onPressed: ctrl.selectedService.value == null || ctrl.isLoading.value
                    ? null : ctrl.bookCourier,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary, foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  elevation: 4),
                child: ctrl.isLoading.value
                    ? const SizedBox(width: 22, height: 22,
                        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                    : const Text('Book Courier',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))))),
            const SizedBox(height: 30),
          ]),
        ),
      ),
    ]);
  }

  Widget _inputField(String hint, IconData icon, ValueChanged<String> onChanged) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border)),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: AppColors.textSecondary, fontSize: 13),
          prefixIcon: Icon(icon, color: AppColors.primary, size: 20),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14))));
  }
}

class _BookedView extends StatelessWidget {
  final CourierController ctrl;
  const _BookedView({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final hPad = w > 1100 ? (w - 1100) / 2 + 16 : 16.0;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: 80, height: 80,
            decoration: const BoxDecoration(color: Color(0xFFE8F5E9), shape: BoxShape.circle),
            child: const Icon(Icons.check_circle_rounded, color: Colors.green, size: 50)),
          const SizedBox(height: 20),
          const Text('Courier Booked!',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: AppColors.textPrimary)),
          const SizedBox(height: 8),
          Obx(() => Text('Tracking #: ${ctrl.trackingNumber.value}',
            style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600, fontSize: 16))),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: ctrl.reset,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary, foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                padding: const EdgeInsets.symmetric(vertical: 14)),
              child: const Text('Book Another',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)))),
        ]))),
    );
  }
}

