import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../controllers/home_controller.dart';
import '../../../core/theme/app_colors.dart';
import '../../../app/routes/app_routes.dart';
import '../../profile/views/profile_view.dart';
import '../../orders/views/orders_view.dart';
import '../../wallet/views/wallet_view.dart';

// ─── BREAKPOINTS ──────────────────────────────────────────────────────────────
bool _isDesktop(BuildContext ctx) => MediaQuery.of(ctx).size.width >= 800;
bool _isWide(BuildContext ctx)    => MediaQuery.of(ctx).size.width >= 1100;

Widget _maxWidth(Widget child, {double max = 1100}) =>
    Center(child: ConstrainedBox(constraints: BoxConstraints(maxWidth: max), child: child));

// ─── HOME VIEW ────────────────────────────────────────────────────────────────
class HomeView extends StatelessWidget {
  const HomeView({super.key});
  HomeController get ctrl => Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final desktop = constraints.maxWidth >= 800;
      return Obx(() => desktop ? _desktop() : _mobile());
    });
  }

  Widget _mobile() => Scaffold(
    backgroundColor: AppColors.background,
    body: IndexedStack(index: ctrl.currentIndex.value, children: const [
      _HomeTab(), _ExploreTab(), OrdersView(), WalletView(), ProfileView(),
    ]),
    bottomNavigationBar: _BottomNav(),
  );

  Widget _desktop() => Scaffold(
    backgroundColor: AppColors.background,
    body: Row(children: [
      _SideNav(),
      const VerticalDivider(width: 1, thickness: 1, color: AppColors.border),
      Expanded(child: IndexedStack(index: ctrl.currentIndex.value, children: const [
        _HomeTab(), _ExploreTab(), OrdersView(), WalletView(), ProfileView(),
      ])),
    ]),
  );
}

// ─── SIDE NAV (desktop) ───────────────────────────────────────────────────────
class _SideNav extends StatelessWidget {
  HomeController get ctrl => Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final wide = _isWide(context);
    return Obx(() => NavigationRail(
      selectedIndex: ctrl.currentIndex.value,
      onDestinationSelected: ctrl.changeTab,
      extended: wide,
      minWidth: 72,
      minExtendedWidth: 200,
      backgroundColor: AppColors.surface,
      selectedIconTheme: const IconThemeData(color: AppColors.primary),
      unselectedIconTheme: const IconThemeData(color: AppColors.textHint),
      selectedLabelTextStyle: const TextStyle(fontFamily: 'Poppins', color: AppColors.primary, fontWeight: FontWeight.w600, fontSize: 13),
      unselectedLabelTextStyle: const TextStyle(fontFamily: 'Poppins', color: AppColors.textHint, fontSize: 13),
      leading: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: wide
            ? Row(mainAxisSize: MainAxisSize.min, children: [
                _Logo(),
                const SizedBox(width: 10),
                const Text('Khyber', style: TextStyle(fontFamily: 'Poppins', fontSize: 18, fontWeight: FontWeight.w800, color: AppColors.primary)),
              ])
            : _Logo(),
      ),
      destinations: const [
        NavigationRailDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home_rounded), label: Text('Home')),
        NavigationRailDestination(icon: Icon(Icons.grid_view_outlined), selectedIcon: Icon(Icons.grid_view_rounded), label: Text('Explore')),
        NavigationRailDestination(icon: Icon(Icons.receipt_long_outlined), selectedIcon: Icon(Icons.receipt_long_rounded), label: Text('Orders')),
        NavigationRailDestination(icon: Icon(Icons.account_balance_wallet_outlined), selectedIcon: Icon(Icons.account_balance_wallet_rounded), label: Text('Wallet')),
        NavigationRailDestination(icon: Icon(Icons.person_outline_rounded), selectedIcon: Icon(Icons.person_rounded), label: Text('Profile')),
      ],
    ));
  }
}

class _Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    width: 38, height: 38,
    decoration: BoxDecoration(
      gradient: const LinearGradient(colors: [AppColors.primary, AppColors.primaryDark]),
      borderRadius: BorderRadius.circular(10)),
    child: const Icon(Icons.landscape_rounded, color: Colors.white, size: 20));
}

