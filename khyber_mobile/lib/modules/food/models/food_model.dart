class RestaurantModel {
  final String id;
  final String name;
  final String cuisine;
  final String image;
  final double rating;
  final int reviews;
  final int deliveryTime;
  final double deliveryFee;
  final double minOrder;
  final bool isOpen;
  final List<String> tags;

  const RestaurantModel({
    required this.id,
    required this.name,
    required this.cuisine,
    required this.image,
    required this.rating,
    required this.reviews,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.minOrder,
    this.isOpen = true,
    this.tags = const [],
  });
}

class MenuItemModel {
  final String id;
  final String name;
  final String description;
  final String image;
  final double price;
  final String category;
  final bool isPopular;
  final bool isVeg;

  const MenuItemModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.category,
    this.isPopular = false,
    this.isVeg = false,
  });
}

class CartItem {
  final MenuItemModel item;
  int quantity;
  CartItem({required this.item, this.quantity = 1});
}
