import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../controllers/home_controller.dart';
import '../../../core/theme/app_colors.dart';
import '../../../app/routes/app_routes.dart';
import '../../profile/views/profile_view.dart';
import '../../orders/views/orders_view.dart';
import '../../wallet/views/wallet_view.dart';

bool _isDesktop(BuildContext ctx) => MediaQuery.of(ctx).size.width >= 800;
bool _isWide(BuildContext ctx)    => MediaQuery.of(ctx).size.width >= 1100;
Widget _maxWidth(Widget child, {double max = 1100}) =>
    Center(child: ConstrainedBox(constraints: BoxConstraints(maxWidth: max), child: child));

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
    extendBody: true,
    body: IndexedStack(index: ctrl.currentIndex.value, children: const [
      _HomeTab(), _ExploreTab(), OrdersView(), WalletView(), ProfileView(),
    ]),
    bottomNavigationBar: _FloatingNav(),
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

// ─── FLOATING BOTTOM NAV ─────────────────────────────────────────────────────
class _FloatingNav extends StatelessWidget {
  HomeController get ctrl => Get.find<HomeController>();
  static const _items = [
    {'icon': Icons.home_outlined,                   'active': Icons.home_rounded,                    'label': 'Home'},
    {'icon': Icons.grid_view_outlined,              'active': Icons.grid_view_rounded,               'label': 'Explore'},
    {'icon': Icons.receipt_long_outlined,           'active': Icons.receipt_long_rounded,            'label': 'Orders'},
    {'icon': Icons.account_balance_wallet_outlined, 'active': Icons.account_balance_wallet_rounded,  'label': 'Wallet'},
    {'icon': Icons.person_outline_rounded,          'active': Icons.person_rounded,                  'label': 'Profile'},
  ];

  @override
  Widget build(BuildContext context) => Obx(() {
    final cur = ctrl.currentIndex.value;
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 24),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(36),
        boxShadow: [
          BoxShadow(color: AppColors.primary.withValues(alpha: 0.14), blurRadius: 28, offset: const Offset(0, 10)),
          BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 8),
        ],
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: List.generate(_items.length, (i) {
        final sel = cur == i;
        return GestureDetector(
          onTap: () => ctrl.changeTab(i),
          behavior: HitTestBehavior.opaque,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 280), curve: Curves.easeInOut,
            padding: EdgeInsets.symmetric(horizontal: sel ? 18 : 14, vertical: 10),
            decoration: BoxDecoration(
              color: sel ? AppColors.primary : Colors.transparent,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Icon(sel ? _items[i]['active'] as IconData : _items[i]['icon'] as IconData,
                color: sel ? Colors.white : AppColors.textHint, size: 21),
              if (sel) ...[
                const SizedBox(width: 6),
                Text(_items[i]['label'] as String,
                  style: const TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600, fontSize: 12, color: Colors.white)),
              ],
            ]),
          ),
        );
      })),
    );
  });
}

// ─── SIDE NAV ─────────────────────────────────────────────────────────────────
class _SideNav extends StatelessWidget {
  HomeController get ctrl => Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    final wide = _isWide(context);
    return Obx(() => NavigationRail(
      selectedIndex: ctrl.currentIndex.value,
      onDestinationSelected: ctrl.changeTab,
      extended: wide, minWidth: 72, minExtendedWidth: 200,
      backgroundColor: Colors.white,
      selectedIconTheme: const IconThemeData(color: AppColors.primary),
      unselectedIconTheme: const IconThemeData(color: AppColors.textHint),
      selectedLabelTextStyle: const TextStyle(fontFamily: 'Poppins', color: AppColors.primary, fontWeight: FontWeight.w600, fontSize: 13),
      unselectedLabelTextStyle: const TextStyle(fontFamily: 'Poppins', color: AppColors.textHint, fontSize: 13),
      leading: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: wide
            ? Row(mainAxisSize: MainAxisSize.min, children: [_Logo(), const SizedBox(width: 10),
                const Text('Khyber', style: TextStyle(fontFamily: 'Poppins', fontSize: 18, fontWeight: FontWeight.w800, color: AppColors.primary))])
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
      borderRadius: BorderRadius.circular(12),
      boxShadow: [BoxShadow(color: AppColors.primary.withValues(alpha: 0.3), blurRadius: 8, offset: const Offset(0, 3))]),
    child: const Icon(Icons.landscape_rounded, color: Colors.white, size: 20));
}

