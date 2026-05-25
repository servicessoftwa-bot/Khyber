import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/transport_controller.dart';

class TransportView extends GetView<TransportController> {
  const TransportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Obx(() => controller.isBooked.value
          ? const _BookedView()
          : const _BookingView()),
    );
  }
}

class _BookingView extends GetView<TransportController> {
  const _BookingView();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final maxW = w >= 800 ? 800.0 : double.infinity;
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
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Text('Ride & Transport',
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text('Book rides across KPK',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white70)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxW),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLocationCard(context),
                    const SizedBox(height: 20),
                    _buildVehicleTypes(context),
                    const SizedBox(height: 20),
                    _buildFareEstimate(context),
                    const SizedBox(height: 20),
                    _buildBookButton(context),
                    const SizedBox(height: 24),
                    Text('Nearby Drivers',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                    const SizedBox(height: 12),
                    _buildNearbyDrivers(),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLocationCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.08), blurRadius: 12, offset: const Offset(0, 4))],
      ),
      child: Column(
        children: [
          _LocationRow(
            icon: Icons.my_location,
            iconColor: AppColors.primary,
            hint: 'Pickup location',
            onChanged: (v) => controller.pickup.value = v,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 11),
            child: Column(
              children: List.generate(
                3,
                (_) => Container(height: 4, width: 2, color: AppColors.border, margin: const EdgeInsets.symmetric(vertical: 1)),
              ),
            ),
          ),
          _LocationRow(
            icon: Icons.location_on,
            iconColor: AppColors.accent,
            hint: 'Drop-off destination',
            onChanged: (v) => controller.dropoff.value = v,
          ),
        ],
      ),
    );
  }

  Widget _buildVehicleTypes(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Choose Vehicle',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
        const SizedBox(height: 12),
        SizedBox(
          height: 120,
          child: Obx(() { final selType = controller.selectedType.value; return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: controller.vehicleTypes.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, i) {
              final v = controller.vehicleTypes[i];
              final selected = selType == v.id;
              return GestureDetector(
                onTap: () => controller.selectType(v.id),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 90,
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: BoxDecoration(
                    color: selected ? AppColors.primary : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: selected ? AppColors.primary : AppColors.border,
                      width: selected ? 2 : 1,
                    ),
                    boxShadow: selected
                        ? [BoxShadow(color: AppColors.primary.withOpacity(0.25), blurRadius: 10, offset: const Offset(0, 4))]
                        : [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6)],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(v.emoji, style: const TextStyle(fontSize: 28)),
                      const SizedBox(height: 6),
                      Text(v.name,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: selected ? Colors.white : AppColors.textPrimary,
                          )),
                      const SizedBox(height: 2),
                      Text('PKR ${v.baseFare.toInt()}',
                          style: TextStyle(
                            fontSize: 10,
                            color: selected ? Colors.white70 : AppColors.textSecondary,
                          )),
                    ],
                  ),
                ),
              );
            },
          );}),
        ),
      ],
    );
  }

  Widget _buildFareEstimate(BuildContext context) {
    return Obx(() {
      final type = controller.vehicleTypes
          .firstWhereOrNull((v) => v.id == controller.selectedType.value);
      if (type == null) return const SizedBox.shrink();
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.primaryLight,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.primary.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            Container(
              width: 44, height: 44,
              decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(12)),
              child: Center(child: Text(type.emoji, style: const TextStyle(fontSize: 22))),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(type.name,
                      style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary, fontSize: 15)),
                  Text('Base fare + PKR ${type.perKm.toInt()}/km',
                      style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text('Est. Fare', style: TextStyle(color: AppColors.textSecondary, fontSize: 11)),
                Obx(() => Text('PKR ${controller.estimatedFare.value.toStringAsFixed(0)}',
                    style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary, fontSize: 18))),
              ],
            ),
          ],
        ),
      );
    });
  }

  Widget _buildBookButton(BuildContext context) {
    return Obx(() => SizedBox(
      width: double.infinity, height: 54,
      child: ElevatedButton(
        onPressed: controller.isLoading.value ? null : controller.bookRide,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary, foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 4,
        ),
        child: controller.isLoading.value
            ? const SizedBox(width: 22, height: 22,
                child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
            : const Text('Book Ride', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    ));
  }

  Widget _buildNearbyDrivers() {
    return Column(
      children: controller.nearbyDrivers
          .map((d) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _DriverCard(driver: d),
              ))
          .toList(),
    );
  }
}

