import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class FaqItem {
  final String question, answer;
  bool isExpanded;
  FaqItem({required this.question, required this.answer, this.isExpanded = false});
}

class SupportController extends GetxController {
  final isLoading = false.obs;

  final faqs = <FaqItem>[
    FaqItem(question: 'How do I track my order?', answer: 'Go to My Orders in your profile. Each order shows real-time status — Pending, Preparing, In Transit, or Delivered. For courier shipments, your tracking number is shown after booking.'),
    FaqItem(question: 'How does the wallet work?', answer: 'Your KPK Wallet lets you store balance for faster checkout. Top up via EasyPaisa, JazzCash, or bank transfer. Every food or grocery order may earn you cashback which is credited automatically.'),
    FaqItem(question: 'How do I book a home nurse?', answer: 'Open Home Nursing, choose a service (e.g. Wound Care, Physiotherapy), tap Book This Service, fill in patient details and preferred date, then confirm. A nurse will call you to confirm the visit.'),
    FaqItem(question: 'Can I cancel an order?', answer: 'Orders can be cancelled before they enter the "Preparing" stage. Go to My Orders, find the order, and tap Cancel. Refunds are processed to your wallet within 2-3 business days.'),
    FaqItem(question: 'How do I list my business?', answer: 'Email us at vendors@khyberapp.pk with your business name, type, location, and contact. Our team will review and list your business within 24-48 hours.'),
    FaqItem(question: 'What areas does KPK App cover?', answer: 'We currently cover all major districts of KPK including Peshawar, Mardan, Abbottabad, Swat, Kohat, Bannu, Dera Ismail Khan, Chitral, and Mansehra. More areas are being added continuously.'),
    FaqItem(question: 'Is my payment information secure?', answer: 'Yes. We use industry-standard encryption for all transactions. We never store your card details — payments are processed via EasyPaisa and JazzCash secure gateways.'),
  ].obs;

  void toggleFaq(int index) {
    faqs[index].isExpanded = !faqs[index].isExpanded;
    faqs.refresh();
  }

  Future<void> callSupport() async {
    final uri = Uri.parse('tel:+923001234567');
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  Future<void> emailSupport() async {
    final uri = Uri.parse('mailto:support@khyberapp.pk');
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }
}
