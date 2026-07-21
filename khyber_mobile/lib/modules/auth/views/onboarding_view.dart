import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../core/theme/app_colors.dart';
import '../../../app/routes/app_routes.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});
  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final _controller = PageController();
  int _page = 0;

  final _pages = const [
    _OBPage(
      icon: Icons.explore_rounded,
      title: 'Discover KPK',
      subtitle: 'Explore Peshawar and beyond — food, services, culture and more at your fingertips.',
      color: AppColors.primary,
    ),
    _OBPage(
      icon: Icons.apps_rounded,
      title: 'Everything at Hand',
      subtitle: 'Transport, healthcare, education, govt services — all in one powerful app.',
      color: AppColors.accent,
    ),
    _OBPage(
      icon: Icons.auto_awesome_rounded,
      title: 'KPK Heritage',
      subtitle: 'Discover Khyber Pass, Peshawari crafts, local artisans and historic sites.',
      color: AppColors.gold,
    ),
  ];

  void _next() {
    if (_page < _pages.length - 1) {
      _controller.nextPage(duration: const Duration(milliseconds: 350), curve: Curves.easeInOut);
    } else {
      GetStorage().write('onboarding_seen', true);
      Get.offAllNamed(AppRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  GetStorage().write('onboarding_seen', true);
                  Get.offAllNamed(AppRoutes.home);
                },
                child: const Text('Skip', style: TextStyle(color: AppColors.textSecondary)),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (i) => setState(() => _page = i),
                children: _pages,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_pages.length, (i) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _page == i ? 24 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _page == i ? AppColors.primary : AppColors.border,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    )),
                  ),
                  const SizedBox(height: 28),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: _next,
                      child: Text(_page == _pages.length - 1 ? 'Get Started' : 'Next'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OBPage extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  const _OBPage({required this.icon, required this.title, required this.subtitle, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(36),
            ),
            child: Icon(icon, size: 60, color: color),
          ),
          const SizedBox(height: 40),
          Text(title, style: const TextStyle(fontFamily: 'Poppins', fontSize: 28, fontWeight: FontWeight.w700, color: AppColors.textPrimary), textAlign: TextAlign.center),
          const SizedBox(height: 16),
          Text(subtitle, style: const TextStyle(fontFamily: 'Poppins', fontSize: 15, color: AppColors.textSecondary, height: 1.6), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
