import 'package:get/get.dart';

class Business {
  final String id, name, category, area, phone, description, image;
  final double rating;
  final bool isVerified, isOpen;
  final List<String> tags;
  const Business({
    required this.id, required this.name, required this.category,
    required this.area, required this.phone, required this.description,
    required this.image, required this.rating, required this.isVerified,
    required this.isOpen, required this.tags,
  });
}

class BusinessesController extends GetxController {
  final selectedCategory = 'All'.obs;
  final searchQuery = ''.obs;

  final categories = ['All', 'Food', 'Retail', 'Services', 'Health', 'Education', 'Tech', 'Crafts'];

  final businesses = <Business>[
    Business(id: 'b1', name: 'Khyber Darbar Restaurant', category: 'Food', area: 'Saddar, Peshawar', phone: '091-1234567', description: 'Authentic Peshawari cuisine — Chapli Kabab, Karahi, and traditional breads since 1985.', image: 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=400&h=200&fit=crop', rating: 4.7, isVerified: true, isOpen: true, tags: ['Dine-in', 'Takeaway', 'Delivery']),
    Business(id: 'b2', name: 'Metro Cash & Carry', category: 'Retail', area: 'Hayatabad, Peshawar', phone: '091-9876543', description: 'KPK largest wholesale and retail store with over 10,000 products at competitive prices.', image: 'https://images.unsplash.com/photo-1534723452862-4c874986ebad?w=400&h=200&fit=crop', rating: 4.5, isVerified: true, isOpen: true, tags: ['Wholesale', 'Retail', 'Grocery']),
    Business(id: 'b3', name: 'Tech Peshawar Hub', category: 'Tech', area: 'University Road, Peshawar', phone: '0300-1111222', description: 'IT training, software development, and tech startup incubation center for KPK youth.', image: 'https://images.unsplash.com/photo-1519389950473-47ba0277781c?w=400&h=200&fit=crop', rating: 4.8, isVerified: true, isOpen: true, tags: ['Training', 'Software', 'Startup']),
    Business(id: 'b4', name: 'Al-Shifa Medical Complex', category: 'Health', area: 'Kohat Road, Peshawar', phone: '091-5554321', description: 'Multi-specialty hospital with 24/7 emergency, OPD, diagnostic labs, and pharmacy.', image: 'https://images.unsplash.com/photo-1586773860418-d37222d8fce3?w=400&h=200&fit=crop', rating: 4.6, isVerified: true, isOpen: true, tags: ['Hospital', '24/7', 'Lab']),
    Business(id: 'b5', name: 'Frontier Sweets', category: 'Food', area: 'Qissa Khwani, Peshawar', phone: '091-2223344', description: 'Famous for Peshawari ice cream, Mithai, and traditional sweets made from pure ingredients.', image: 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=400&h=200&fit=crop', rating: 4.9, isVerified: true, isOpen: true, tags: ['Sweets', 'Ice Cream', 'Traditional']),
    Business(id: 'b6', name: 'KPK Handloom Crafts', category: 'Crafts', area: 'Bara Market, Peshawar', phone: '0333-4445556', description: 'Authentic Peshawari chappals, Chitral wool shawls, and hand-woven fabrics exported worldwide.', image: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=200&fit=crop', rating: 4.4, isVerified: false, isOpen: true, tags: ['Handmade', 'Export', 'Traditional']),
    Business(id: 'b7', name: 'Gandhara Academy', category: 'Education', area: 'Warsak Road, Peshawar', phone: '091-7778899', description: 'Private school offering O-Level, A-Level, and HSSC programs with state-of-the-art facilities.', image: 'https://images.unsplash.com/photo-1580582932707-520aed937b7b?w=400&h=200&fit=crop', rating: 4.5, isVerified: true, isOpen: false, tags: ['O-Level', 'A-Level', 'HSSC']),
    Business(id: 'b8', name: 'Peshawar Auto Services', category: 'Services', area: 'Ring Road, Peshawar', phone: '0311-9990001', description: 'Complete vehicle repair, servicing, and car wash facility with certified mechanics.', image: 'https://images.unsplash.com/photo-1503376780353-7e6692767b70?w=400&h=200&fit=crop', rating: 4.3, isVerified: false, isOpen: true, tags: ['Repair', 'Service', 'Car Wash']),
    Business(id: 'b9', name: 'Digital Marketing KPK', category: 'Tech', area: 'Cantt, Peshawar', phone: '0323-1112223', description: 'Social media management, SEO, website development, and digital advertising for local businesses.', image: 'https://images.unsplash.com/photo-1460925895917-afdab827c52f?w=400&h=200&fit=crop', rating: 4.6, isVerified: true, isOpen: true, tags: ['SEO', 'Social Media', 'Web']),
    Business(id: 'b10', name: 'Noor Tailor & Boutique', category: 'Retail', area: 'Namak Mandi, Peshawar', phone: '0345-6667778', description: 'Custom stitching for traditional and modern wear — Shalwar Kameez, Sherwanis, and Ladies outfits.', image: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=200&fit=crop', rating: 4.4, isVerified: false, isOpen: true, tags: ['Tailoring', 'Traditional', 'Custom']),
  ].obs;

  List<Business> get filtered => businesses.where((b) {
    final matchCat = selectedCategory.value == 'All' || b.category == selectedCategory.value;
    final matchSearch = searchQuery.value.isEmpty || b.name.toLowerCase().contains(searchQuery.value.toLowerCase()) || b.area.toLowerCase().contains(searchQuery.value.toLowerCase());
    return matchCat && matchSearch;
  }).toList();
}