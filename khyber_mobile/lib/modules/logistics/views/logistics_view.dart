import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/logistics_controller.dart';

class LogisticsView extends GetView<LogisticsController> {
  const LogisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Obx(() => controller.isBooked.value
          ? _ConfirmationView(controller: controller)
          : _BookingView(controller: controller)),
    );
  }
}

// ── CONFIRMATION VIEW ─────────────────────────────────────────────────────────
class _ConfirmationView extends StatelessWidget {
  final LogisticsController controller;
  const _ConfirmationView({required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
                      Text('Shipment Booked!', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text('Your freight is on its way', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 90, height: 90,
                  decoration: BoxDecoration(
                    color: const Color(0xFF27AE60).withOpacity(0.12),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check_circle_rounded, size: 52, color: Color(0xFF27AE60)),
                ),
                const SizedBox(height: 20),
                const Text('Booking Confirmed', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.textPrimary, fontFamily: 'Poppins')),
                const SizedBox(height: 8),
                const Text('Your shipment has been registered.\nA representative will contact you shortly.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: AppColors.textSecondary, fontFamily: 'Poppins', height: 1.5)),
                const SizedBox(height: 28),
                Obx(() => Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.06),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.primary.withOpacity(0.2)),
                  ),
                  child: Column(
                    children: [
                      const Text('Tracking Number', style: TextStyle(fontSize: 12, color: AppColors.textSecondary, fontFamily: 'Poppins')),
                      const SizedBox(height: 6),
                      Text(controller.trackingNum.value,
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: AppColors.primary, fontFamily: 'Poppins', letterSpacing: 2)),
                    ],
                  ),
                )),
                const SizedBox(height: 16),
                _InfoRow(Icons.local_shipping_rounded, 'Service', controller.selectedService.value?.name ?? ''),
                _InfoRow(Icons.scale_rounded, 'Weight', '${controller.weight.value.toStringAsFixed(1)} kg'),
                _InfoRow(Icons.payments_rounded, 'Estimated Cost', 'PKR ${controller.estimatedCost.value.toStringAsFixed(0)}'),
                _InfoRow(Icons.schedule_rounded, 'Delivery', controller.selectedService.value?.deliveryTime ?? ''),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity, height: 52,
                  child: ElevatedButton(
                    onPressed: controller.reset,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary, foregroundColor: Colors.white, elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      textStyle: const TextStyle(fontFamily: 'Poppins', fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    child: const Text('Book Another Shipment'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label, value;
  const _InfoRow(this.icon, this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(children: [
        Icon(icon, size: 16, color: AppColors.textSecondary),
        const SizedBox(width: 10),
        Text('$label:', style: const TextStyle(fontSize: 13, color: AppColors.textSecondary, fontFamily: 'Poppins')),
        const Spacer(),
        Text(value, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textPrimary, fontFamily: 'Poppins')),
      ]),
    );
  }
}