// ─── BOTTOM NAV (mobile) ──────────────────────────────────────────────────────
class _BottomNav extends StatelessWidget {
  HomeController get ctrl => Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.08), blurRadius: 20, offset: const Offset(0, -4))],
      ),
      child: BottomNavigationBar(
        currentIndex: ctrl.currentIndex.value,
        onTap: ctrl.changeTab,
        elevation: 0,
        backgroundColor: Colors.transparent,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textHint,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600, fontSize: 11),
        unselectedLabelStyle: const TextStyle(fontFamily: 'Poppins', fontSize: 11),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home_rounded), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view_outlined), activeIcon: Icon(Icons.grid_view_rounded), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long_outlined), activeIcon: Icon(Icons.receipt_long_rounded), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet_outlined), activeIcon: Icon(Icons.account_balance_wallet_rounded), label: 'Wallet'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded), activeIcon: Icon(Icons.person_rounded), label: 'Profile'),
        ],
      ),
    ));
  }
}

// ─── HOME TAB ────────────────────────────────────────────────────────────────
class _HomeTab extends StatelessWidget {
  const _HomeTab();
  HomeController get ctrl => Get.find<HomeController>();

  static const _quickServices = [
    {'icon': Icons.restaurant_rounded,        'label': 'Food',        'color': 0xFFE67E22, 'route': AppRoutes.food},
    {'icon': Icons.shopping_basket_rounded,   'label': 'Grocery',     'color': 0xFF27AE60, 'route': AppRoutes.grocery},
    {'icon': Icons.local_pharmacy_rounded,    'label': 'Pharmacy',    'color': 0xFF2980B9, 'route': AppRoutes.pharmacy},
    {'icon': Icons.directions_car_rounded,    'label': 'Transport',   'color': 0xFF8E44AD, 'route': AppRoutes.transport},
    {'icon': Icons.local_hospital_rounded,    'label': 'Hospitals',   'color': 0xFFC0392B, 'route': AppRoutes.hospitals},
    {'icon': Icons.account_balance_rounded,   'label': 'Govt',        'color': 0xFF2C3E50, 'route': AppRoutes.govtServices},
    {'icon': Icons.landscape_rounded,         'label': 'Tourism',     'color': 0xFF16A085, 'route': AppRoutes.tourism},
    {'icon': Icons.auto_awesome_rounded,      'label': 'Crafts',      'color': 0xFFD4A017, 'route': AppRoutes.crafts},
    {'icon': Icons.hotel_rounded,             'label': 'Hotels',      'color': 0xFF1A6B72, 'route': AppRoutes.hotels},
    {'icon': Icons.medical_services_rounded,  'label': 'Home Nursing','color': 0xFF9B59B6, 'route': AppRoutes.homeNursing},
  ];

  static const _moreServices = [
    {'icon': Icons.work_rounded,              'label': 'Jobs',        'color': 0xFF1A6B72, 'route': AppRoutes.jobs},
    {'icon': Icons.school_rounded,            'label': 'Education',   'color': 0xFF8E44AD, 'route': AppRoutes.education},
    {'icon': Icons.park_rounded,              'label': 'Parks',       'color': 0xFF27AE60, 'route': AppRoutes.parks},
    {'icon': Icons.celebration_rounded,       'label': 'Events',      'color': 0xFFE67E22, 'route': AppRoutes.events},
    {'icon': Icons.store_rounded,             'label': 'Shopping',    'color': 0xFF1A4D2E, 'route': AppRoutes.shopping},
    {'icon': Icons.home_work_rounded,         'label': 'Real Estate', 'color': 0xFF2C3E50, 'route': AppRoutes.realEstate},
    {'icon': Icons.newspaper_rounded,         'label': 'News',        'color': 0xFF2980B9, 'route': AppRoutes.news},
    {'icon': Icons.warning_amber_rounded,     'label': 'Emergency',   'color': 0xFFC0392B, 'route': AppRoutes.emergency},
  ];

