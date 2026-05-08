import 'package:get/get.dart';

class KhyberEvent {
  final String id, title, description, category, venue, district, date, time, image, organizer;
  final double price;
  final bool isFree;
  const KhyberEvent({required this.id, required this.title, required this.description, required this.category, required this.venue, required this.district, required this.date, required this.time, required this.image, required this.organizer, required this.price, required this.isFree});
}

class EventsController extends GetxController {
  final selectedCategory = 'All'.obs;
  final categories = ['All', 'Cultural', 'Sports', 'Education', 'Business', 'Festival', 'Music'];

  final events = <KhyberEvent>[
    KhyberEvent(id: 'ev1', title: 'Shandur Polo Festival 2024', description: 'The world highest polo ground hosts an annual polo tournament between Chitral and Gilgit. A spectacular cultural event with traditional music and food.', category: 'Festival', venue: 'Shandur Pass', district: 'Chitral', date: 'Jul 7-9, 2024', time: '10:00 AM', image: 'https://picsum.photos/seed/ev1/400/220', organizer: 'KPK Tourism Authority', price: 0, isFree: true),
    KhyberEvent(id: 'ev2', title: 'Peshawar Literary Festival', description: 'Annual literary gathering celebrating Pashto and Urdu literature with author readings, book launches and panel discussions.', category: 'Cultural', venue: 'Peshawar Museum', district: 'Peshawar', date: 'Aug 15-17, 2024', time: '9:00 AM', image: 'https://picsum.photos/seed/ev2/400/220', organizer: 'KPK Culture Dept', price: 0, isFree: true),
    KhyberEvent(id: 'ev3', title: 'KPK Startup Summit 2024', description: 'Bringing together entrepreneurs, investors and innovators to showcase the growing tech ecosystem in Khyber Pakhtunkhwa.', category: 'Business', venue: 'PC Hotel Peshawar', district: 'Peshawar', date: 'Sep 5, 2024', time: '8:30 AM', image: 'https://picsum.photos/seed/ev3/400/220', organizer: 'KPK IT Board', price: 500, isFree: false),
    KhyberEvent(id: 'ev4', title: 'Inter-Provincial Cricket Tournament', description: 'Annual cricket tournament featuring teams from all KPK districts competing for the provincial championship.', category: 'Sports', venue: 'Arbab Niaz Stadium', district: 'Peshawar', date: 'Oct 10-20, 2024', time: '2:00 PM', image: 'https://picsum.photos/seed/ev4/400/220', organizer: 'KPK Cricket Association', price: 200, isFree: false),
    KhyberEvent(id: 'ev5', title: 'Swat Cultural Week', description: 'A week-long celebration of Swat culture featuring traditional dances, handicrafts exhibition, local cuisine and music performances.', category: 'Cultural', venue: 'Swat Museum', district: 'Swat', date: 'Nov 1-7, 2024', time: '10:00 AM', image: 'https://picsum.photos/seed/ev5/400/220', organizer: 'Swat Tourism Board', price: 0, isFree: true),
    KhyberEvent(id: 'ev6', title: 'Education Expo KPK 2024', description: 'Education fair showcasing universities, colleges and vocational institutes from across Pakistan with admission guidance.', category: 'Education', venue: 'PESCO Ground, Peshawar', district: 'Peshawar', date: 'Nov 20-22, 2024', time: '9:00 AM', image: 'https://picsum.photos/seed/ev6/400/220', organizer: 'HEC Pakistan', price: 0, isFree: true),
  ].obs;

  List<KhyberEvent> get filteredEvents => selectedCategory.value == 'All' ? events : events.where((e) => e.category == selectedCategory.value).toList();
}
