import 'package:get/get.dart';

class ShopCategory {
  final String id, name, icon;
  const ShopCategory({required this.id, required this.name, required this.icon});
}

class ShopProduct {
  final String id, name, shop, category, image;
  final double price, originalPrice, rating;
  final bool inStock;
  const ShopProduct({required this.id, required this.name, required this.shop, required this.category, required this.image, required this.price, required this.originalPrice, required this.rating, required this.inStock});
}

class ShoppingController extends GetxController {
  final selectedCategory = 'All'.obs;
  final searchQuery = ''.obs;
  final cart = <String, int>{}.obs;

  final categories = ['All', 'Clothing', 'Electronics', 'Footwear', 'Accessories', 'Home', 'Sports', 'Gifts'];

  final products = <ShopProduct>[
    ShopProduct(id: 'sp1', name: 'Shalwar Kameez (Stitched)', shop: 'Karkhano Mart', category: 'Clothing', image: 'https://picsum.photos/seed/shop1/300/300', price: 2500, originalPrice: 3200, rating: 4.7, inStock: true),
    ShopProduct(id: 'sp2', name: 'Peshawari Chappal', shop: 'Qissa Khwani Shoes', category: 'Footwear', image: 'https://picsum.photos/seed/shop2/300/300', price: 1800, originalPrice: 1800, rating: 4.9, inStock: true),
    ShopProduct(id: 'sp3', name: 'Samsung Galaxy A55', shop: 'Tech Bazaar Peshawar', category: 'Electronics', image: 'https://picsum.photos/seed/shop3/300/300', price: 89000, originalPrice: 95000, rating: 4.5, inStock: true),
    ShopProduct(id: 'sp4', name: 'Wool Pakol Hat', shop: 'Chitral Crafts', category: 'Accessories', image: 'https://picsum.photos/seed/shop4/300/300', price: 850, originalPrice: 1000, rating: 4.8, inStock: true),
    ShopProduct(id: 'sp5', name: 'Khyber Embroidered Shirt', shop: 'Swat Textile', category: 'Clothing', image: 'https://picsum.photos/seed/shop5/300/300', price: 1600, originalPrice: 2000, rating: 4.6, inStock: true),
    ShopProduct(id: 'sp6', name: 'Cricket Bat (Kashmir Willow)', shop: 'Sports Arena Peshawar', category: 'Sports', image: 'https://picsum.photos/seed/shop6/300/300', price: 3500, originalPrice: 3500, rating: 4.4, inStock: true),
    ShopProduct(id: 'sp7', name: 'Laptop Stand + Cooling Pad', shop: 'Tech Bazaar Peshawar', category: 'Electronics', image: 'https://picsum.photos/seed/shop7/300/300', price: 2200, originalPrice: 2800, rating: 4.3, inStock: false),
    ShopProduct(id: 'sp8', name: 'Handmade Copper Teapot', shop: 'Swat Copper House', category: 'Home', image: 'https://picsum.photos/seed/shop8/300/300', price: 3200, originalPrice: 3800, rating: 4.7, inStock: true),
    ShopProduct(id: 'sp9', name: 'Pashtun Tribal Bracelet', shop: 'Saddar Jewelry', category: 'Accessories', image: 'https://picsum.photos/seed/shop9/300/300', price: 1200, originalPrice: 1500, rating: 4.5, inStock: true),
    ShopProduct(id: 'sp10', name: 'Traditional Wooden Frame', shop: 'Karkhano Mart', category: 'Gifts', image: 'https://picsum.photos/seed/shop10/300/300', price: 950, originalPrice: 950, rating: 4.6, inStock: true),
  ].obs;

  List<ShopProduct> get filteredProducts => products.where((p) {
    final matchCat = selectedCategory.value == 'All' || p.category == selectedCategory.value;
    final matchSearch = searchQuery.value.isEmpty || p.name.toLowerCase().contains(searchQuery.value.toLowerCase());
    return matchCat && matchSearch;
  }).toList();

  void addToCart(String id) { cart[id] = (cart[id] ?? 0) + 1; cart.refresh(); }
  void removeFromCart(String id) { final q = cart[id] ?? 0; if (q <= 1) { cart.remove(id); } else { cart[id] = q - 1; } cart.refresh(); }
  int itemQty(String id) => cart[id] ?? 0;
  int get cartCount => cart.values.fold(0, (a, b) => a + b);
  double get cartTotal { double t = 0; cart.forEach((id, qty) { final p = products.firstWhereOrNull((p) => p.id == id); if (p != null) t += p.price * qty; }); return t; }
}