  static const _kpkServices = [
    {'icon': Icons.electric_bolt_rounded,     'label': 'Load Shedding','color': 0xFFE67E22, 'route': AppRoutes.loadShedding},
    {'icon': Icons.agriculture_rounded,       'label': 'Agriculture',  'color': 0xFF27AE60, 'route': AppRoutes.agriculture},
    {'icon': Icons.pets_rounded,              'label': 'Livestock',    'color': 0xFF8B4513, 'route': AppRoutes.livestock},
    {'icon': Icons.directions_bus_rounded,    'label': 'BRT Peshawar', 'color': 0xFF2980B9, 'route': AppRoutes.brt},
    {'icon': Icons.villa_rounded,             'label': 'Marriage Halls','color': 0xFFD4A017,'route': AppRoutes.marriageHalls},
    {'icon': Icons.eco_rounded,               'label': 'Dry Fruits',   'color': 0xFFB7410E, 'route': AppRoutes.dryFruits},
    {'icon': Icons.diamond_rounded,           'label': 'Gemstones',    'color': 0xFF1A6B72, 'route': AppRoutes.gemstones},
    {'icon': Icons.terrain_rounded,           'label': 'Marble',       'color': 0xFF7F8C8D, 'route': AppRoutes.marble},
    {'icon': Icons.account_balance_rounded,   'label': 'Gandhara',     'color': 0xFF8E6B00, 'route': AppRoutes.gandhara},
    {'icon': Icons.sports_cricket_rounded,    'label': 'Sports',       'color': 0xFF16A085, 'route': AppRoutes.sports},
    {'icon': Icons.receipt_long_outlined,     'label': 'Utility Bills', 'color': 0xFF2C3E50, 'route': AppRoutes.utilityBills},
    {'icon': Icons.flood_rounded,             'label': 'Flood Alerts', 'color': 0xFF2471A3, 'route': AppRoutes.floodAlerts},
  ];

  @override
  Widget build(BuildContext context) {
    final desktop = _isDesktop(context);
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(child: desktop ? _maxWidth(_buildHeader(context)) : _buildHeader(context)),
      SliverToBoxAdapter(child: desktop ? _maxWidth(_buildBanners()) : _buildBanners()),
      SliverToBoxAdapter(child: desktop ? _maxWidth(_buildSectionTitle('Quick Services')) : _buildSectionTitle('Quick Services')),
      SliverToBoxAdapter(child: desktop ? _maxWidth(_buildServicesGrid(_quickServices, context)) : _buildServicesGrid(_quickServices, context)),
      SliverToBoxAdapter(child: desktop ? _maxWidth(_buildSectionTitle('More Services')) : _buildSectionTitle('More Services')),
      SliverToBoxAdapter(child: desktop ? _maxWidth(_buildServicesGrid(_moreServices, context)) : _buildServicesGrid(_moreServices, context)),
      SliverToBoxAdapter(child: desktop ? _maxWidth(_buildSectionTitle('KPK Specials')) : _buildSectionTitle('KPK Specials')),
      SliverToBoxAdapter(child: desktop ? _maxWidth(_buildServicesGrid(_kpkServices, context)) : _buildServicesGrid(_kpkServices, context)),
      SliverToBoxAdapter(child: desktop ? _maxWidth(_buildKPKHighlights()) : _buildKPKHighlights()),
      const SliverToBoxAdapter(child: SizedBox(height: 32)),
    ]);
  }

  int _gridCols(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    if (w >= 1200) return 8;
    if (w >= 900)  return 6;
    if (w >= 700)  return 5;
    return 4;
  }

  Widget _buildHeader(BuildContext context) {
    final desktop = _isDesktop(context);
    return Container(
      padding: EdgeInsets.fromLTRB(20, desktop ? 32 : 56, 20, 20),
      decoration: const BoxDecoration(
        gradient: AppColors.sunsetGradient,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(28), bottomRight: Radius.circular(28)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Expanded(child: Obx(() => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(ctrl.greeting.value, style: const TextStyle(fontFamily: 'Poppins', fontSize: 13, color: Colors.white70)),
            Text(ctrl.userName.value, style: const TextStyle(fontFamily: 'Poppins', fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white)),
          ]))),
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.notifications),
            child: Container(
              width: 44, height: 44,
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.18), borderRadius: BorderRadius.circular(12)),
              child: const Icon(Icons.notifications_outlined, color: Colors.white, size: 22)),
          ),
        ]),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: () => Get.find<HomeController>().changeTab(1),
          child: Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: const Row(children: [
              Icon(Icons.search_rounded, color: AppColors.textHint, size: 20),
              SizedBox(width: 10),
              Text('Search services in KPK...', style: TextStyle(fontFamily: 'Poppins', color: AppColors.textHint, fontSize: 14)),
            ]),
          ),
        ),
      ]),
    );
  }

  Widget _buildBanners() {
    return Obx(() => SizedBox(
      height: 180,
      child: PageView.builder(
        padEnds: false,
        controller: PageController(viewportFraction: 0.88),
        itemCount: ctrl.banners.length,
        itemBuilder: (_, i) {
          final b = ctrl.banners[i];
          return GestureDetector(
            onTap: () => Get.toNamed(b['route']!),
            child: Container(
              margin: EdgeInsets.only(left: i == 0 ? 20 : 8, right: 8, top: 16, bottom: 8),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(18), boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.12), blurRadius: 12, offset: const Offset(0, 4)),
              ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Stack(fit: StackFit.expand, children: [
                  CachedNetworkImage(imageUrl: b['image']!, fit: BoxFit.cover),
                  Container(decoration: BoxDecoration(gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black.withOpacity(0.65)],
                    begin: Alignment.topCenter, end: Alignment.bottomCenter))),
                  Positioned(bottom: 16, left: 16, right: 16, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(b['title']!, style: const TextStyle(fontFamily: 'Poppins', color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700)),
                    Text(b['subtitle']!, style: TextStyle(fontFamily: 'Poppins', color: Colors.white.withOpacity(0.85), fontSize: 12)),
                  ])),
                ]),
              ),
            ),
          );
        },
      ),
    ));
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
      child: Text(title, style: const TextStyle(fontFamily: 'Poppins', fontSize: 17, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
    );
  }

  Widget _buildServicesGrid(List<Map<String, dynamic>> services, BuildContext context) {
    final cols = _gridCols(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: cols, mainAxisSpacing: 12, crossAxisSpacing: 8, childAspectRatio: 0.82),
        itemCount: services.length,
        itemBuilder: (_, i) {
          final s = services[i];
          final color = Color(s['color'] as int);
          return GestureDetector(
            onTap: () => Get.toNamed(s['route'] as String),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                width: 58, height: 58,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: color.withOpacity(0.2), width: 1)),
                child: Icon(s['icon'] as IconData, color: color, size: 26)),
              const SizedBox(height: 6),
              Text(s['label'] as String, textAlign: TextAlign.center,
                style: const TextStyle(fontFamily: 'Poppins', fontSize: 11, fontWeight: FontWeight.w500, color: AppColors.textPrimary)),
            ]),
          );
        },
      ),
    );
  }

  Widget _buildKPKHighlights() {
    final spots = [
      {'name': 'Khyber Pass', 'img': 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=300&h=200&fit=crop'},
      {'name': 'Peshawar Museum', 'img': 'https://images.unsplash.com/photo-1548013146-72479768bada?w=300&h=200&fit=crop'},
      {'name': 'Qissa Khwani', 'img': 'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?w=300&h=200&fit=crop'},
    ];
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text('KPK Highlights', style: TextStyle(fontFamily: 'Poppins', fontSize: 17, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
          GestureDetector(onTap: () => Get.toNamed(AppRoutes.tourism),
            child: const Text('View All', style: TextStyle(fontFamily: 'Poppins', fontSize: 13, color: AppColors.primary, fontWeight: FontWeight.w600))),
        ]),
      ),
      SizedBox(
        height: 140,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: spots.length,
          itemBuilder: (_, i) => GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.tourism),
            child: Container(
              width: 180,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, 3)),
              ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Stack(fit: StackFit.expand, children: [
                  CachedNetworkImage(imageUrl: spots[i]['img']!, fit: BoxFit.cover),
                  Container(color: Colors.black.withOpacity(0.3)),
                  Positioned(bottom: 10, left: 10, right: 10,
                    child: Text(spots[i]['name']!, style: const TextStyle(fontFamily: 'Poppins', color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600))),
                ]),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}

