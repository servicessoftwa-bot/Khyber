class ApiEndpoints {
  static const String baseUrl = 'http://localhost:4000/api/v1';

  // Auth
  static const String login         = '/auth/login';
  static const String register      = '/auth/register';
  static const String logout        = '/auth/logout';
  static const String refreshToken  = '/auth/refresh';
  static const String profile       = '/auth/profile';
  static const String updateProfile = '/auth/profile/update';
  static const String changePassword = '/auth/change-password';

  // Home
  static const String banners    = '/home/banners';
  static const String featured   = '/home/featured';
  static const String stats      = '/home/stats';

  // Food
  static const String restaurants      = '/food/restaurants';
  static const String restaurantDetail = '/food/restaurants/:id';
  static const String foodMenu         = '/food/restaurants/:id/menu';
  static const String foodCategories   = '/food/categories';

  // Grocery
  static const String groceryStores   = '/grocery/stores';
  static const String groceryProducts = '/grocery/products';

  // Pharmacy
  static const String pharmacies      = '/pharmacy';
  static const String medicines       = '/pharmacy/medicines';

  // Shopping
  static const String shops           = '/shopping/shops';
  static const String products        = '/shopping/products';

  // Transport
  static const String transportTypes  = '/transport/types';
  static const String bookRide        = '/transport/book';
  static const String trackRide       = '/transport/track/:id';
  static const String rideHistory     = '/transport/history';

  // Logistics / Courier
  static const String courierTypes    = '/courier/types';
  static const String sendParcel      = '/courier/send';
  static const String trackParcel     = '/courier/track/:id';

  // Hospitals
  static const String hospitals       = '/hospitals';
  static const String hospitalDetail  = '/hospitals/:id';
  static const String doctors         = '/hospitals/:id/doctors';
  static const String bookAppointment = '/hospitals/appointments';

  // Govt Services
  static const String govtServices    = '/govt/services';
  static const String govtOffices     = '/govt/offices';

  // Events
  static const String events          = '/events';
  static const String eventDetail     = '/events/:id';

  // Parks & Recreation
  static const String parks           = '/parks';
  static const String parkDetail      = '/parks/:id';

  // Businesses
  static const String businesses      = '/businesses';
  static const String businessDetail  = '/businesses/:id';

  // Real Estate
  static const String properties      = '/real-estate/properties';
  static const String propertyDetail  = '/real-estate/properties/:id';

  // Amusement
  static const String amusementPlaces = '/amusement';

  // Education
  static const String schools         = '/education/schools';
  static const String universities    = '/education/universities';
  static const String tuitionCenters  = '/education/tuitions';

  // Emergency
  static const String emergencyNumbers = '/emergency/numbers';
  static const String reportEmergency  = '/emergency/report';

  // Jobs
  static const String jobs            = '/jobs';
  static const String jobDetail       = '/jobs/:id';
  static const String applyJob        = '/jobs/:id/apply';

  // News
  static const String news            = '/news';
  static const String newsDetail      = '/news/:id';

  // Tourism
  static const String touristSpots    = '/tourism/spots';
  static const String touristDetail   = '/tourism/spots/:id';
  static const String travelGuides    = '/tourism/guides';

  // Crafts & Handicrafts
  static const String craftShops      = '/crafts/shops';
  static const String craftProducts   = '/crafts/products';
  static const String artisans        = '/crafts/artisans';

  // Orders
  static const String myOrders       = '/orders';
  static const String orderDetail    = '/orders/:id';
  static const String cancelOrder    = '/orders/:id/cancel';

  // Wallet
  static const String walletBalance  = '/wallet/balance';
  static const String walletHistory  = '/wallet/transactions';
  static const String addFunds       = '/wallet/add';

  // Notifications
  static const String notifications      = '/notifications';
  static const String markNotifRead      = '/notifications/:id/read';
  static const String markAllRead        = '/notifications/read-all';

  // Ratings
  static const String submitRating   = '/ratings';

  // Support
  static const String submitTicket   = '/support/tickets';
  static const String myTickets      = '/support/tickets/my';
  static const String ticketDetail   = '/support/tickets/:id';

  // Water & Gas
  static const String waterServices  = '/water-gas/water';
  static const String gasServices    = '/water-gas/gas';
  static const String utilityBills   = '/water-gas/bills';
}