// ─── HOME TAB ────────────────────────────────────────────────────────────────
class _HomeTab extends StatelessWidget {
  const _HomeTab();
  HomeController get ctrl => Get.find<HomeController>();

  static const _quickServices = [
    {'icon': Icons.restaurant_rounded,       'label': 'Food',         'color': 0xFFE67E22, 'route': AppRoutes.food},
    {'icon': Icons.shopping_basket_rounded,  'label': 'Grocery',      'color': 0xFF27AE60, 'route': AppRoutes.grocery},
    {'icon': Icons.local_pharmacy_rounded,   'label': 'Pharmacy',     'color': 0xFF2980B9, 'route': AppRoutes.pharmacy},
    {'icon': Icons.directions_car_rounded,   'label': 'Transport',    'color': 0xFF8E44AD, 'route': AppRoutes.transport},
    {'icon': Icons.local_hospital_rounded,   'label': 'Hospitals',    'color': 0xFFC0392B, 'route': AppRoutes.hospitals},
    {'icon': Icons.account_balance_rounded,  'label': 'Govt',         'color': 0xFF2C3E50, 'route': AppRoutes.govtServices},
    {'icon': Icons.landscape_rounded,        'label': 'Tourism',      'color': 0xFF16A085, 'route': AppRoutes.tourism},
    {'icon': Icons.auto_awesome_rounded,     'label': 'Crafts',       'color': 0xFFC9A227, 'route': AppRoutes.crafts},
    {'icon': Icons.hotel_rounded,            'label': 'Hotels',       'color': 0xFF1A6B72, 'route': AppRoutes.hotels},
    {'icon': Icons.medical_services_rounded, 'label': 'Home Nursing', 'color': 0xFF9B59B6, 'route': AppRoutes.homeNursing},
  ];
  static const _moreServices = [
    {'icon': Icons.work_rounded,             'label': 'Jobs',         'color': 0xFF1A6B72, 'route': AppRoutes.jobs},
    {'icon': Icons.school_rounded,           'label': 'Education',    'color': 0xFF8E44AD, 'route': AppRoutes.education},
    {'icon': Icons.park_rounded,             'label': 'Parks',        'color': 0xFF27AE60, 'route': AppRoutes.parks},
    {'icon': Icons.celebration_rounded,      'label': 'Events',       'color': 0xFFE67E22, 'route': AppRoutes.events},
    {'icon': Icons.store_rounded,            'label': 'Shopping',     'color': 0xFF1A4D2E, 'route': AppRoutes.shopping},
    {'icon': Icons.home_work_rounded,        'label': 'Real Estate',  'color': 0xFF2C3E50, 'route': AppRoutes.realEstate},
    {'icon': Icons.newspaper_rounded,        'label': 'News',         'color': 0xFF2980B9, 'route': AppRoutes.news},
    {'icon': Icons.warning_amber_rounded,    'label': 'Emergency',    'color': 0xFFC0392B, 'route': AppRoutes.emergency},
  ];
  static const _kpkServices = [
    {'icon': Icons.electric_bolt_rounded,    'label': 'Load Shedding', 'color': 0xFFE67E22, 'route': AppRoutes.loadShedding},
    {'icon': Icons.agriculture_rounded,      'label': 'Agriculture',   'color': 0xFF27AE60, 'route': AppRoutes.agriculture},
    {'icon': Icons.pets_rounded,             'label': 'Livestock',     'color': 0xFF8B4513, 'route': AppRoutes.livestock},
    {'icon': Icons.directions_bus_rounded,   'label': 'BRT Peshawar',  'color': 0xFF2980B9, 'route': AppRoutes.brt},
    {'icon': Icons.villa_rounded,            'label': 'Weddings',      'color': 0xFFC9A227, 'route': AppRoutes.marriageHalls},
    {'icon': Icons.eco_rounded,              'label': 'Dry Fruits',    'color': 0xFFB7410E, 'route': AppRoutes.dryFruits},
    {'icon': Icons.diamond_rounded,          'label': 'Gemstones',     'color': 0xFF1A6B72, 'route': AppRoutes.gemstones},
    {'icon': Icons.terrain_rounded,          'label': 'Marble',        'color': 0xFF7F8C8D, 'route': AppRoutes.marble},
    {'icon': Icons.account_balance_rounded,  'label': 'Gandhara',      'color': 0xFF8E6B00, 'route': AppRoutes.gandhara},
    {'icon': Icons.sports_cricket_rounded,   'label': 'Sports',        'color': 0xFF16A085, 'route': AppRoutes.sports},
    {'icon': Icons.receipt_long_rounded,     'label': 'Bills',         'color': 0xFF2C3E50, 'route': AppRoutes.utilityBills},
    {'icon': Icons.flood_rounded,            'label': 'Flood Alerts',  'color': 0xFF2471A3, 'route': AppRoutes.floodAlerts},
  ];

