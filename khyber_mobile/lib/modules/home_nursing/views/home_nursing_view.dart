import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../controllers/home_nursing_controller.dart';
import '../models/nursing_model.dart';
import '../../../core/theme/app_colors.dart';

class HomeNursingView extends StatelessWidget {
  const HomeNursingView({super.key});

  HomeNursingController get ctrl => Get.find<HomeNursingController>();

  static const _primaryColor = Color(0xFF2980B9);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final hPad = w > 1100 ? (w - 1100) / 2 + 16 : 16.0;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _Header(),
          _TabBar(),
          Expanded(child: Obx(() {
            switch (ctrl.selectedTab.value) {
              case 1: return _NursesTab();
              case 2: return _BookingTab();
              default: return _ServicesTab();
            }
          })),
        ],
      ),
    );
  }
}

// ── HEADER ────────────────────────────────────────────────────────────────────
class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final hPad = w > 1100 ? (w - 1100) / 2 + 16 : 16.0;
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 8, bottom: 20, left: 20, right: 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF2980B9), Color(0xFF9B59B6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 20),
            onPressed: () => Get.back(),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Home Nursing', style: TextStyle(fontFamily: 'Poppins', fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white)),
                Text('Khyber Pakhtunkhwa — KPK Wide', style: TextStyle(fontFamily: 'Poppins', fontSize: 12, color: Colors.white.withValues(alpha: 0.85))),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(20)),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              const Icon(Icons.circle, size: 8, color: Color(0xFF2ECC71)),
              const SizedBox(width: 5),
              const Text('Available 24/7', style: TextStyle(fontFamily: 'Poppins', fontSize: 11, fontWeight: FontWeight.w600, color: Colors.white)),
            ]),
          ),
        ],
      ),
    );
  }
}

// ── TAB BAR ───────────────────────────────────────────────────────────────────
class _TabBar extends StatelessWidget {
  HomeNursingController get ctrl => Get.find<HomeNursingController>();
  static const _tabs = ['Services', 'Our Nurses', 'Book Now'];

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final hPad = w > 1100 ? (w - 1100) / 2 + 16 : 16.0;
    return Container(
      color: AppColors.surface,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Obx(() => Row(
        children: List.generate(_tabs.length, (i) {
          final selected = ctrl.selectedTab.value == i;
          return Expanded(
            child: GestureDetector(
              onTap: () => ctrl.selectTab(i),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: EdgeInsets.only(right: i < _tabs.length - 1 ? 8 : 0),
                padding: const EdgeInsets.symmetric(vertical: 9),
                decoration: BoxDecoration(
                  color: selected ? const Color(0xFF2980B9) : AppColors.background,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: selected ? const Color(0xFF2980B9) : AppColors.border),
                ),
                child: Text(_tabs[i], textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 13, fontWeight: FontWeight.w600,
                    color: selected ? Colors.white : AppColors.textSecondary)),
              ),
            ),
          );
        }),
      )),
    );
  }
}

