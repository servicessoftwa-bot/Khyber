import 'package:get/get.dart';

class Pharmacy {
  final String id, name, area, image, phone;
  final double rating;
  final bool isOpen, delivery;
  final List<String> tags;
  const Pharmacy({required this.id, required this.name, required this.area, required this.image, required this.phone, required this.rating, required this.isOpen, required this.delivery, required this.tags});
}

class Medicine {
  final String id, name, brand, category, image, pharmacyId;
  final double price;
  final bool requiresPrescription;
  const Medicine({required this.id, required this.name, required this.brand, required this.category, required this.image, required this.pharmacyId, required this.price, required this.requiresPrescription});
}

class PharmacyController extends GetxController {
  final selectedPharmacy = Rxn<Pharmacy>();
  final selectedCategory = 'All'.obs;
  final searchQuery = ''.obs;
  final cart = <String, int>{}.obs;

  final pharmacies = <Pharmacy>[
    Pharmacy(id: 'ph1', name: 'Khyber Medical Store', area: 'Saddar, Peshawar', image: 'https://picsum.photos/seed/pharma1/400/200', phone: '091-1234567', rating: 4.7, isOpen: true, delivery: true, tags: ['24/7', 'Delivery']),
    Pharmacy(id: 'ph2', name: 'Hayatabad Pharmacy', area: 'Phase 4, Hayatabad', image: 'https://picsum.photos/seed/pharma2/400/200', phone: '091-7654321', rating: 4.5, isOpen: true, delivery: true, tags: ['Delivery', 'Generic']),
    Pharmacy(id: 'ph3', name: 'City Medicals', area: 'University Road, Peshawar', image: 'https://picsum.photos/seed/pharma3/400/200', phone: '091-9876543', rating: 4.3, isOpen: false, delivery: false, tags: ['Branded']),
    Pharmacy(id: 'ph4', name: 'Al-Shifa Drug Store', area: 'Cantt, Peshawar', image: 'https://picsum.photos/seed/pharma4/400/200', phone: '091-5432198', rating: 4.6, isOpen: true, delivery: true, tags: ['24/7', 'Homeopathic']),
  ].obs;

  final medicines = <Medicine>[
    Medicine(id: 'm1', name: 'Panadol 500mg', brand: 'GSK', category: 'Pain Relief', image: 'https://picsum.photos/seed/med1/200/200', pharmacyId: 'ph1', price: 45, requiresPrescription: false),
    Medicine(id: 'm2', name: 'Augmentin 625mg', brand: 'GSK', category: 'Antibiotics', image: 'https://picsum.photos/seed/med2/200/200', pharmacyId: 'ph1', price: 320, requiresPrescription: true),
    Medicine(id: 'm3', name: 'Brufen 400mg', brand: 'Abbott', category: 'Pain Relief', image: 'https://picsum.photos/seed/med3/200/200', pharmacyId: 'ph1', price: 85, requiresPrescription: false),
    Medicine(id: 'm4', name: 'Metformin 500mg', brand: 'Searle', category: 'Diabetes', image: 'https://picsum.photos/seed/med4/200/200', pharmacyId: 'ph2', price: 120, requiresPrescription: true),
    Medicine(id: 'm5', name: 'Vitamin C 1000mg', brand: 'Nutrifactor', category: 'Vitamins', image: 'https://picsum.photos/seed/med5/200/200', pharmacyId: 'ph2', price: 280, requiresPrescription: false),
    Medicine(id: 'm6', name: 'ORS Sachets x10', brand: 'AGP', category: 'Supplements', image: 'https://picsum.photos/seed/med6/200/200', pharmacyId: 'ph2', price: 65, requiresPrescription: false),
    Medicine(id: 'm7', name: 'Atorvastatin 20mg', brand: 'Pfizer', category: 'Heart', image: 'https://picsum.photos/seed/med7/200/200', pharmacyId: 'ph3', price: 450, requiresPrescription: true),
    Medicine(id: 'm8', name: 'Omeprazole 20mg', brand: 'Hilton', category: 'Gastro', image: 'https://picsum.photos/seed/med8/200/200', pharmacyId: 'ph4', price: 95, requiresPrescription: false),
  ].obs;

  final categories = ['All', 'Pain Relief', 'Antibiotics', 'Vitamins', 'Diabetes', 'Heart', 'Gastro', 'Supplements'];

  List<Medicine> get filteredMedicines {
    final ph = selectedPharmacy.value;
    if (ph == null) return [];
    return medicines.where((m) {
      final matchPh = m.pharmacyId == ph.id;
      final matchCat = selectedCategory.value == 'All' || m.category == selectedCategory.value;
      final matchSearch = searchQuery.value.isEmpty || m.name.toLowerCase().contains(searchQuery.value.toLowerCase());
      return matchPh && matchCat && matchSearch;
    }).toList();
  }

  void selectPharmacy(Pharmacy ph) { selectedPharmacy.value = ph; cart.clear(); selectedCategory.value = 'All'; }
  void addToCart(String id) { cart[id] = (cart[id] ?? 0) + 1; cart.refresh(); }
  void removeFromCart(String id) { final q = cart[id] ?? 0; if (q <= 1) { cart.remove(id); } else { cart[id] = q - 1; } cart.refresh(); }
  int itemQty(String id) => cart[id] ?? 0;
  int get cartCount => cart.values.fold(0, (a, b) => a + b);
  double get cartTotal { double t = 0; cart.forEach((id, qty) { final m = medicines.firstWhereOrNull((m) => m.id == id); if (m != null) t += m.price * qty; }); return t; }
}
