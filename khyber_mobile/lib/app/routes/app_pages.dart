import 'package:get/get.dart';
import '../../modules/home/views/home_view.dart';
import '../../modules/auth/views/login_view.dart';
import '../../modules/auth/views/register_view.dart';
import '../../modules/auth/views/splash_view.dart';
import '../../modules/auth/views/onboarding_view.dart';
import '../../modules/auth/bindings/auth_binding.dart';
import '../../modules/home/bindings/home_binding.dart';
import '../../modules/food/views/food_view.dart';
import '../../modules/food/bindings/food_binding.dart';
import '../../modules/grocery/views/grocery_view.dart';
import '../../modules/grocery/bindings/grocery_binding.dart';
import '../../modules/pharmacy/views/pharmacy_view.dart';
import '../../modules/pharmacy/bindings/pharmacy_binding.dart';
import '../../modules/shopping/views/shopping_view.dart';
import '../../modules/shopping/bindings/shopping_binding.dart';
import '../../modules/transport/views/transport_view.dart';
import '../../modules/transport/bindings/transport_binding.dart';
import '../../modules/courier/views/courier_view.dart';
import '../../modules/courier/bindings/courier_binding.dart';
import '../../modules/hospitals/views/hospitals_view.dart';
import '../../modules/hospitals/bindings/hospitals_binding.dart';
import '../../modules/govt/views/govt_view.dart';
import '../../modules/govt/bindings/govt_binding.dart';
import '../../modules/events/views/events_view.dart';
import '../../modules/events/bindings/events_binding.dart';
import '../../modules/parks/views/parks_view.dart';
import '../../modules/parks/bindings/parks_binding.dart';
import '../../modules/businesses/views/businesses_view.dart';
import '../../modules/businesses/bindings/businesses_binding.dart';
import '../../modules/real_estate/views/real_estate_view.dart';
import '../../modules/real_estate/bindings/real_estate_binding.dart';
import '../../modules/amusement/views/amusement_view.dart';
import '../../modules/amusement/bindings/amusement_binding.dart';
import '../../modules/education/views/education_view.dart';
import '../../modules/education/bindings/education_binding.dart';
import '../../modules/emergency/views/emergency_view.dart';
import '../../modules/emergency/bindings/emergency_binding.dart';
import '../../modules/jobs/views/jobs_view.dart';
import '../../modules/jobs/bindings/jobs_binding.dart';
import '../../modules/news/views/news_view.dart';
import '../../modules/news/bindings/news_binding.dart';
import '../../modules/tourism/views/tourism_view.dart';
import '../../modules/tourism/bindings/tourism_binding.dart';
import '../../modules/crafts/views/crafts_view.dart';
import '../../modules/crafts/bindings/crafts_binding.dart';
import '../../modules/profile/views/profile_view.dart';
import '../../modules/profile/bindings/profile_binding.dart';
import '../../modules/wallet/views/wallet_view.dart';
import '../../modules/wallet/bindings/wallet_binding.dart';
import '../../modules/orders/views/orders_view.dart';
import '../../modules/orders/bindings/orders_binding.dart';
import '../../modules/notifications/views/notifications_view.dart';
import '../../modules/notifications/bindings/notifications_binding.dart';
import '../../modules/logistics/views/logistics_view.dart';
import '../../modules/logistics/bindings/logistics_binding.dart';
import '../../modules/water_gas/views/water_gas_view.dart';
import '../../modules/water_gas/bindings/water_gas_binding.dart';
import '../../modules/hotels/views/hotels_view.dart';
import '../../modules/hotels/bindings/hotels_binding.dart';
import '../../modules/home_nursing/views/home_nursing_view.dart';
import '../../modules/home_nursing/bindings/home_nursing_binding.dart';
import '../../modules/load_shedding/views/load_shedding_view.dart';
import '../../modules/load_shedding/bindings/load_shedding_binding.dart';
import '../../modules/agriculture/views/agriculture_view.dart';
import '../../modules/agriculture/bindings/agriculture_binding.dart';
import '../../modules/livestock/views/livestock_view.dart';
import '../../modules/livestock/bindings/livestock_binding.dart';
import '../../modules/brt/views/brt_view.dart';
import '../../modules/brt/bindings/brt_binding.dart';
import '../../modules/marriage_halls/views/marriage_halls_view.dart';
import '../../modules/marriage_halls/bindings/marriage_halls_binding.dart';
import '../../modules/dry_fruits/views/dry_fruits_view.dart';
import '../../modules/dry_fruits/bindings/dry_fruits_binding.dart';
import '../../modules/gemstones/views/gemstones_view.dart';
import '../../modules/gemstones/bindings/gemstones_binding.dart';
import '../../modules/marble/views/marble_view.dart';
import '../../modules/marble/bindings/marble_binding.dart';
import '../../modules/gandhara/views/gandhara_view.dart';
import '../../modules/gandhara/bindings/gandhara_binding.dart';
import '../../modules/sports/views/sports_view.dart';
import '../../modules/sports/bindings/sports_binding.dart';
import '../../modules/utility_bills/views/utility_bills_view.dart';
import '../../modules/utility_bills/bindings/utility_bills_binding.dart';
import '../../modules/flood_alerts/views/flood_alerts_view.dart';
import '../../modules/flood_alerts/bindings/flood_alerts_binding.dart';
import 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.splash;

  static final routes = [
    GetPage(name: AppRoutes.splash,      page: () => const SplashView(),      binding: AuthBinding()),
    GetPage(name: AppRoutes.onboarding,  page: () => const OnboardingView(),  binding: AuthBinding()),
    GetPage(name: AppRoutes.login,       page: () => const LoginView(),       binding: AuthBinding()),
    GetPage(name: AppRoutes.register,    page: () => const RegisterView(),    binding: AuthBinding()),
    GetPage(name: AppRoutes.home,        page: () => const HomeView(),        binding: HomeBinding()),
    GetPage(name: AppRoutes.food,        page: () => const FoodView(),        binding: FoodBinding()),
    GetPage(name: AppRoutes.grocery,     page: () => const GroceryView(),     binding: GroceryBinding()),
    GetPage(name: AppRoutes.pharmacy,    page: () => const PharmacyView(),    binding: PharmacyBinding()),
    GetPage(name: AppRoutes.shopping,    page: () => const ShoppingView(),    binding: ShoppingBinding()),
    GetPage(name: AppRoutes.transport,   page: () => const TransportView(),   binding: TransportBinding()),
    GetPage(name: AppRoutes.courier,     page: () => const CourierView(),     binding: CourierBinding()),
    GetPage(name: AppRoutes.logistics,   page: () => const LogisticsView(),   binding: LogisticsBinding()),
    GetPage(name: AppRoutes.hospitals,   page: () => const HospitalsView(),   binding: HospitalsBinding()),
    GetPage(name: AppRoutes.govtServices,page: () => const GovtView(),        binding: GovtBinding()),
    GetPage(name: AppRoutes.events,      page: () => const EventsView(),      binding: EventsBinding()),
    GetPage(name: AppRoutes.parks,       page: () => const ParksView(),       binding: ParksBinding()),
    GetPage(name: AppRoutes.businesses,  page: () => const BusinessesView(),  binding: BusinessesBinding()),
    GetPage(name: AppRoutes.realEstate,  page: () => const RealEstateView(),  binding: RealEstateBinding()),
    GetPage(name: AppRoutes.amusement,   page: () => const AmusementView(),   binding: AmusementBinding()),
    GetPage(name: AppRoutes.education,   page: () => const EducationView(),   binding: EducationBinding()),
    GetPage(name: AppRoutes.emergency,   page: () => const EmergencyView(),   binding: EmergencyBinding()),
    GetPage(name: AppRoutes.jobs,        page: () => const JobsView(),        binding: JobsBinding()),
    GetPage(name: AppRoutes.news,        page: () => const NewsView(),        binding: NewsBinding()),
    GetPage(name: AppRoutes.tourism,     page: () => const TourismView(),     binding: TourismBinding()),
    GetPage(name: AppRoutes.crafts,      page: () => const CraftsView(),      binding: CraftsBinding()),
    GetPage(name: AppRoutes.profile,     page: () => const ProfileView(),     binding: ProfileBinding()),
    GetPage(name: AppRoutes.wallet,      page: () => const WalletView(),      binding: WalletBinding()),
    GetPage(name: AppRoutes.orders,      page: () => const OrdersView(),      binding: OrdersBinding()),
    GetPage(name: AppRoutes.notifications,page: () => const NotificationsView(), binding: NotificationsBinding()),
    GetPage(name: AppRoutes.waterGas,    page: () => const WaterGasView(),    binding: WaterGasBinding()),
    GetPage(name: AppRoutes.hotels,      page: () => const HotelsView(),      binding: HotelsBinding()),
    GetPage(name: AppRoutes.homeNursing,   page: () => const HomeNursingView(),   binding: HomeNursingBinding()),
    GetPage(name: AppRoutes.loadShedding,  page: () => const LoadSheddingView(),  binding: LoadSheddingBinding()),
    GetPage(name: AppRoutes.agriculture,   page: () => const AgricultureView(),   binding: AgricultureBinding()),
    GetPage(name: AppRoutes.livestock,     page: () => const LivestockView(),     binding: LivestockBinding()),
    GetPage(name: AppRoutes.brt,           page: () => const BrtView(),           binding: BrtBinding()),
    GetPage(name: AppRoutes.marriageHalls, page: () => const MarriageHallsView(), binding: MarriageHallsBinding()),
    GetPage(name: AppRoutes.dryFruits,     page: () => const DryFruitsView(),     binding: DryFruitsBinding()),
    GetPage(name: AppRoutes.gemstones,     page: () => const GemstonesView(),     binding: GemstonesBinding()),
    GetPage(name: AppRoutes.marble,        page: () => const MarbleView(),        binding: MarbleBinding()),
    GetPage(name: AppRoutes.gandhara,      page: () => const GandharaView(),      binding: GandharaBinding()),
    GetPage(name: AppRoutes.sports,        page: () => const SportsView(),        binding: SportsBinding()),
    GetPage(name: AppRoutes.utilityBills,  page: () => const UtilityBillsView(),  binding: UtilityBillsBinding()),
    GetPage(name: AppRoutes.floodAlerts,   page: () => const FloodAlertsView(),   binding: FloodAlertsBinding()),
  ];
}