// ── SERVICES TAB ──────────────────────────────────────────────────────────────
class _ServicesTab extends StatelessWidget {
  HomeNursingController get ctrl => Get.find<HomeNursingController>();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final hPad = w > 1100 ? (w - 1100) / 2 + 16 : 16.0;
    return ListView(
      padding: const EdgeInsets.fromLTRB(hPad, 16, hPad, 24),
      children: [
        // Coverage banner
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFF2980B9).withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF2980B9).withValues(alpha: 0.3)),
          ),
          child: Row(children: [
            const Icon(Icons.location_on_rounded, color: Color(0xFF2980B9), size: 20),
            const SizedBox(width: 10),
            const Expanded(child: Text('Coverage: All Districts across KPK Province',
              style: TextStyle(fontFamily: 'Poppins', fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xFF2980B9)))),
          ]),
        ),
        const SizedBox(height: 16),
        const Text('Our Services', style: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
        const SizedBox(height: 12),
        ...ctrl.services.map((s) => _ServiceCard(service: s)),
      ],
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final NursingServiceModel service;
  const _ServiceCard({required this.service});
  HomeNursingController get ctrl => Get.find<HomeNursingController>();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final hPad = w > 1100 ? (w - 1100) / 2 + 16 : 16.0;
    final color = Color(service.color);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border, width: 0.8),
        boxShadow: [BoxShadow(color: color.withValues(alpha: 0.06), blurRadius: 10, offset: const Offset(0, 3))],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 48, height: 48,
                  decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
                  child: Icon(Icons.medical_services_rounded, color: color, size: 24),
                ),
                const SizedBox(width: 12),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(service.name, style: const TextStyle(fontFamily: 'Poppins', fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                    Text(service.duration, style: const TextStyle(fontFamily: 'Poppins', fontSize: 12, color: AppColors.textSecondary)),
                  ],
                )),
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  const Text('From', style: TextStyle(fontFamily: 'Poppins', fontSize: 10, color: AppColors.textSecondary)),
                  Text('PKR ${service.pricePerVisit.toStringAsFixed(0)}',
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w700, color: color)),
                ]),
              ],
            ),
            const SizedBox(height: 8),
            Text(service.description, style: const TextStyle(fontFamily: 'Poppins', fontSize: 12, color: AppColors.textSecondary, height: 1.5)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 6, runSpacing: 6,
              children: service.includes.map((item) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(color: color.withValues(alpha: 0.08), borderRadius: BorderRadius.circular(6)),
                child: Text(item, style: TextStyle(fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w500, color: color)),
              )).toList(),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: () => ctrl.selectService(service),
                style: ElevatedButton.styleFrom(
                  backgroundColor: color, foregroundColor: Colors.white, elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  textStyle: const TextStyle(fontFamily: 'Poppins', fontSize: 13, fontWeight: FontWeight.w600),
                ),
                child: const Text('Book This Service'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── NURSES TAB ────────────────────────────────────────────────────────────────
class _NursesTab extends StatelessWidget {
  HomeNursingController get ctrl => Get.find<HomeNursingController>();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final hPad = w > 1100 ? (w - 1100) / 2 + 16 : 16.0;
    return ListView(
      padding: const EdgeInsets.fromLTRB(hPad, 16, hPad, 24),
      children: [
        const Text('Our Qualified Nurses', style: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
        const SizedBox(height: 4),
        const Text('All nurses are verified, trained & background-checked.',
          style: TextStyle(fontFamily: 'Poppins', fontSize: 12, color: AppColors.textSecondary)),
        const SizedBox(height: 14),
        ...ctrl.nurses.map((n) => _NurseCard(nurse: n)),
      ],
    );
  }
}

class _NurseCard extends StatelessWidget {
  final NurseModel nurse;
  const _NurseCard({required this.nurse});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final hPad = w > 1100 ? (w - 1100) / 2 + 16 : 16.0;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border, width: 0.8),
        boxShadow: [BoxShadow(color: const Color(0xFF2980B9).withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 3))],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: CachedNetworkImage(
              imageUrl: nurse.image,
              width: 64, height: 64, fit: BoxFit.cover,
              placeholder: (_, __) => Container(width: 64, height: 64, color: AppColors.border,
                child: const Icon(Icons.person_rounded, color: AppColors.textHint, size: 32)),
              errorWidget: (_, __, ___) => Container(width: 64, height: 64, color: const Color(0xFF2980B9).withValues(alpha: 0.1),
                child: const Icon(Icons.person_rounded, color: Color(0xFF2980B9), size: 32)),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: Text(nurse.name, style: const TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.textPrimary))),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: nurse.isAvailable ? const Color(0xFF27AE60).withValues(alpha: 0.1) : AppColors.border,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(nurse.isAvailable ? 'Available' : 'Busy',
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w600,
                          color: nurse.isAvailable ? const Color(0xFF27AE60) : AppColors.textHint)),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Text('${nurse.qualification} • ${nurse.experience}',
                  style: const TextStyle(fontFamily: 'Poppins', fontSize: 12, color: AppColors.textSecondary)),
                const SizedBox(height: 5),
                Row(children: [
                  const Icon(Icons.star_rounded, size: 13, color: Color(0xFFD4A017)),
                  const SizedBox(width: 3),
                  Text('${nurse.rating}', style: const TextStyle(fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                  const SizedBox(width: 6),
                  Text('${nurse.patients} patients', style: const TextStyle(fontFamily: 'Poppins', fontSize: 11, color: AppColors.textSecondary)),
                ]),
                const SizedBox(height: 6),
                Wrap(spacing: 4, runSpacing: 4,
                  children: nurse.specializations.map((s) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                    decoration: BoxDecoration(color: const Color(0xFF2980B9).withValues(alpha: 0.08), borderRadius: BorderRadius.circular(5)),
                    child: Text(s, style: const TextStyle(fontFamily: 'Poppins', fontSize: 10, color: Color(0xFF2980B9))),
                  )).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── BOOKING TAB ───────────────────────────────────────────────────────────────
class _BookingTab extends StatelessWidget {
  HomeNursingController get ctrl => Get.find<HomeNursingController>();
  final _nameCtrl    = TextEditingController();
  final _addressCtrl = TextEditingController();
  final _notesCtrl   = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final hPad = w > 1100 ? (w - 1100) / 2 + 16 : 16.0;
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(hPad, 16, hPad, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Book a Nurse', style: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
          const SizedBox(height: 14),

          // Selected service chip
          Obx(() => ctrl.selectedService.value != null
            ? Container(
                margin: const EdgeInsets.only(bottom: 14),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(ctrl.selectedService.value!.color).withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(ctrl.selectedService.value!.color).withValues(alpha: 0.3)),
                ),
                child: Row(
                  children: [
                    Icon(Icons.check_circle_rounded, color: Color(ctrl.selectedService.value!.color), size: 20),
                    const SizedBox(width: 10),
                    Expanded(child: Text(ctrl.selectedService.value!.name,
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w600,
                        color: Color(ctrl.selectedService.value!.color)))),
                    TextButton(onPressed: () => ctrl.selectedService.value = null,
                      child: const Text('Change', style: TextStyle(fontFamily: 'Poppins', fontSize: 12))),
                  ],
                ),
              )
            : _ServiceDropdown(),
          ),

          _Label('Patient Full Name'),
          TextField(controller: _nameCtrl, onChanged: (v) => ctrl.patientName.value = v,
            decoration: _inputDeco('Enter patient name', Icons.person_outline_rounded)),
          const SizedBox(height: 12),

          _Label('Full Address'),
          TextField(controller: _addressCtrl, onChanged: (v) => ctrl.patientAddress.value = v,
            maxLines: 2,
            decoration: _inputDeco('House no., street, area, district', Icons.location_on_outlined)),
          const SizedBox(height: 12),

          _Label('Preferred Date & Time'),
          Obx(() => GestureDetector(
            onTap: () async {
              final d = await showDatePicker(context: context, initialDate: DateTime.now().add(const Duration(days: 1)),
                firstDate: DateTime.now(), lastDate: DateTime.now().add(const Duration(days: 30)),
                builder: (ctx, child) => Theme(
                  data: Theme.of(ctx).copyWith(colorScheme: const ColorScheme.light(primary: Color(0xFF2980B9))),
                  child: child!,
                ));
              if (d != null) ctrl.bookingDate.value = d;
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border, width: 1.5),
              ),
              child: Row(children: [
                const Icon(Icons.calendar_today_outlined, size: 18, color: AppColors.textHint),
                const SizedBox(width: 10),
                Text(
                  ctrl.bookingDate.value != null
                    ? '${ctrl.bookingDate.value!.day}/${ctrl.bookingDate.value!.month}/${ctrl.bookingDate.value!.year}'
                    : 'Select date',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 14,
                    color: ctrl.bookingDate.value != null ? AppColors.textPrimary : AppColors.textHint),
                ),
              ]),
            ),
          )),
          const SizedBox(height: 12),

          _Label('Notes (Optional)'),
          TextField(controller: _notesCtrl, onChanged: (v) => ctrl.notes.value = v,
            maxLines: 3,
            decoration: _inputDeco('Any medical details, special requirements...', Icons.note_outlined)),
          const SizedBox(height: 24),

          // Emergency contact
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFE74C3C).withValues(alpha: 0.07),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE74C3C).withValues(alpha: 0.3)),
            ),
            child: const Row(children: [
              Icon(Icons.phone_rounded, color: Color(0xFFE74C3C), size: 18),
              SizedBox(width: 10),
              Expanded(child: Text('Emergency? Call: 0300-KHYBER-NURSE',
                style: TextStyle(fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFFE74C3C)))),
            ]),
          ),
          const SizedBox(height: 20),

          Obx(() => SizedBox(
            width: double.infinity, height: 52,
            child: ElevatedButton(
              onPressed: ctrl.isBooking.value ? null : ctrl.submitBooking,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2980B9), foregroundColor: Colors.white, elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                textStyle: const TextStyle(fontFamily: 'Poppins', fontSize: 15, fontWeight: FontWeight.w600),
              ),
              child: ctrl.isBooking.value
                ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(strokeWidth: 2.5, color: Colors.white))
                : const Text('Confirm Booking'),
            ),
          )),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _Label(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: Text(text, style: const TextStyle(fontFamily: 'Poppins', fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
  );

  InputDecoration _inputDeco(String hint, IconData icon) => InputDecoration(
    hintText: hint,
    hintStyle: const TextStyle(fontFamily: 'Poppins', fontSize: 13, color: AppColors.textHint),
    prefixIcon: Icon(icon, size: 18, color: AppColors.textHint),
    filled: true,
    fillColor: AppColors.surface,
    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.border, width: 1.5)),
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.border, width: 1.5)),
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF2980B9), width: 2)),
  );
}

class _ServiceDropdown extends StatelessWidget {
  HomeNursingController get ctrl => Get.find<HomeNursingController>();
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final hPad = w > 1100 ? (w - 1100) / 2 + 16 : 16.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 6),
          child: Text('Select Service', style: TextStyle(fontFamily: 'Poppins', fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
        ),
        Wrap(
          spacing: 8, runSpacing: 8,
          children: ctrl.services.map((s) => GestureDetector(
            onTap: () => ctrl.selectedService.value = s,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Color(s.color).withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color(s.color).withValues(alpha: 0.3)),
              ),
              child: Text(s.name, style: TextStyle(fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w600, color: Color(s.color))),
            ),
          )).toList(),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
