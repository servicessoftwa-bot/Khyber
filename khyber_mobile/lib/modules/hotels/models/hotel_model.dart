class HotelModel {
  final String id;
  final String name;
  final String type; // hotel | resort | villa | guesthouse
  final String location;
  final String image;
  final double rating;
  final int reviews;
  final double pricePerNight;
  final List<String> amenities;
  final bool isAvailable;

  const HotelModel({
    required this.id,
    required this.name,
    required this.type,
    required this.location,
    required this.image,
    required this.rating,
    required this.reviews,
    required this.pricePerNight,
    required this.amenities,
    this.isAvailable = true,
  });
}
