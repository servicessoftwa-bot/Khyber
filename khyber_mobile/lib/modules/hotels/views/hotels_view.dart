import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../controllers/hotels_controller.dart';
import '../models/hotel_model.dart';
import '../../../core/theme/app_colors.dart';

class HotelsView extends StatelessWidget {
  const HotelsView({super.key});

  HotelsController get ctrl => Get.find<HotelsController>();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final cols = w >= 800 ? 2 : 1;
    final hPad = w > 1100 ? (w - 1100) / 2 + 16 : 16.0;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: NestedScrollView(
        headerSliverBuilder: (_, __) => [
          SliverAppBar(
            pinned: true,
            expandedHeight: 130,
            backgroundColor: AppColors.surface,
            foregroundColor: AppColors.textPrimary,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () => Get.back(),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Stay in KPK',
                style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w700, fontSize: 18, color: AppColors.textPrimary)),
              titlePadding: const EdgeInsets.only(left: 56, bottom: 52),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF1A6B72), Color(0xFFB03A2E)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Center(child: Icon(Icons.hotel_rounded, size: 48, color: Colors.white24)),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(52),
              child: Container(
                color: AppColors.surface,
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                child: Obx(() => TextField(
                  onChanged: ctrl.setSearch,
                  decoration: InputDecoration(
                    hintText: 'Search hotels, resorts, villas...',
                    hintStyle: const TextStyle(fontFamily: 'Poppins', fontSize: 13, color: AppColors.textHint),
                    prefixIcon: const Icon(Icons.search_rounded, size: 20, color: AppColors.textHint),
                    suffixIcon: ctrl.searchQuery.value.isNotEmpty
                        ? IconButton(icon: const Icon(Icons.clear_rounded, size: 18), onPressed: () => ctrl.setSearch(''))
                        : null,
                    filled: true, fillColor: AppColors.background,
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                  ),
                )),
              ),
            ),
          ),
        ],
        body: Column(
          children: [
            _FilterBar(),
            Expanded(child: _PropertyList(cols: cols, hPad: hPad)),
          ],
        ),
      ),
    );
  }
}

class _FilterBar extends StatelessWidget {
  HotelsController get ctrl => Get.find<HotelsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surface,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Obx(() => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: ctrl.filters.map((f) {
            final selected = ctrl.selectedFilter.value == f;
            return GestureDetector(
              onTap: () => ctrl.setFilter(f),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                decoration: BoxDecoration(
                  color: selected ? AppColors.primary : AppColors.background,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: selected ? AppColors.primary : AppColors.border),
                ),
                child: Text(f, style: TextStyle(
                  fontFamily: 'Poppins', fontSize: 13, fontWeight: FontWeight.w600,
                  color: selected ? Colors.white : AppColors.textSecondary)),
              ),
            );
          }).toList(),
        ),
      )),
    );
  }
}

class _PropertyList extends StatelessWidget {
  final int cols;
  final double hPad;
  const _PropertyList({required this.cols, required this.hPad});
  HotelsController get ctrl => Get.find<HotelsController>();

  static const _typeColors = {
    'hotel':      Color(0xFF1A6B72),
    'resort':     Color(0xFF16A085),
    'villa':      Color(0xFFD4A017),
    'guesthouse': Color(0xFFB03A2E),
  };

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final list = ctrl.filtered;
      if (list.isEmpty) {
        return const Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.hotel_rounded, size: 60, color: AppColors.textHint),
            SizedBox(height: 12),
            Text('No properties found', style: TextStyle(fontFamily: 'Poppins', fontSize: 16, color: AppColors.textSecondary)),
          ]),
        );
      }
      if (cols == 1) {
        return ListView.builder(
          padding: EdgeInsets.fromLTRB(hPad, 16, hPad, 24),
          itemCount: list.length,
          itemBuilder: (_, i) => _PropertyCard(property: list[i], typeColors: _typeColors),
        );
      }
      return GridView.builder(
        padding: EdgeInsets.fromLTRB(hPad, 16, hPad, 24),
        itemCount: list.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 0.78,
        ),
        itemBuilder: (_, i) => _PropertyCard(property: list[i], typeColors: _typeColors),
      );
    });
  }
}

class _PropertyCard extends StatelessWidget {
  final HotelModel property;
  final Map<String, Color> typeColors;
  const _PropertyCard({required this.property, required this.typeColors});
  HotelsController get ctrl => Get.find<HotelsController>();

  @override
  Widget build(BuildContext context) {
    final color = typeColors[property.type] ?? AppColors.primary;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.surface, borderRadius: BorderRadius.circular(18),
        boxShadow: [BoxShadow(color: color.withValues(alpha: 0.08), blurRadius: 16, offset: const Offset(0, 4))],
        border: Border.all(color: AppColors.border, width: 0.8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: property.image,
                  height: 180, width: double.infinity, fit: BoxFit.cover,
                  placeholder: (_, __) => Container(height: 180, color: AppColors.border),
                  errorWidget: (_, __, ___) => Container(height: 180, color: AppColors.primaryLight,
                    child: const Icon(Icons.hotel_rounded, size: 48, color: AppColors.primary)),
                ),
                Positioned(top: 12, left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
                    child: Text(ctrl.typeLabel(property.type),
                      style: const TextStyle(fontFamily: 'Poppins', color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600)),
                  )),
                Positioned(top: 12, right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      const Icon(Icons.star_rounded, size: 14, color: Color(0xFFD4A017)),
                      const SizedBox(width: 4),
                      Text('${property.rating}', style: const TextStyle(fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                      Text(' (${property.reviews})', style: const TextStyle(fontFamily: 'Poppins', fontSize: 11, color: AppColors.textSecondary)),
                    ]),
                  )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(property.name, style: const TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                const SizedBox(height: 4),
                Row(children: [
                  const Icon(Icons.location_on_outlined, size: 14, color: AppColors.textSecondary),
                  const SizedBox(width: 4),
                  Expanded(child: Text(property.location, style: const TextStyle(fontFamily: 'Poppins', fontSize: 12, color: AppColors.textSecondary), overflow: TextOverflow.ellipsis)),
                ]),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 6, runSpacing: 6,
                  children: property.amenities.take(4).map((a) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(color: color.withValues(alpha: 0.08), borderRadius: BorderRadius.circular(6)),
                    child: Text(a, style: TextStyle(fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w500, color: color)),
                  )).toList(),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      const Text('Per night', style: TextStyle(fontFamily: 'Poppins', fontSize: 11, color: AppColors.textSecondary)),
                      Text('PKR ${property.pricePerNight.toStringAsFixed(0)}',
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 17, fontWeight: FontWeight.w700, color: color)),
                    ]),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: color, foregroundColor: Colors.white,
                        minimumSize: const Size(110, 40),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        elevation: 0,
                        textStyle: const TextStyle(fontFamily: 'Poppins', fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                      child: const Text('Book Now'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
