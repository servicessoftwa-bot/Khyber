import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/theme/app_colors.dart';

class EmergencyContact {
  final String name, number, category, description;
  final IconData icon;
  final Color color;
  const EmergencyContact({required this.name, required this.number, required this.category, required this.description, required this.icon, required this.color});
}

class EmergencyView extends StatelessWidget {
  const EmergencyView({super.key});

  static const contacts = [
    EmergencyContact(name: 'Police', number: '15', category: 'Security', description: 'KPK Police emergency helpline', icon: Icons.local_police_rounded, color: Color(0xFF1565C0)),
    EmergencyContact(name: 'Rescue 1122', number: '1122', category: 'Rescue', description: 'Emergency rescue and ambulance', icon: Icons.emergency_rounded, color: Color(0xFFB71C1C)),
    EmergencyContact(name: 'Fire Brigade', number: '16', category: 'Fire', description: 'Fire department emergency', icon: Icons.local_fire_department_rounded, color: Color(0xFFE65100)),
    EmergencyContact(name: 'Edhi Foundation', number: '115', category: 'Ambulance', description: 'Edhi ambulance service', icon: Icons.medical_services_rounded, color: Color(0xFF2E7D32)),
    EmergencyContact(name: 'WAPDA Helpline', number: '118', category: 'Utility', description: 'Electricity fault and emergency', icon: Icons.electrical_services_rounded, color: Color(0xFFF9A825)),
    EmergencyContact(name: 'Gas Emergency', number: '1199', category: 'Utility', description: 'SNGPL gas leakage emergency', icon: Icons.gas_meter_rounded, color: Color(0xFF6A1B9A)),
    EmergencyContact(name: 'LRH Hospital', number: '091-9211300', category: 'Hospital', description: 'Lady Reading Hospital Peshawar', icon: Icons.local_hospital_rounded, color: Color(0xFF00695C)),
    EmergencyContact(name: 'KPK Disaster', number: '1700', category: 'Disaster', description: 'Provincial Disaster Management Authority', icon: Icons.warning_rounded, color: Color(0xFF4E342E)),
  ];

  Future<void> _call(String number) async {
    final uri = Uri.parse('tel:$number');
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final hPad = w > 1100 ? (w - 1100) / 2 + 16 : 16.0;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: 160, pinned: true, backgroundColor: const Color(0xFFB71C1C),
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white), onPressed: () => Get.back()),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xFFB71C1C), Color(0xFF7F0000)], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: SafeArea(child: Padding(padding: const EdgeInsets.fromLTRB(20, 32, 20, 16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Emergency', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('KPK emergency helpline numbers', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70)),
              ]))),
            ),
          ),
        ),
        SliverToBoxAdapter(child: Padding(padding: EdgeInsets.fromLTRB(hPad, 16, hPad, 24), child: Container(
          padding: EdgeInsets.fromLTRB(hPad, 16, hPad, 24), decoration: BoxDecoration(color: const Color(0xFFFFEBEE), borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFFEF9A9A))),
          child: Row(children: [const Icon(Icons.info_outline_rounded, color: Color(0xFFB71C1C)), const SizedBox(width: 12),
            const Expanded(child: Text('In case of life-threatening emergency, call immediately. Stay calm and provide your location.', style: TextStyle(fontSize: 13, color: Color(0xFFB71C1C), height: 1.4)))]),
        ))),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(hPad, 0, hPad, 24),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate((context, i) {
              final c = contacts[i];
              return GestureDetector(onTap: () => _call(c.number), child: Container(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: c.color.withOpacity(0.12), blurRadius: 12, offset: const Offset(0, 4))]),
                child: Padding(padding: EdgeInsets.fromLTRB(hPad, 16, hPad, 24), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(width: 52, height: 52, decoration: BoxDecoration(color: c.color.withOpacity(0.1), shape: BoxShape.circle),
                    child: Icon(c.icon, color: c.color, size: 28)),
                  const SizedBox(height: 10),
                  Text(c.name, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.textPrimary)),
                  const SizedBox(height: 4),
                  Text(c.number, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: c.color)),
                  const SizedBox(height: 4),
                  Text(c.description, textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                  const SizedBox(height: 10),
                  Container(width: double.infinity, padding: const EdgeInsets.symmetric(vertical: 7),
                    decoration: BoxDecoration(color: c.color, borderRadius: BorderRadius.circular(10)),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [const Icon(Icons.call_rounded, color: Colors.white, size: 14), const SizedBox(width: 6), const Text('Call Now', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12))])),
                ])),
              ));
            }, childCount: contacts.length),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 0.78),
          ),
        ),
      ]),
    );
  }
}

