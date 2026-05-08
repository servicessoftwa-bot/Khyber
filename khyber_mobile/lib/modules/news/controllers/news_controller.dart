import 'package:get/get.dart';

class NewsArticle {
  final String id, title, summary, category, source, image, publishedAt, url;
  const NewsArticle({required this.id, required this.title, required this.summary, required this.category, required this.source, required this.image, required this.publishedAt, required this.url});
}

class NewsController extends GetxController {
  final selectedCategory = 'All'.obs;
  final categories = ['All', 'KPK', 'Pakistan', 'Business', 'Sports', 'Health', 'Education', 'Technology'];

  final articles = <NewsArticle>[
    NewsArticle(id: 'n1', title: 'KPK Government Launches Digital Services Portal for Citizens', summary: 'The provincial government has unveiled a comprehensive digital portal to streamline public services including property registration, birth certificates and more.', category: 'KPK', source: 'Dawn News', image: 'https://picsum.photos/seed/news1/400/220', publishedAt: '2 hours ago', url: ''),
    NewsArticle(id: 'n2', title: 'Swat Tourism Records Highest Visitor Count This Season', summary: 'Swat Valley has recorded over 2 million visitors this tourist season, contributing significantly to the local economy and hospitality sector.', category: 'KPK', source: 'The News', image: 'https://picsum.photos/seed/news2/400/220', publishedAt: '4 hours ago', url: ''),
    NewsArticle(id: 'n3', title: 'New University Campus to Open in Abbottabad', summary: 'HAZARA University has announced the opening of a new engineering and technology campus in Abbottabad to accommodate growing student demand.', category: 'Education', source: 'ARY News', image: 'https://picsum.photos/seed/news3/400/220', publishedAt: '6 hours ago', url: ''),
    NewsArticle(id: 'n4', title: 'Peshawar BRT Expansion Phase 2 Announced', summary: 'The KPK transport authority has announced Phase 2 of the Peshawar Bus Rapid Transit expansion, covering 15 new routes across the city.', category: 'KPK', source: 'Geo News', image: 'https://picsum.photos/seed/news4/400/220', publishedAt: '8 hours ago', url: ''),
    NewsArticle(id: 'n5', title: 'LRH Peshawar Introduces Advanced Cardiac Unit', summary: 'Lady Reading Hospital has inaugurated a state-of-the-art cardiac care unit equipped with modern diagnostic and treatment facilities.', category: 'Health', source: 'Dawn', image: 'https://picsum.photos/seed/news5/400/220', publishedAt: '1 day ago', url: ''),
    NewsArticle(id: 'n6', title: 'KPK Cricket Team Wins Inter-Provincial T20 Championship', summary: 'The Khyber Pakhtunkhwa cricket team defeated Punjab in a thrilling final to clinch the Inter-Provincial T20 Championship title.', category: 'Sports', image: 'https://picsum.photos/seed/news6/400/220', source: 'Express Tribune', publishedAt: '1 day ago', url: ''),
    NewsArticle(id: 'n7', title: 'IT Parks Established in Peshawar and Abbottabad', summary: 'The government has established two new IT parks to support local tech startups and attract foreign investment to KPK province.', category: 'Technology', source: 'Tribune', image: 'https://picsum.photos/seed/news7/400/220', publishedAt: '2 days ago', url: ''),
    NewsArticle(id: 'n8', title: 'Pakistan Economy Shows Signs of Recovery', summary: 'The State Bank of Pakistan reports improving economic indicators with inflation declining and foreign reserves stabilizing.', category: 'Pakistan', source: 'Business Recorder', image: 'https://picsum.photos/seed/news8/400/220', publishedAt: '2 days ago', url: ''),
  ].obs;

  List<NewsArticle> get filteredArticles => selectedCategory.value == 'All' ? articles : articles.where((a) => a.category == selectedCategory.value).toList();
}