  int _cols(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    if (w >= 1200) return 8; if (w >= 900) return 6; if (w >= 700) return 5; return 4;
  }

  @override
  Widget build(BuildContext context) {
    final desktop = _isDesktop(context);
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(child: desktop ? _maxWidth(_header(context)) : _header(context)),
      SliverToBoxAdapter(child: desktop ? _maxWidth(_banners()) : _banners()),
      SliverToBoxAdapter(child: desktop ? _maxWidth(_section('Quick Services', AppRoutes.food)) : _section('Quick Services', AppRoutes.food)),
      SliverToBoxAdapter(child: desktop ? _maxWidth(_grid(_quickServices, context)) : _grid(_quickServices, context)),
      SliverToBoxAdapter(child: desktop ? _maxWidth(_section('More Services', AppRoutes.explore)) : _section('More Services', AppRoutes.explore)),
      SliverToBoxAdapter(child: desktop ? _maxWidth(_grid(_moreServices, context)) : _grid(_moreServices, context)),
      SliverToBoxAdapter(child: desktop ? _maxWidth(_section('KPK Specials', AppRoutes.explore)) : _section('KPK Specials', AppRoutes.explore)),
      SliverToBoxAdapter(child: desktop ? _maxWidth(_grid(_kpkServices, context)) : _grid(_kpkServices, context)),
      SliverToBoxAdapter(child: desktop ? _maxWidth(_highlights()) : _highlights()),
      const SliverToBoxAdapter(child: SizedBox(height: 110)),
    ]);
  }

  Widget _header(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    final desktop = _isDesktop(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(16, top + (desktop ? 16 : 12), 16, 0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // App bar row
        Row(children: [
          _Logo(),
          const SizedBox(width: 10),
          const Text('Khyber', style: TextStyle(fontFamily: 'Poppins', fontSize: 18, fontWeight: FontWeight.w800, color: AppColors.primary)),
          const Spacer(),
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.notifications),
            child: Container(width: 42, height: 42,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14),
                boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.07), blurRadius: 10, offset: const Offset(0, 3))]),
              child: const Icon(Icons.notifications_outlined, color: AppColors.textPrimary, size: 22))),
        ]),
        const SizedBox(height: 20),
        // Welcome card — contained, not full bleed
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF1A4D2E), Color(0xFF0D3B1E)],
              begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [BoxShadow(color: AppColors.primary.withValues(alpha: 0.25), blurRadius: 20, offset: const Offset(0, 8))],
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Obx(() => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(ctrl.greeting.value,
                style: const TextStyle(fontFamily: 'Poppins', fontSize: 13, color: Colors.white60)),
              const SizedBox(height: 2),
              Text(ctrl.userName.value,
                style: const TextStyle(fontFamily: 'Poppins', fontSize: 24, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -0.5)),
            ])),
            const SizedBox(height: 4),
            Row(children: [
              Container(width: 24, height: 3, decoration: BoxDecoration(color: AppColors.gold, borderRadius: BorderRadius.circular(2))),
              const SizedBox(width: 8),
              const Text("KPK's #1 Super App", style: TextStyle(fontFamily: 'Poppins', fontSize: 11, color: AppColors.gold, fontWeight: FontWeight.w600)),
            ]),
            const SizedBox(height: 18),
            GestureDetector(
              onTap: () => Get.find<HomeController>().changeTab(1),
              child: Container(height: 46, padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.18))),
                child: const Row(children: [
                  Icon(Icons.search_rounded, color: Colors.white54, size: 18),
                  SizedBox(width: 8),
                  Text('Search services in KPK...', style: TextStyle(fontFamily: 'Poppins', color: Colors.white54, fontSize: 13)),
                ]))),
          ]),
        ),
      ]),
    );
  }

  Widget _banners() {
    return Obx(() => SizedBox(height: 170,
      child: PageView.builder(
        padEnds: false,
        controller: PageController(viewportFraction: 0.88),
        itemCount: ctrl.banners.length,
        itemBuilder: (_, i) {
          final b = ctrl.banners[i];
          return GestureDetector(
            onTap: () => Get.toNamed(b['route']!),
            child: Container(
              margin: EdgeInsets.only(left: i == 0 ? 16 : 8, right: 8, top: 20, bottom: 4),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.12), blurRadius: 14, offset: const Offset(0, 5))]),
              child: ClipRRect(borderRadius: BorderRadius.circular(20),
                child: Stack(fit: StackFit.expand, children: [
                  CachedNetworkImage(imageUrl: b['image']!, fit: BoxFit.cover),
                  Container(decoration: BoxDecoration(gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black.withValues(alpha: 0.65)],
                    begin: Alignment.topCenter, end: Alignment.bottomCenter))),
                  Positioned(top: 0, left: 0, right: 0, child: Container(height: 3,
                    decoration: const BoxDecoration(gradient: LinearGradient(colors: [AppColors.gold, AppColors.primary])))),
                  Positioned(bottom: 14, left: 14, right: 14, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(b['title']!, style: const TextStyle(fontFamily: 'Poppins', color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 2),
                    Text(b['subtitle']!, style: TextStyle(fontFamily: 'Poppins', color: Colors.white.withValues(alpha: 0.8), fontSize: 11)),
                  ])),
                ])),
            ),
          );
        },
      ),
    ));
  }

  Widget _section(String title, String route) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
      child: Row(children: [
        Container(width: 4, height: 18, decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [AppColors.gold, AppColors.primary], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          borderRadius: BorderRadius.circular(2))),
        const SizedBox(width: 10),
        Expanded(child: Text(title, style: const TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w800, color: AppColors.textPrimary))),
        GestureDetector(
          onTap: () => Get.find<HomeController>().changeTab(1),
          child: Row(children: [
            Text('See all', style: TextStyle(fontFamily: 'Poppins', fontSize: 12, color: AppColors.primary.withValues(alpha: 0.8), fontWeight: FontWeight.w600)),
            const SizedBox(width: 2),
            Icon(Icons.arrow_forward_ios_rounded, size: 11, color: AppColors.primary.withValues(alpha: 0.8)),
          ])),
      ]),
    );
  }

  Widget _grid(List<Map<String, dynamic>> services, BuildContext context) {
    final cols = _cols(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: cols, mainAxisSpacing: 10, crossAxisSpacing: 8, childAspectRatio: 0.82),
        itemCount: services.length,
        itemBuilder: (_, i) {
          final s = services[i];
          final color = Color(s['color'] as int);
          return GestureDetector(
            onTap: () => Get.toNamed(s['route'] as String),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 8, offset: const Offset(0, 3))]),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(width: 52, height: 52,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [color, Color.lerp(color, Colors.black, 0.22)!],
                      begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [BoxShadow(color: color.withValues(alpha: 0.3), blurRadius: 8, offset: const Offset(0, 4))]),
                  child: Icon(s['icon'] as IconData, color: Colors.white, size: 24)),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(s['label'] as String, textAlign: TextAlign.center, maxLines: 2,
                    style: const TextStyle(fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w600, color: AppColors.textPrimary, height: 1.3))),
              ]),
            ),
          );
        },
      ),
    );
  }

  Widget _highlights() {
    final spots = [
      {'name': 'Khyber Pass',     'img': 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=300&h=200&fit=crop'},
      {'name': 'Peshawar Museum', 'img': 'https://images.unsplash.com/photo-1548013146-72479768bada?w=300&h=200&fit=crop'},
      {'name': 'Qissa Khwani',   'img': 'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?w=300&h=200&fit=crop'},
    ];
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
        child: Row(children: [
          Container(width: 4, height: 18, decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [AppColors.gold, AppColors.primary], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            borderRadius: BorderRadius.circular(2))),
          const SizedBox(width: 10),
          const Expanded(child: Text('KPK Highlights', style: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w800, color: AppColors.textPrimary))),
          GestureDetector(onTap: () => Get.toNamed(AppRoutes.tourism),
            child: Row(children: [
              Text('See all', style: TextStyle(fontFamily: 'Poppins', fontSize: 12, color: AppColors.primary.withValues(alpha: 0.8), fontWeight: FontWeight.w600)),
              const SizedBox(width: 2),
              Icon(Icons.arrow_forward_ios_rounded, size: 11, color: AppColors.primary.withValues(alpha: 0.8)),
            ])),
        ]),
      ),
      SizedBox(height: 145,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          itemCount: spots.length,
          itemBuilder: (_, i) => GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.tourism),
            child: Container(width: 185, margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(18),
                boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 10, offset: const Offset(0, 4))]),
              child: ClipRRect(borderRadius: BorderRadius.circular(18),
                child: Stack(fit: StackFit.expand, children: [
                  CachedNetworkImage(imageUrl: spots[i]['img']!, fit: BoxFit.cover),
                  Container(color: Colors.black.withValues(alpha: 0.25)),
                  Positioned(top: 0, left: 0, right: 0, child: Container(height: 2, color: AppColors.gold)),
                  Positioned(bottom: 12, left: 12, right: 12,
                    child: Text(spots[i]['name']!, style: const TextStyle(fontFamily: 'Poppins', color: Colors.white, fontSize: 13, fontWeight: FontWeight.w700))),
                ])))),
        )),
    ]);
  }
}

