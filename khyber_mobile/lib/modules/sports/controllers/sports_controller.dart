import 'package:get/get.dart';

class SportsTeam {
  final String id, name, sport, league, homeGround, district;
  final String nextMatch, opponent, matchDate, matchTime;
  final int wins, losses, points;
  const SportsTeam({required this.id, required this.name, required this.sport, required this.league, required this.homeGround, required this.district, required this.nextMatch, required this.opponent, required this.matchDate, required this.matchTime, required this.wins, required this.losses, required this.points});
}

class SportsEvent {
  final String id, title, sport, venue, district, date, time, organizer;
  const SportsEvent({required this.id, required this.title, required this.sport, required this.venue, required this.district, required this.date, required this.time, required this.organizer});
}

class SportsController extends GetxController {
  final selectedTab = 0.obs;
  final searchQuery = ''.obs;

  final teams = <SportsTeam>[
    SportsTeam(id: 't1', name: 'Peshawar Zalmi', sport: 'Cricket', league: 'Pakistan Super League (PSL)', homeGround: 'Arbab Niaz Stadium', district: 'Peshawar', nextMatch: 'vs Karachi Kings', opponent: 'Karachi Kings', matchDate: '15 Jun 2026', matchTime: '19:30', wins: 8, losses: 3, points: 16),
    SportsTeam(id: 't2', name: 'KPK Qalandars', sport: 'Football', league: 'Pakistan Premier Football League', homeGround: 'Qayyum Stadium', district: 'Peshawar', nextMatch: 'vs Balochistan FC', opponent: 'Balochistan FC', matchDate: '20 Jun 2026', matchTime: '16:00', wins: 5, losses: 4, points: 15),
    SportsTeam(id: 't3', name: 'Khyber Hockey Club', sport: 'Hockey', league: 'National Hockey League', homeGround: 'Peshawar Hockey Ground', district: 'Peshawar', nextMatch: 'vs Punjab Blues', opponent: 'Punjab Blues', matchDate: '18 Jun 2026', matchTime: '14:00', wins: 6, losses: 2, points: 18),
    SportsTeam(id: 't4', name: 'Peshawar Wrestling Club', sport: 'Wrestling', league: 'KPK Provincial League', homeGround: 'Peshawar Sports Complex', district: 'Peshawar', nextMatch: 'KPK Championship Final', opponent: 'Mardan Club', matchDate: '25 Jun 2026', matchTime: '10:00', wins: 12, losses: 1, points: 36),
  ];

  final events = <SportsEvent>[
    SportsEvent(id: 'e1', title: 'Shandur Polo Festival 2026', sport: 'Polo', venue: 'Shandur Pass', district: 'Chitral', date: '7–9 Jul 2026', time: 'All Day', organizer: 'KPK Tourism Dept'),
    SportsEvent(id: 'e2', title: 'KPK Wrestling Championship', sport: 'Wrestling', venue: 'Peshawar Sports Complex', district: 'Peshawar', date: '25 Jun 2026', time: '10:00 AM', organizer: 'KPK Sports Directorate'),
    SportsEvent(id: 'e3', title: 'Inter-University Cricket', sport: 'Cricket', venue: 'Arbab Niaz Stadium', district: 'Peshawar', date: '30 Jun 2026', time: '09:00 AM', organizer: 'HEC / UoP'),
    SportsEvent(id: 'e4', title: 'Swat Valley Marathon', sport: 'Athletics', venue: 'Mingora', district: 'Swat', date: '12 Jul 2026', time: '06:00 AM', organizer: 'Swat Sports Association'),
    SportsEvent(id: 'e5', title: 'KPK Kabaddi Tournament', sport: 'Kabaddi', venue: 'Mardan Sports Ground', district: 'Mardan', date: '5 Jul 2026', time: '11:00 AM', organizer: 'Mardan Sports Club'),
    SportsEvent(id: 'e6', title: 'Chitral Snow Sports Festival', sport: 'Skiing', venue: 'Chitral', district: 'Chitral', date: 'Jan 2027', time: 'All Day', organizer: 'KPK Tourism'),
  ];
}