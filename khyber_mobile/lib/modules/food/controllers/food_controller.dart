import 'package:get/get.dart';
import '../models/food_model.dart';

class FoodController extends GetxController {
  final isLoading      = false.obs;
  final searchQuery    = ''.obs;
  final selectedFilter = 'All'.obs;
  final cart           = <CartItem>[].obs;

  final filters = ['All', 'Deals', 'Fast Food', 'Desi', 'BBQ', 'Karahi', 'Biryani', 'Breakfast'];

  final restaurants = <RestaurantModel>[
    RestaurantModel(
      id: '1', name: 'Peshawari Charsi Tikka', cuisine: 'BBQ & Karahi',
      image: 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=600&h=400&fit=crop',
      rating: 4.9, reviews: 1240, deliveryTime: 35, deliveryFee: 50, minOrder: 500,
      tags: ['BBQ', 'Karahi', 'Popular'],
    ),
    RestaurantModel(
      id: '2', name: 'Namak Mandi Karahi House', cuisine: 'Karahi & Desi',
      image: 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=600&h=400&fit=crop',
      rating: 4.8, reviews: 980, deliveryTime: 40, deliveryFee: 60, minOrder: 600,
      tags: ['Karahi', 'Desi', 'BBQ'],
    ),
    RestaurantModel(
      id: '3', name: 'Khyber Biryani Corner', cuisine: 'Biryani & Rice',
      image: 'https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=600&h=400&fit=crop',
      rating: 4.6, reviews: 754, deliveryTime: 25, deliveryFee: 40, minOrder: 300,
      tags: ['Biryani', 'Deals'],
    ),
    RestaurantModel(
      id: '4', name: 'Frontier Chapli Kabab', cuisine: 'Kabab & Fast Food',
      image: 'https://images.unsplash.com/photo-1599487488170-d11ec9c172f0?w=600&h=400&fit=crop',
      rating: 4.7, reviews: 632, deliveryTime: 20, deliveryFee: 30, minOrder: 250,
      tags: ['Fast Food', 'Kabab', 'Deals'],
    ),
    RestaurantModel(
      id: '5', name: 'Swat Hotel Restaurant', cuisine: 'Desi & Continental',
      image: 'https://images.unsplash.com/photo-1567521464027-f127ff144326?w=600&h=400&fit=crop',
      rating: 4.4, reviews: 410, deliveryTime: 45, deliveryFee: 70, minOrder: 800,
      tags: ['Desi', 'Continental', 'Breakfast'],
    ),
    RestaurantModel(
      id: '6', name: 'KPK Breakfast Hub', cuisine: 'Breakfast & Chai',
      image: 'https://images.unsplash.com/photo-1484723091739-30a097e8f929?w=600&h=400&fit=crop',
      rating: 4.5, reviews: 523, deliveryTime: 20, deliveryFee: 25, minOrder: 200,
      tags: ['Breakfast', 'Deals'],
    ),
    RestaurantModel(
      id: '7', name: 'Pizza & Burger Point', cuisine: 'Fast Food',
      image: 'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=600&h=400&fit=crop',
      rating: 4.2, reviews: 387, deliveryTime: 30, deliveryFee: 50, minOrder: 400,
      tags: ['Fast Food', 'Deals'],
    ),
    RestaurantModel(
      id: '8', name: 'Abbottabad Mutton Karahi', cuisine: 'Karahi & BBQ',
      image: 'https://images.unsplash.com/photo-1574894709920-11b28e7367e3?w=600&h=400&fit=crop',
      rating: 4.8, reviews: 891, deliveryTime: 50, deliveryFee: 80, minOrder: 700,
      tags: ['Karahi', 'BBQ'],
    ),
  ].obs;