// ─── EXPLORE TAB ─────────────────────────────────────────────────────────────
class _ExploreTab extends StatelessWidget {
  const _ExploreTab();

  static const _allServices = [
    {'icon': Icons.restaurant_rounded,       'label': 'Food',        'color': 0xFFE67E22, 'route': AppRoutes.food},
    {'icon': Icons.shopping_basket_rounded,  'label': 'Grocery',     'color': 0xFF27AE60, 'route': AppRoutes.grocery},
    {'icon': Icons.local_pharmacy_rounded,   'label': 'Pharmacy',    'color': 0xFF2980B9, 'route': AppRoutes.pharmacy},
    {'icon': Icons.store_rounded,            'label': 'Shopping',    'color': 0xFF1A4D2E, 'route': AppRoutes.shopping},
    {'icon': Icons.directions_car_rounded,   'label': 'Transport',   'color': 0xFF8E44AD, 'route': AppRoutes.transport},
    {'icon': Icons.local_shipping_rounded,   'label': 'Courier',     'color': 0xFF1A6B72, 'route': AppRoutes.courier},
    {'icon': Icons.local_hospital_rounded,   'label': 'Hospitals',   'color': 0xFFC0392B, 'route': AppRoutes.hospitals},
    {'icon': Icons.account_balance_rounded,  'label': 'Govt',        'color': 0xFF2C3E50, 'route': AppRoutes.govtServices},
    {'icon': Icons.celebration_rounded,      'label': 'Events',      'color': 0xFFE67E22, 'route': AppRoutes.events},
    {'icon': Icons.park_rounded,             'label': 'Parks',       'color': 0xFF27AE60, 'route': AppRoutes.parks},
    {'icon': Icons.business_rounded,         'label': 'Businesses',  'color': 0xFF2C3E50, 'route': AppRoutes.businesses},
    {'icon': Icons.home_work_rounded,        'label': 'Real Estate', 'color': 0xFF2980B9, 'route': AppRoutes.realEstate},
    {'icon': Icons.sports_esports_rounded,   'label': 'Amusement',   'color': 0xFF8E44AD, 'route': AppRoutes.amusement},
    {'icon': Icons.school_rounded,           'label': 'Education',   'color': 0xFF16A085, 'route': AppRoutes.education},
    {'icon': Icons.warning_amber_rounded,    'label': 'Emergency',   'color': 0xFFC0392B, 'route': AppRoutes.emergency},
    {'icon': Icons.work_rounded,             'label': 'Jobs',        'color': 0xFF1A6B72, 'route': AppRoutes.jobs},
    {'icon': Icons.newspaper_rounded,        'label': 'News',        'color': 0xFF2980B9, 'route': AppRoutes.news},
    {'icon': Icons.landscape_rounded,        'label': 'Tourism',     'color': 0xFF16A085, 'route': AppRoutes.tourism},
    {'icon': Icons.auto_awesome_rounded,     'label': 'Crafts',      'color': 0xFFD4A017, 'route': AppRoutes.crafts},
    {'icon': Icons.hotel_rounded,            'label': 'Hotels',      'color': 0xFF1A6B72, 'route': AppRoutes.hotels},
    {'icon': Icons.medical_services_rounded, 'label': 'Home Nursing','color': 0xFF9B59B6, 'route': AppRoutes.homeNursing},
    {'icon': Icons.water_drop_rounded,       'label': 'Water & Gas', 'color': 0xFF2980B9, 'route': AppRoutes.waterGas},
    {'icon': Icons.inventory_2_rounded,      'label': 'Logistics',   'color': 0xFF7D3C98, 'route': AppRoutes.logistics},
  ];

