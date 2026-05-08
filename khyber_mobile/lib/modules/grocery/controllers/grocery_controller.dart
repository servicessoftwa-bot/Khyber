import 'package:get/get.dart';

class GroceryStore {
  final String id, name, area, deliveryTime, image;
  final double rating, deliveryFee, minOrder;
  final List<String> tags;
  const GroceryStore({
    required this.id, required this.name, required this.area,
    required this.deliveryTime, required this.image,
    required this.rating, required this.deliveryFee, required this.minOrder,
    required this.tags,
  });
}

class GroceryProduct {
  final String id, name, category, unit, image, storeId;
  final double price;
  const GroceryProduct({
    required this.id, required this.name, required this.category,
    required this.unit, required this.image, required this.storeId,
    required this.price,
  });
}

class GroceryController extends GetxController {
  final isLoading = false.obs;
  final selectedStore = Rxn<GroceryStore>();
  final selectedCategory = 'All'.obs;
  final searchQuery = ''.obs;
  final cart = <String, int>{}.obs;

  final stores = <GroceryStore>[
    GroceryStore(id: 's1', name: 'Metro Cash & Carry', area: 'Hayatabad, Peshawar', deliveryTime: '30-45 min', image: 'https://picsum.photos/seed/metro/400/200', rating: 4.6, deliveryFee: 80, minOrder: 500, tags: ['Supermarket', 'Deals']),
    GroceryStore(id: 's2', name: 'Imtiaz Super Store', area: 'University Road, Peshawar', deliveryTime: '25-40 min', image: 'https://picsum.photos/seed/imtiaz/400/200', rating: 4.4, deliveryFee: 60, minOrder: 300, tags: ['Supermarket', 'Desi']),
    GroceryStore(id: 's3', name: 'Al-Fatah Grocers', area: 'Saddar, Peshawar', deliveryTime: '20-35 min', image: 'https://picsum.photos/seed/alfatah/400/200', rating: 4.3, deliveryFee: 50, minOrder: 200, tags: ['Local', 'Fresh']),
    GroceryStore(id: 's4', name: 'Green Valley Mart', area: 'Phase 5, Hayatabad', deliveryTime: '35-50 min', image: 'https://picsum.photos/seed/greenvalley/400/200', rating: 4.5, deliveryFee: 70, minOrder: 400, tags: ['Organic', 'Fresh']),
    GroceryStore(id: 's5', name: 'Peshawar Bazaar Online', area: 'Qissa Khwani, Peshawar', deliveryTime: '40-60 min', image: 'https://picsum.photos/seed/peshbazaar/400/200', rating: 4.2, deliveryFee: 40, minOrder: 150, tags: ['Traditional', 'Spices']),
  ].obs;

  final products = <GroceryProduct>[
    GroceryProduct(id: 'p1', name: 'Basmati Rice 5kg', category: 'Grains', unit: 'bag', image: 'https://picsum.photos/seed/rice/200/200', storeId: 's1', price: 850),
    GroceryProduct(id: 'p2', name: 'Fresh Tomatoes', category: 'Vegetables', unit: 'kg', image: 'https://picsum.photos/seed/tomato/200/200', storeId: 's1', price: 120),
    GroceryProduct(id: 'p3', name: 'Whole Wheat Flour 10kg', category: 'Grains', unit: 'bag', image: 'https://picsum.photos/seed/flour/200/200', storeId: 's1', price: 1200),
    GroceryProduct(id: 'p4', name: 'Fresh Onions', category: 'Vegetables', unit: 'kg', image: 'https://picsum.photos/seed/onion/200/200', storeId: 's1', price: 80),
    GroceryProduct(id: 'p5', name: 'Desi Ghee 1kg', category: 'Dairy', unit: 'tin', image: 'https://picsum.photos/seed/ghee/200/200', storeId: 's1', price: 2200),
    GroceryProduct(id: 'p6', name: 'Full Cream Milk 1L', category: 'Dairy', unit: 'liter', image: 'https://picsum.photos/seed/milk/200/200', storeId: 's1', price: 190),
    GroceryProduct(id: 'p7', name: 'Chicken Eggs 12pcs', category: 'Eggs', unit: 'dozen', image: 'https://picsum.photos/seed/eggs/200/200', storeId: 's2', price: 320),
    GroceryProduct(id: 'p8', name: 'Fresh Potatoes', category: 'Vegetables', unit: 'kg', image: 'https://picsum.photos/seed/potato/200/200', storeId: 's2', price: 90),
    GroceryProduct(id: 'p9', name: 'Mixed Spices Pack', category: 'Spices', unit: 'pack', image: 'https://picsum.photos/seed/spice/200/200', storeId: 's2', price: 450),
    GroceryProduct(id: 'p10', name: 'Green Chilies', category: 'Vegetables', unit: 'kg', image: 'https://picsum.photos/seed/chili/200/200', storeId: 's3', price: 200),
    GroceryProduct(id: 'p11', name: 'Dal Chana 1kg', category: 'Pulses', unit: 'kg', image: 'https://picsum.photos/seed/daal/200/200', storeId: 's3', price: 280),
    GroceryProduct(id: 'p12', name: 'Cooking Oil 5L', category: 'Oil', unit: 'can', image: 'https://picsum.photos/seed/oil/200/200', storeId: 's4', price: 1750),
    GroceryProduct(id: 'p13', name: 'Garlic 500g', category: 'Vegetables', unit: 'pack', image: 'https://picsum.photos/seed/garlic/200/200', storeId: 's4', price: 150),
    GroceryProduct(id: 'p14', name: 'Ginger 500g', category: 'Vegetables', unit: 'pack', image: 'https://picsum.photos/seed/ginger/200/200', storeId: 's4', price: 130),
    GroceryProduct(id: 'p15', name: 'Black Pepper 100g', category: 'Spices', unit: 'pack', image: 'https://picsum.photos/seed/pepper/200/200', storeId: 's5', price: 180),
  ].obs;

  final categories = ['All', 'Vegetables', 'Grains', 'Dairy', 'Eggs', 'Spices', 'Pulses', 'Oil'];

  List<GroceryProduct> get filteredProducts {
    final store = selectedStore.value;
    if (store == null) return [];
    return products.where((p) {
      final matchStore = p.storeId == store.id;
      final matchCat = selectedCategory.value == 'All' || p.category == selectedCategory.value;
      final matchSearch = searchQuery.value.isEmpty || p.name.toLowerCase().contains(searchQuery.value.toLowerCase());
      return matchStore && matchCat && matchSearch;
    }).toList();
  }

  void selectStore(GroceryStore store) {
    selectedStore.value = store;
    cart.clear();
    selectedCategory.value = 'All';
  }

  void addToCart(String id) { cart[id] = (cart[id] ?? 0) + 1; cart.refresh(); }

  void removeFromCart(String id) {
    final qty = cart[id] ?? 0;
    if (qty <= 1) { cart.remove(id); } else { cart[id] = qty - 1; }
    cart.refresh();
  }

  int itemQty(String id) => cart[id] ?? 0;
  int get cartCount => cart.values.fold(0, (a, b) => a + b);

  double get cartTotal {
    double total = 0;
    cart.forEach((id, qty) {
      final p = products.firstWhereOrNull((p) => p.id == id);
      if (p != null) total += p.price * qty;
    });
    return total;
  }
}