// ─── EXPLORE TAB ─────────────────────────────────────────────────────────────
class _ExploreTab extends StatelessWidget {
  const _ExploreTab();
  static const _all = [
    {'icon': Icons.restaurant_rounded,       'label': 'Food',         'color': 0xFFE67E22, 'route': AppRoutes.food},
    {'icon': Icons.shopping_basket_rounded,  'label': 'Grocery',      'color': 0xFF27AE60, 'route': AppRoutes.grocery},
    {'icon': Icons.local_pharmacy_rounded,   'label': 'Pharmacy',     'color': 0xFF2980B9, 'route': AppRoutes.pharmacy},
    {'icon': Icons.store_rounded,            'label': 'Shopping',     'color': 0xFF1A4D2E, 'route': AppRoutes.shopping},
    {'icon': Icons.directions_car_rounded,   'label': 'Transport',    'color': 0xFF8E44AD, 'route': AppRoutes.transport},
    {'icon': Icons.local_shipping_rounded,   'label': 'Courier',      'color': 0xFF1A6B72, 'route': AppRoutes.courier},
    {'icon': Icons.local_hospital_rounded,   'label': 'Hospitals',    'color': 0xFFC0392B, 'route': AppRoutes.hospitals},
    {'icon': Icons.account_balance_rounded,  'label': 'Govt',         'color': 0xFF2C3E50, 'route': AppRoutes.govtServices},
    {'icon': Icons.celebration_rounded,      'label': 'Events',       'color': 0xFFE67E22, 'route': AppRoutes.events},
    {'icon': Icons.park_rounded,             'label': 'Parks',        'color': 0xFF27AE60, 'route': AppRoutes.parks},
    {'icon': Icons.business_rounded,         'label': 'Businesses',   'color': 0xFF2C3E50, 'route': AppRoutes.businesses},
    {'icon': Icons.home_work_rounded,        'label': 'Real Estate',  'color': 0xFF2980B9, 'route': AppRoutes.realEstate},
    {'icon': Icons.sports_esports_rounded,   'label': 'Amusement',    'color': 0xFF8E44AD, 'route': AppRoutes.amusement},
    {'icon': Icons.school_rounded,           'label': 'Education',    'color': 0xFF16A085, 'route': AppRoutes.education},
    {'icon': Icons.warning_amber_rounded,    'label': 'Emergency',    'color': 0xFFC0392B, 'route': AppRoutes.emergency},
    {'icon': Icons.work_rounded,             'label': 'Jobs',         'color': 0xFF1A6B72, 'route': AppRoutes.jobs},
    {'icon': Icons.newspaper_rounded,        'label': 'News',         'color': 0xFF2980B9, 'route': AppRoutes.news},
    {'icon': Icons.landscape_rounded,        'label': 'Tourism',      'color': 0xFF16A085, 'route': AppRoutes.tourism},
    {'icon': Icons.auto_awesome_rounded,     'label': 'Crafts',       'color': 0xFFC9A227, 'route': AppRoutes.crafts},
    {'icon': Icons.hotel_rounded,            'label': 'Hotels',       'color': 0xFF1A6B72, 'route': AppRoutes.hotels},
    {'icon': Icons.medical_services_rounded, 'label': 'Home Nursing', 'color': 0xFF9B59B6, 'route': AppRoutes.homeNursing},
    {'icon': Icons.water_drop_rounded,       'label': 'Water & Gas',  'color': 0xFF2980B9, 'route': AppRoutes.waterGas},
    {'icon': Icons.inventory_2_rounded,      'label': 'Logistics',    'color': 0xFF7D3C98, 'route': AppRoutes.logistics},
  ];