// ── BOOKING VIEW ──────────────────────────────────────────────────────────────
class _BookingView extends StatelessWidget {
  final LogisticsController controller;
  const _BookingView({required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
                      Text('Freight & Logistics', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text('Send cargo anywhere across KPK', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70)),
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
              // Step 1: Choose service
              _SectionHeader('1. Choose Freight Service'),
              const SizedBox(height: 10),
              ...controller.services.map((s) => _ServiceCard(service: s, controller: controller)),
              const SizedBox(height: 20),

              // Step 2: Shipment type
              _SectionHeader('2. Shipment Type'),
              const SizedBox(height: 10),
              Obx(() => Wrap(
                spacing: 8, runSpacing: 8,
                children: controller.shipmentTypes.map((t) {
                  final selected = controller.selectedType.value?.id == t.id;
                  return GestureDetector(
                    onTap: () => controller.selectType(t),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                        color: selected ? AppColors.primary : AppColors.surface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: selected ? AppColors.primary : AppColors.border, width: 1.5),
                        boxShadow: selected ? [BoxShadow(color: AppColors.primary.withOpacity(0.2), blurRadius: 8)] : [],
                      ),
                      child: Column(
                        children: [
                          Icon(_typeIcon(t.icon), size: 22,
                            color: selected ? Colors.white : AppColors.textSecondary),
                          const SizedBox(height: 4),
                          Text(t.name, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600,
                            color: selected ? Colors.white : AppColors.textPrimary, fontFamily: 'Poppins')),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              )),
              const SizedBox(height: 20),

              // Step 3: Weight
              _SectionHeader('3. Weight (kg)'),
              const SizedBox(height: 10),
              Obx(() => Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: controller.decrementWeight,
                      child: Container(
                        width: 40, height: 40,
                        decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.1), shape: BoxShape.circle),
                        child: const Icon(Icons.remove_rounded, color: AppColors.primary, size: 20),
                      ),
                    ),
                    Expanded(
                      child: Column(children: [
                        Text('${controller.weight.value.toStringAsFixed(1)} kg',
                          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.textPrimary, fontFamily: 'Poppins')),
                        Text('Actual weight', style: const TextStyle(fontSize: 11, color: AppColors.textSecondary, fontFamily: 'Poppins')),
                      ]),
                    ),
                    GestureDetector(
                      onTap: controller.incrementWeight,
                      child: Container(
                        width: 40, height: 40,
                        decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                        child: const Icon(Icons.add_rounded, color: Colors.white, size: 20),
                      ),
                    ),
                  ],
                ),
              )),

              // Cost estimate
              Obx(() {
                if (controller.estimatedCost.value == 0) return const SizedBox.shrink();
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [AppColors.primary, AppColors.primaryDark]),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(children: [
                      const Icon(Icons.calculate_rounded, color: Colors.white70, size: 18),
                      const SizedBox(width: 10),
                      Text('Estimated Cost:', style: const TextStyle(color: Colors.white70, fontSize: 13, fontFamily: 'Poppins')),
                      const Spacer(),
                      Text('PKR ${controller.estimatedCost.value.toStringAsFixed(0)}',
                        style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold, fontFamily: 'Poppins')),
                    ]),
                  ),
                );
              }),
              const SizedBox(height: 20),

              // Step 4: Sender details
              _SectionHeader('4. Sender Details'),
              const SizedBox(height: 10),
              _Field('Sender Name', Icons.person_outline_rounded, (v) => controller.senderName.value = v),
              const SizedBox(height: 10),
              _Field('Sender Phone', Icons.phone_outlined, (v) => controller.senderPhone.value = v, keyboard: TextInputType.phone),
              const SizedBox(height: 10),
              _Field('Pickup Address', Icons.location_on_outlined, (v) => controller.senderAddress.value = v, lines: 2),
              const SizedBox(height: 20),

              // Step 5: Receiver details
              _SectionHeader('5. Receiver Details'),
              const SizedBox(height: 10),
              _Field('Receiver Name', Icons.person_outline_rounded, (v) => controller.receiverName.value = v),
              const SizedBox(height: 10),
              _Field('Receiver Phone', Icons.phone_outlined, (v) => controller.receiverPhone.value = v, keyboard: TextInputType.phone),
              const SizedBox(height: 10),
              _Field('Destination City', Icons.location_city_rounded, (v) => controller.receiverCity.value = v),
              const SizedBox(height: 10),
              _Field('Delivery Address', Icons.location_on_outlined, (v) => controller.receiverAddress.value = v, lines: 2),
              const SizedBox(height: 10),
              _Field('Cargo Description', Icons.description_outlined, (v) => controller.description.value = v, lines: 2, required: false),
              const SizedBox(height: 28),

              // Book button
              Obx(() => SizedBox(
                width: double.infinity, height: 54,
                child: ElevatedButton(
                  onPressed: (controller.selectedService.value != null &&
                              controller.selectedType.value != null)
                      ? (controller.isBooking.value ? null : controller.bookShipment)
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary, foregroundColor: Colors.white,
                    disabledBackgroundColor: AppColors.border,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    textStyle: const TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  child: controller.isBooking.value
                      ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2.5, color: Colors.white))
                      : const Row(mainAxisSize: MainAxisSize.min, children: [
                          Icon(Icons.local_shipping_rounded, size: 20),
                          SizedBox(width: 8),
                          Text('Book Shipment'),
                        ]),
                ),
              )),
              const SizedBox(height: 24),
            ]),
          ),
        ),
      ],
    );
  }

  IconData _typeIcon(String name) {
    switch (name) {
      case 'description': return Icons.description_rounded;
      case 'inventory_2': return Icons.inventory_2_rounded;
      case 'broken_image': return Icons.broken_image_rounded;
      case 'scale': return Icons.scale_rounded;
      case 'restaurant': return Icons.restaurant_rounded;
      default: return Icons.category_rounded;
    }
  }
}

