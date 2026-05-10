import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/news_controller.dart';

class NewsView extends GetView<NewsController> {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final hPad = w > 1100 ? (w - 1100) / 2 + 16 : 16.0;
    final cols = w >= 800 ? 2 : 1;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: 140, pinned: true, backgroundColor: AppColors.primaryDark,
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white), onPressed: () => Get.back()),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: const BoxDecoration(gradient: LinearGradient(colors: [AppColors.primaryDark, AppColors.primary], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: SafeArea(child: Padding(padding: const EdgeInsets.fromLTRB(20, 32, 20, 16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('KPK News', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                Text('Latest news from KPK and Pakistan', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70)),
              ]))),
            ),
          ),
          bottom: PreferredSize(preferredSize: const Size.fromHeight(44), child: Container(
            color: AppColors.primaryDark, padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
            child: SizedBox(height: 32, child: Obx(() => ListView.separated(
              scrollDirection: Axis.horizontal, itemCount: controller.categories.length, separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (_, i) { final cat = controller.categories[i]; final sel = controller.selectedCategory.value == cat;
                return GestureDetector(onTap: () => controller.selectedCategory.value = cat, child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(color: sel ? Colors.white : Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(20)),
                  child: Text(cat, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: sel ? AppColors.primary : Colors.white)))); },
            ))),
          )),
        ),
        Obx(() { final news = controller.filteredArticles;
          if (cols == 1) {
            return SliverPadding(
              padding: EdgeInsets.fromLTRB(hPad, 12, hPad, 24),
              sliver: SliverList(delegate: SliverChildBuilderDelegate((context, i) => _ArticleCard(article: news[i], isHero: i == 0), childCount: news.length)),
            );
          }
          return SliverPadding(
            padding: EdgeInsets.fromLTRB(hPad, 12, hPad, 24),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, i) => _ArticleCard(article: news[i], isHero: false), childCount: news.length),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 14, mainAxisSpacing: 14, childAspectRatio: 1.1),
            ),
          );
        }),
      ]),
    );
  }
}

class _ArticleCard extends StatelessWidget {
  final dynamic article;
  final bool isHero;
  const _ArticleCard({required this.article, required this.isHero});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.07), blurRadius: 10, offset: const Offset(0, 4))]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (isHero) ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          child: Image.network(article.image, height: 180, width: double.infinity, fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(height: 180, color: AppColors.primaryLight, child: const Icon(Icons.article_rounded, size: 50, color: AppColors.primary)))),
        Padding(padding: const EdgeInsets.all(14), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: BorderRadius.circular(20)),
              child: Text(article.category, style: const TextStyle(fontSize: 10, color: AppColors.primary, fontWeight: FontWeight.w600))),
            const SizedBox(width: 8),
            Text(article.source, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
            const Spacer(),
            Text(article.publishedAt, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
          ]),
          const SizedBox(height: 8),
          Text(article.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppColors.textPrimary, height: 1.3)),
          const SizedBox(height: 6),
          Text(article.summary, style: const TextStyle(fontSize: 13, color: AppColors.textSecondary, height: 1.4), maxLines: 3, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 8),
          Row(children: [const Spacer(), TextButton(onPressed: () {}, child: const Text('Read More', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600, fontSize: 13)))]),
        ])),
      ]));
  }
}
