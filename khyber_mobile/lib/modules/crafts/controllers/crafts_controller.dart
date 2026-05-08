import 'package:get/get.dart';

class CraftProduct {
  final String id, name, artisan, craft, district, image, description;
  final double price, rating;
  const CraftProduct({required this.id, required this.name, required this.artisan, required this.craft, required this.district, required this.image, required this.description, required this.price, required this.rating});
}

class CraftsController extends GetxController {
  final selectedCraft = 'All'.obs;
  final searchQuery = ''.obs;
  final crafts = ['All', 'Pottery', 'Woodwork', 'Embroidery', 'Rugs', 'Jewelry', 'Leather', 'Copperwork'];

  final products = <CraftProduct>[
    CraftProduct(id: 'c1', name: 'Hand-painted Peshawar Pot', artisan: 'Khan Pottery', craft: 'Pottery', district: 'Peshawar', image: 'https://picsum.photos/seed/craft1/300/300', description: 'Traditional hand-painted clay pottery with Gandhara-inspired motifs.', price: 1500, rating: 4.8),
    CraftProduct(id: 'c2', name: 'Swati Embroidered Shawl', artisan: 'Swat Weavers', craft: 'Embroidery', district: 'Swat', image: 'https://picsum.photos/seed/craft2/300/300', description: 'Intricately embroidered shawl with traditional Swati patterns in bright colours.', price: 3500, rating: 4.9),
    CraftProduct(id: 'c3', name: 'Chitral Wool Rug', artisan: 'Chitral Artisans', craft: 'Rugs', district: 'Chitral', image: 'https://picsum.photos/seed/craft3/300/300', description: 'Handwoven wool rug from Chitral featuring geometric tribal patterns.', price: 8000, rating: 4.7),
    CraftProduct(id: 'c4', name: 'Carved Walnut Wood Box', artisan: 'Swat Woodworks', craft: 'Woodwork', district: 'Swat', image: 'https://picsum.photos/seed/craft4/300/300', description: 'Intricately carved walnut wood box from Swat Valley master craftsmen.', price: 2200, rating: 4.6),
    CraftProduct(id: 'c5', name: 'Silver Tribal Necklace', artisan: 'Peshawari Jewelers', craft: 'Jewelry', district: 'Peshawar', image: 'https://picsum.photos/seed/craft5/300/300', description: 'Handcrafted silver necklace with traditional Pashtun tribal designs.', price: 5500, rating: 4.8),
    CraftProduct(id: 'c6', name: 'Copper Chapati Plate', artisan: 'Swat Copper House', craft: 'Copperwork', district: 'Swat', image: 'https://picsum.photos/seed/craft6/300/300', description: 'Engraved copper plate used traditionally for serving bread.', price: 1800, rating: 4.5),
    CraftProduct(id: 'c7', name: 'Leather Handbag', artisan: 'Frontier Leather', craft: 'Leather', district: 'Peshawar', image: 'https://picsum.photos/seed/craft7/300/300', description: 'Handstitched genuine leather bag with embossed floral motifs.', price: 4200, rating: 4.4),
    CraftProduct(id: 'c8', name: 'Mardan Pottery Vase', artisan: 'Mardan Clay Arts', craft: 'Pottery', district: 'Mardan', image: 'https://picsum.photos/seed/craft8/300/300', description: 'Blue glazed pottery vase inspired by ancient Gandharan art traditions.', price: 2500, rating: 4.7),
  ].obs;

  List<CraftProduct> get filteredProducts => products.where((p) {
    final matchCraft = selectedCraft.value == 'All' || p.craft == selectedCraft.value;
    final matchSearch = searchQuery.value.isEmpty || p.name.toLowerCase().contains(searchQuery.value.toLowerCase());
    return matchCraft && matchSearch;
  }).toList();
}