class _LocationRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String hint;
  final ValueChanged<String> onChanged;
  const _LocationRow({required this.icon, required this.iconColor, required this.hint, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 22, height: 22,
          decoration: BoxDecoration(color: iconColor.withOpacity(0.15), shape: BoxShape.circle),
          child: Icon(icon, size: 13, color: iconColor)),
        const SizedBox(width: 12),
        Expanded(
          child: TextField(
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: AppColors.textSecondary, fontSize: 14),
              border: InputBorder.none, isDense: true, contentPadding: EdgeInsets.zero,
            ),
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}

class _DriverCard extends StatelessWidget {
  final dynamic driver;
  const _DriverCard({required this.driver});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 3))],
      ),
      child: Row(
        children: [
          Container(
            width: 50, height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [AppColors.primary.withOpacity(0.8), AppColors.primaryDark]),
            ),
            child: Center(child: Text(
              driver.name.split(' ').first[0],
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            )),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(driver.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.textPrimary)),
                const SizedBox(height: 2),
                Text(driver.vehicleNumber, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                const SizedBox(height: 4),
                Row(children: [
                  const Icon(Icons.star_rounded, color: AppColors.gold, size: 14),
                  const SizedBox(width: 2),
                  Text(driver.rating.toString(), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                  const SizedBox(width: 8),
                  const Icon(Icons.access_time_rounded, size: 13, color: AppColors.textSecondary),
                  const SizedBox(width: 2),
                  Text('${driver.etaMinutes} min', style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                ]),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(color: AppColors.accent.withOpacity(0.12), borderRadius: BorderRadius.circular(20)),
            child: Text(driver.vehicleType, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.accent)),
          ),
        ],
      ),
    );
  }
}

class _BookedView extends GetView<TransportController> {
  const _BookedView();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Obx(() {
      final driver = controller.assignedDriver.value;
      if (driver == null) return const SizedBox.shrink();
      return CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: AppColors.accent,
            title: const Text('Ride Booked', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: w >= 800 ? 700.0 : double.infinity),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [AppColors.accent, AppColors.accent.withOpacity(0.8)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Column(
                          children: [
                            Container(width: 70, height: 70,
                              decoration: const BoxDecoration(color: Colors.white24, shape: BoxShape.circle),
                              child: Center(child: Text(
                                driver.name.split(' ').first[0],
                                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
                              ))),
                            const SizedBox(height: 12),
                            Text(driver.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                            const SizedBox(height: 4),
                            Text(driver.vehicleNumber, style: const TextStyle(color: Colors.white70, fontSize: 13)),
                            const SizedBox(height: 4),
                            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                              const Icon(Icons.star_rounded, color: AppColors.gold, size: 16),
                              const SizedBox(width: 4),
                              Text(driver.rating.toString(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                            ]),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(child: _StatBox(label: 'ETA', value: '${driver.etaMinutes} min', icon: Icons.access_time_rounded, color: AppColors.primary)),
                          const SizedBox(width: 16),
                          Expanded(child: _StatBox(label: 'Fare', value: 'PKR ${controller.estimatedFare.value.toStringAsFixed(0)}', icon: Icons.payments_rounded, color: AppColors.accent)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.circular(16),
                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)],
                        ),
                        child: Column(children: [
                          _TripRow(icon: Icons.my_location, color: AppColors.primary, label: 'Pickup', value: controller.pickup.value),
                          const Divider(height: 20),
                          _TripRow(icon: Icons.location_on, color: AppColors.accent, label: 'Drop-off', value: controller.dropoff.value),
                        ]),
                      ),
                      const SizedBox(height: 28),
                      SizedBox(
                        width: double.infinity, height: 52,
                        child: OutlinedButton(
                          onPressed: controller.cancelRide,
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.primary,
                            side: const BorderSide(color: AppColors.primary, width: 1.5),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          ),
                          child: const Text('Cancel Ride', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}

class _StatBox extends StatelessWidget {
  final String label, value;
  final IconData icon;
  final Color color;
  const _StatBox({required this.label, required this.value, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08), borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(children: [
        Icon(icon, color: color, size: 26),
        const SizedBox(height: 8),
        Text(value, style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 16)),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
      ]),
    );
  }
}

class _TripRow extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label, value;
  const _TripRow({required this.icon, required this.color, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color, size: 18),
        const SizedBox(width: 10),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(color: AppColors.textSecondary, fontSize: 11)),
            Text(
              value.isEmpty ? 'Not specified' : value,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: AppColors.textPrimary),
              maxLines: 1, overflow: TextOverflow.ellipsis,
            ),
          ],
        )),
      ],
    );
  }
}