  int _cols(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    if (w >= 1200) return 7; if (w >= 900) return 5; if (w >= 700) return 4; return 3;
  }

  @override
  Widget build(BuildContext context) {
    final cols = _cols(context);
    final desktop = _isDesktop(context);
    return CustomScrollView(slivers: [
      SliverAppBar(
        pinned: true, backgroundColor: Colors.white, elevation: 0,
        scrolledUnderElevation: 1,
        automaticallyImplyLeading: false,
        title: const Text('Explore KPK', style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w800, fontSize: 18, color: AppColors.textPrimary)),
        bottom: PreferredSize(preferredSize: const Size.fromHeight(56),
          child: Padding(padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Center(child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: desktop ? 800 : double.infinity),
              child: Container(height: 44, padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(color: AppColors.background, borderRadius: BorderRadius.circular(14), border: Border.all(color: AppColors.border)),
                child: const Row(children: [
                  Icon(Icons.search_rounded, color: AppColors.textHint, size: 18),
                  SizedBox(width: 8),
                  Text('Search all services...', style: TextStyle(fontFamily: 'Poppins', color: AppColors.textHint, fontSize: 13)),
                ])))))),
      ),
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 16),
        sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate((_, i) {
            final s = _all[i];
            final color = Color(s['color'] as int);
            return GestureDetector(
              onTap: () => Get.toNamed(s['route'] as String),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 8, offset: const Offset(0, 3))]),
                child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(width: 54, height: 54,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [color, Color.lerp(color, Colors.black, 0.22)!], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [BoxShadow(color: color.withValues(alpha: 0.28), blurRadius: 8, offset: const Offset(0, 3))]),
                    child: Icon(s['icon'] as IconData, color: Colors.white, size: 26)),
                  const SizedBox(height: 8),
                  Text(s['label'] as String, textAlign: TextAlign.center,
                    style: const TextStyle(fontFamily: 'Poppins', fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                ]),
              ),
            );
          }, childCount: _all.length),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: cols, mainAxisSpacing: 12, crossAxisSpacing: 10, childAspectRatio: 0.92),
        ),
      ),
      const SliverToBoxAdapter(child: SizedBox(height: 90)),
    ]);
  }
}