  int _gridCols(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    if (w >= 1200) return 7;
    if (w >= 900)  return 5;
    if (w >= 700)  return 4;
    return 3;
  }

  @override
  Widget build(BuildContext context) {
    final cols = _gridCols(context);
    final desktop = _isDesktop(context);
    return CustomScrollView(slivers: [
      SliverAppBar(
        pinned: true,
        backgroundColor: AppColors.surface,
        automaticallyImplyLeading: false,
        title: const Text('Explore KPK', style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w700, fontSize: 18, color: AppColors.textPrimary)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: desktop ? 800 : double.infinity),
                child: Container(
                  height: 44,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(color: AppColors.background, borderRadius: BorderRadius.circular(10), border: Border.all(color: AppColors.border)),
                  child: const Row(children: [
                    Icon(Icons.search_rounded, color: AppColors.textHint, size: 18),
                    SizedBox(width: 8),
                    Text('Search all services...', style: TextStyle(fontFamily: 'Poppins', color: AppColors.textHint, fontSize: 13)),
                  ]),
                ),
              ),
            ),
          ),
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.all(16),
        sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate((_, i) {
            final s = _allServices[i];
            final color = Color(s['color'] as int);
            return GestureDetector(
              onTap: () => Get.toNamed(s['route'] as String),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.border, width: 0.8),
                  boxShadow: [BoxShadow(color: color.withOpacity(0.06), blurRadius: 8, offset: const Offset(0, 2))]),
                child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    width: 52, height: 52,
                    decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(14)),
                    child: Icon(s['icon'] as IconData, color: color, size: 26)),
                  const SizedBox(height: 8),
                  Text(s['label'] as String, textAlign: TextAlign.center,
                    style: const TextStyle(fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.textPrimary)),
                ]),
              ),
            );
          }, childCount: _allServices.length),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: cols, mainAxisSpacing: 12, crossAxisSpacing: 12, childAspectRatio: 0.9),
        ),
      ),
    ]);
  }
}
