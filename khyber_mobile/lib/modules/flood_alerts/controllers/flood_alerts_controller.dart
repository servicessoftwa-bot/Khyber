import 'package:get/get.dart';

class FloodAlert {
  final String id, river, district, level, status, message, time;
  final bool isCritical;
  const FloodAlert({required this.id, required this.river, required this.district, required this.level, required this.status, required this.message, required this.time, required this.isCritical});
}

class WeatherStation {
  final String district, temp, humidity, condition, windSpeed;
  const WeatherStation({required this.district, required this.temp, required this.humidity, required this.condition, required this.windSpeed});
}

class FloodAlertsController extends GetxController {
  final selectedTab = 0.obs;

  final alerts = <FloodAlert>[
    FloodAlert(id: 'a1', river: 'Swat River', district: 'Swat', level: 'High Flood', status: 'ALERT', message: 'Water level at 4.2m above normal. Residents near Khwazakhela and Matta advised to move to higher ground.', time: '2 hours ago', isCritical: true),
    FloodAlert(id: 'a2', river: 'Kabul River', district: 'Nowshera', level: 'Medium Flood', status: 'WARNING', message: 'Water level rising near Nowshera. Pir Sabaq area under watch. NDMA teams deployed.', time: '4 hours ago', isCritical: false),
    FloodAlert(id: 'a3', river: 'Bara River', district: 'Peshawar', level: 'Low Flood', status: 'WATCH', message: 'Bara River showing above-normal flow near Pajagi Road. No immediate threat but monitoring continues.', time: '6 hours ago', isCritical: false),
    FloodAlert(id: 'a4', river: 'Panjkora River', district: 'Dir', level: 'High Flood', status: 'ALERT', message: 'Flash flooding reported in Upper Dir. Landslides blocking Timergara–Chitral Road. Avoid travel.', time: '1 hour ago', isCritical: true),
    FloodAlert(id: 'a5', river: 'Chitral River', district: 'Chitral', level: 'Normal', status: 'NORMAL', message: 'River levels within normal range. No flood risk currently.', time: '8 hours ago', isCritical: false),
    FloodAlert(id: 'a6', river: 'Indus River', district: 'Kohistan', level: 'Medium Flood', status: 'WARNING', message: 'Heavy rainfall upstream causing rise in Indus near Besham. Ferry services suspended.', time: '3 hours ago', isCritical: false),
  ];

  final weatherStations = <WeatherStation>[
    WeatherStation(district: 'Peshawar', temp: '38°C', humidity: '42%', condition: '⛅ Partly Cloudy', windSpeed: '15 km/h'),
    WeatherStation(district: 'Swat', temp: '28°C', humidity: '68%', condition: '🌧️ Heavy Rain', windSpeed: '22 km/h'),
    WeatherStation(district: 'Chitral', temp: '22°C', humidity: '55%', condition: '🌤️ Mostly Sunny', windSpeed: '10 km/h'),
    WeatherStation(district: 'Abbottabad', temp: '30°C', humidity: '60%', condition: '🌦️ Light Rain', windSpeed: '12 km/h'),
    WeatherStation(district: 'Dir', temp: '26°C', humidity: '75%', condition: '🌧️ Heavy Rain', windSpeed: '28 km/h'),
    WeatherStation(district: 'Mardan', temp: '36°C', humidity: '38%', condition: '☀️ Sunny', windSpeed: '8 km/h'),
    WeatherStation(district: 'Kohat', temp: '35°C', humidity: '35%', condition: '☀️ Clear', windSpeed: '10 km/h'),
    WeatherStation(district: 'Mansehra', temp: '29°C', humidity: '65%', condition: '⛅ Cloudy', windSpeed: '14 km/h'),
  ];

  int get criticalCount => alerts.where((a) => a.isCritical).length;
}