// ── HELPERS ───────────────────────────────────────────────────────────────────
class _SectionHeader extends StatelessWidget {
  final String text;
  const _SectionHeader(this.text);

  @override
  Widget build(BuildContext context) => Text(text,
    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.textPrimary, fontFamily: 'Poppins'));
}

class _ServiceCard extends StatelessWidget {
  final FreightService service;
  final LogisticsController controller;
  const _ServiceCard({required this.service, required this.controller});

  @override
  Widget build(BuildContext context) {
    final color = Color(service.colorValue);
    return Obx(() {
      final selected = controller.selectedService.value?.id == service.id;
      return GestureDetector(
        onTap: () => controller.selectService(service),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: selected ? color.withOpacity(0.06) : AppColors.surface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: selected ? color : AppColors.border, width: selected ? 2 : 1),
            boxShadow: [BoxShadow(color: color.withOpacity(0.06), blurRadius: 8, offset: const Offset(0, 3))],
          ),
          child: Row(
            children: [
              Container(
                width: 46, height: 46,
                decoration: BoxDecoration(color: color.withOpacity(0.12), borderRadius: BorderRadius.circular(12)),
                child: Icon(Icons.local_shipping_rounded, color: color, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Text(service.name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700,
                        color: selected ? color : AppColors.textPrimary, fontFamily: 'Poppins')),
                      const Spacer(),
                      Text('PKR ${service.pricePerKg.toInt()}/kg',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: color, fontFamily: 'Poppins')),
                    ]),
                    const SizedBox(height: 3),
                    Row(children: [
                      const Icon(Icons.location_on_rounded, size: 12, color: AppColors.textSecondary),
                      const SizedBox(width: 3),
                      Text(service.coverage, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary, fontFamily: 'Poppins')),
                      const SizedBox(width: 10),
                      const Icon(Icons.schedule_rounded, size: 12, color: AppColors.textSecondary),
                      const SizedBox(width: 3),
                      Text(service.deliveryTime, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary, fontFamily: 'Poppins')),
                    ]),
                    const SizedBox(height: 6),
                    Wrap(
                      spacing: 4, runSpacing: 4,
                      children: service.features.map((f) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                        decoration: BoxDecoration(color: color.withOpacity(0.08), borderRadius: BorderRadius.circular(6)),
                        child: Text(f, style: TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.w500, fontFamily: 'Poppins')),
                      )).toList(),
                    ),
                  ],
                ),
              ),
              if (selected) ...[
                const SizedBox(width: 8),
                Icon(Icons.check_circle_rounded, color: color, size: 22),
              ],
            ],
          ),
        ),
      );
    });
  }
}

class _Field extends StatelessWidget {
  final String hint;
  final IconData icon;
  final void Function(String) onChanged;
  final int lines;
  final bool required;
  final TextInputType keyboard;
  const _Field(this.hint, this.icon, this.onChanged, {
    this.lines = 1, this.required = true, this.keyboard = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      maxLines: lines,
      keyboardType: keyboard,
      style: const TextStyle(fontFamily: 'Poppins', fontSize: 13, color: AppColors.textPrimary),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(fontFamily: 'Poppins', fontSize: 13, color: AppColors.textHint),
        prefixIcon: Icon(icon, size: 18, color: AppColors.textHint),
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.border, width: 1.5)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.border, width: 1.5)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.primary, width: 2)),
      ),
    );
  }
}
