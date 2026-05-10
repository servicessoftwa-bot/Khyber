import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/support_controller.dart';

class SupportView extends GetView<SupportController> {
  const SupportView({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final hPad = w > 1100 ? (w - 1100) / 2 + 16 : 16.0;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 160,
            pinned: true,
            backgroundColor: const Color(0xFF2980B9),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
              onPressed: () => Get.back(),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF2980B9), Color(0xFF1A5276)],
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
                        Text('Help & Support',
                          style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text('How can we help you?',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(padding: EdgeInsets.fromLTRB(hPad, 16, hPad, 24), sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Contact options
                Row(children: [
                  _ContactCard(Icons.phone_rounded, 'Call Us', '0300-KHYBER', const Color(0xFF27AE60), controller.callSupport),
                  const SizedBox(width: 10),
                  _ContactCard(Icons.email_rounded, 'Email Us', 'support@khyberapp.pk', const Color(0xFF2980B9), controller.emailSupport),
                  const SizedBox(width: 10),
                  _ContactCard(Icons.chat_rounded, 'Live Chat', 'Available 9-5', const Color(0xFF8E44AD), () {}),
                ]),
                const SizedBox(height: 20),

                // Response time banner
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2980B9).withOpacity(0.07),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF2980B9).withOpacity(0.2)),
                  ),
                  child: Row(children: [
                    const Icon(Icons.schedule_rounded, color: Color(0xFF2980B9), size: 20),
                    const SizedBox(width: 10),
                    const Expanded(child: Text('Average response time: under 2 hours\nAvailable 9 AM – 11 PM daily',
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 12, color: Color(0xFF2980B9), height: 1.5))),
                  ]),
                ),
                const SizedBox(height: 24),

                // FAQ
                const Text('Frequently Asked Questions',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                const SizedBox(height: 12),
                Obx(() => Column(
                  children: List.generate(controller.faqs.length, (i) {
                    final faq = controller.faqs[i];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: faq.isExpanded
                              ? const Color(0xFF2980B9).withOpacity(0.3)
                              : AppColors.border),
                      ),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () => controller.toggleFaq(i),
                            borderRadius: BorderRadius.circular(14),
                            child: Padding(
                              padding: const EdgeInsets.all(14),
                              child: Row(children: [
                                Expanded(child: Text(faq.question,
                                  style: TextStyle(
                                    fontFamily: 'Poppins', fontSize: 13, fontWeight: FontWeight.w600,
                                    color: faq.isExpanded ? const Color(0xFF2980B9) : AppColors.textPrimary))),
                                Icon(faq.isExpanded
                                    ? Icons.keyboard_arrow_up_rounded
                                    : Icons.keyboard_arrow_down_rounded,
                                  color: faq.isExpanded ? const Color(0xFF2980B9) : AppColors.textHint),
                              ]),
                            ),
                          ),
                          if (faq.isExpanded)
                            Padding(
                              padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
                              child: Text(faq.answer,
                                style: const TextStyle(fontFamily: 'Poppins', fontSize: 12,
                                  color: AppColors.textSecondary, height: 1.6)),
                            ),
                        ],
                      ),
                    );
                  }),
                )),
                const SizedBox(height: 20),

                // Still need help
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF2980B9), Color(0xFF1A5276)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(children: [
                    const Icon(Icons.headset_mic_rounded, color: Colors.white, size: 32),
                    const SizedBox(height: 10),
                    const Text('Still need help?',
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 4),
                    Text('Our support team is ready to assist you',
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 12, color: Colors.white.withOpacity(0.8))),
                    const SizedBox(height: 14),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: controller.callSupport,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF2980B9),
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          textStyle: const TextStyle(fontFamily: 'Poppins', fontSize: 13, fontWeight: FontWeight.w600),
                        ),
                        child: const Text('Call Support Now'),
                      ),
                    ),
                  ]),
                ),
                const SizedBox(height: 24),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;
  final Color color;
  final VoidCallback onTap;
  const _ContactCard(this.icon, this.title, this.subtitle, this.color, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.07),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: color.withOpacity(0.2)),
          ),
          child: Column(children: [
            Icon(icon, size: 24, color: color),
            const SizedBox(height: 6),
            Text(title, style: TextStyle(fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w700, color: color)),
            const SizedBox(height: 2),
            Text(subtitle, textAlign: TextAlign.center,
              style: const TextStyle(fontFamily: 'Poppins', fontSize: 9, color: AppColors.textSecondary)),
          ]),
        ),
      ),
    );
  }
}