  final menuItems = <MenuItemModel>[
    MenuItemModel(id: 'm1', name: 'Mutton Karahi', description: 'Slow-cooked mutton in tomato and spices', image: 'https://images.unsplash.com/photo-1574894709920-11b28e7367e3?w=300&h=200&fit=crop', price: 1800, category: 'Karahi', isPopular: true),
    MenuItemModel(id: 'm2', name: 'Chapli Kabab (2 pcs)', description: 'Juicy minced beef patties — Peshawar style', image: 'https://images.unsplash.com/photo-1599487488170-d11ec9c172f0?w=300&h=200&fit=crop', price: 350, category: 'Kabab', isPopular: true),
    MenuItemModel(id: 'm3', name: 'Chicken Biryani', description: 'Fragrant basmati rice with tender chicken', image: 'https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=300&h=200&fit=crop', price: 450, category: 'Biryani', isPopular: true),
    MenuItemModel(id: 'm4', name: 'Beef Tikka', description: 'Marinated beef cubes grilled on charcoal', image: 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=300&h=200&fit=crop', price: 650, category: 'BBQ', isPopular: true),
    MenuItemModel(id: 'm5', name: 'Peshawari Naan', description: 'Freshly baked traditional naan', image: 'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=300&h=200&fit=crop', price: 60, category: 'Bread', isVeg: true),
    MenuItemModel(id: 'm6', name: 'Daal Mash', description: 'White lentils cooked with butter and spices', image: 'https://images.unsplash.com/photo-1546833998-877b37c2e5c6?w=300&h=200&fit=crop', price: 280, category: 'Desi', isVeg: true),
    MenuItemModel(id: 'm7', name: 'Chicken Karahi', description: 'Farm chicken karahi with tomatoes and ginger', image: 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=300&h=200&fit=crop', price: 1200, category: 'Karahi', isPopular: true),
    MenuItemModel(id: 'm8', name: 'Seekh Kabab (4 pcs)', description: 'Spiced minced meat on skewers', image: 'https://images.unsplash.com/photo-1529006557810-274b9b2fc783?w=300&h=200&fit=crop', price: 500, category: 'Kabab'),
    MenuItemModel(id: 'm9', name: 'Halwa Puri', description: 'Classic breakfast: semolina halwa with puri', image: 'https://images.unsplash.com/photo-1484723091739-30a097e8f929?w=300&h=200&fit=crop', price: 200, category: 'Breakfast', isVeg: true, isPopular: true),
    MenuItemModel(id: 'm10', name: 'Qehwa', description: 'Traditional KPK green tea with cardamom', image: 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=300&h=200&fit=crop', price: 80, category: 'Drinks', isVeg: true),
  ].obs;

  List<RestaurantModel> get filteredRestaurants {
    final f = selectedFilter.value;
    final q = searchQuery.value.toLowerCase();
    return restaurants.where((r) {
      final matchFilter = f == 'All' || r.tags.contains(f);
      final matchSearch = q.isEmpty || r.name.toLowerCase().contains(q) || r.cuisine.toLowerCase().contains(q);
      return matchFilter && matchSearch;
    }).toList();
  }

  int get cartCount => cart.fold(0, (sum, i) => sum + i.quantity);
  double get cartTotal => cart.fold(0.0, (sum, i) => sum + (i.item.price * i.quantity));

  void addToCart(MenuItemModel item) {
    final idx = cart.indexWhere((c) => c.item.id == item.id);
    if (idx >= 0) {
      cart[idx].quantity++;
      cart.refresh();
    } else {
      cart.add(CartItem(item: item));
    }
  }

  void removeFromCart(MenuItemModel item) {
    final idx = cart.indexWhere((c) => c.item.id == item.id);
    if (idx >= 0) {
      if (cart[idx].quantity > 1) {
        cart[idx].quantity--;
        cart.refresh();
      } else {
        cart.removeAt(idx);
      }
    }
  }

  int itemQty(String itemId) {
    final idx = cart.indexWhere((c) => c.item.id == itemId);
    return idx >= 0 ? cart[idx].quantity : 0;
  }

  void setFilter(String f) => selectedFilter.value = f;
  void setSearch(String q) => searchQuery.value = q;
}