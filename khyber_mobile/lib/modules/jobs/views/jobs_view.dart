import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/jobs_controller.dart';

class JobsView extends GetView<JobsController> {
  const JobsView({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final hPad = w > 1100 ? (w - 1100) / 2 + 16 : 16.0;
    final cols = w >= 800 ? 2 : 1;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: 160, pinned: true, backgroundColor: AppColors.primary,
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white), onPressed: () => Get.back()),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: const BoxDecoration(gradient: LinearGradient(colors: [AppColors.primary, AppColors.primaryDark], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: SafeArea(child: Padding(padding: const EdgeInsets.fromLTRB(20, 32, 20, 16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Jobs in KPK', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('Find opportunities across Khyber Pakhtunkhwa', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70)),
              ]))),
            ),
          ),
          bottom: PreferredSize(preferredSize: const Size.fromHeight(50), child: Container(
            color: AppColors.primary, padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Container(height: 40, decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(12)),
              child: TextField(onChanged: (v) => controller.searchQuery.value = v,
                style: const TextStyle(color: Colors.white, fontSize: 14),
                decoration: const InputDecoration(hintText: 'Search jobs or companies...', hintStyle: TextStyle(color: Colors.white60), prefixIcon: Icon(Icons.search_rounded, color: Colors.white60, size: 20), border: InputBorder.none, contentPadding: EdgeInsets.symmetric(vertical: 10)))),
          )),
        ),
        SliverToBoxAdapter(child: Padding(
          padding: EdgeInsets.fromLTRB(hPad, 12, hPad, 0),
          child: Column(children: [
            SizedBox(height: 36, child: Obx(() => ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: controller.categories.length, separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (_, i) { final cat = controller.categories[i]; final sel = controller.selectedCategory.value == cat;
                return GestureDetector(onTap: () => controller.selectedCategory.value = cat, child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(color: sel ? AppColors.primary : Colors.white, borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: sel ? AppColors.primary : AppColors.border),
                    boxShadow: sel ? [BoxShadow(color: AppColors.primary.withOpacity(0.25), blurRadius: 8)] : []),
                  child: Text(cat, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: sel ? Colors.white : AppColors.textSecondary)))); },
            ))),
            const SizedBox(height: 8),
            SizedBox(height: 32, child: Obx(() => ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: controller.types.length, separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (_, i) { final type = controller.types[i]; final sel = controller.selectedType.value == type;
                return GestureDetector(onTap: () => controller.selectedType.value = type, child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(color: sel ? AppColors.accent.withOpacity(0.12) : Colors.transparent, borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: sel ? AppColors.accent : AppColors.border)),
                  child: Text(type, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: sel ? AppColors.accent : AppColors.textSecondary)))); },
            ))),
            const SizedBox(height: 12),
          ]),
        )),
        Obx(() { final jobs = controller.filteredJobs;
          if (jobs.isEmpty) return const SliverFillRemaining(child: Center(child: Text('No jobs found', style: TextStyle(color: AppColors.textSecondary))));
          if (cols == 1) {
            return SliverPadding(
              padding: EdgeInsets.fromLTRB(hPad, 0, hPad, 24),
              sliver: SliverList(delegate: SliverChildBuilderDelegate((context, i) => _JobCard(job: jobs[i]), childCount: jobs.length)),
            );
          }
          return SliverPadding(
            padding: EdgeInsets.fromLTRB(hPad, 0, hPad, 24),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, i) => _JobCard(job: jobs[i]), childCount: jobs.length),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 14, mainAxisSpacing: 14, childAspectRatio: 1.1,
              ),
            ),
          );
        }),
      ]),
    );
  }
}

class _JobCard extends StatelessWidget {
  final dynamic job;
  const _JobCard({required this.job});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.07), blurRadius: 10, offset: const Offset(0, 4))]),
      child: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Container(width: 44, height: 44, decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: BorderRadius.circular(12)),
            child: Center(child: Text(job.company[0], style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary, fontSize: 20)))),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(job.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppColors.textPrimary)),
            Text(job.company, style: const TextStyle(fontSize: 13, color: AppColors.textSecondary)),
          ])),
          Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(color: AppColors.accent.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
            child: Text(job.type, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.accent))),
        ]),
        const SizedBox(height: 12),
        Text(job.description, style: const TextStyle(fontSize: 13, color: AppColors.textSecondary, height: 1.4), maxLines: 2, overflow: TextOverflow.ellipsis),
        const SizedBox(height: 12),
        Wrap(spacing: 6, runSpacing: 6, children: job.skills.map<Widget>((s) => Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(color: AppColors.background, borderRadius: BorderRadius.circular(20), border: Border.all(color: AppColors.border)),
          child: Text(s, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)))).toList()),
        const SizedBox(height: 12),
        Row(children: [
          const Icon(Icons.location_on_rounded, size: 14, color: AppColors.textSecondary),
          const SizedBox(width: 4),
          Text(job.location, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
          const SizedBox(width: 12),
          const Icon(Icons.payments_rounded, size: 14, color: AppColors.textSecondary),
          const SizedBox(width: 4),
          Text('PKR ${job.salaryMin ~/ 1000}k-${job.salaryMax ~/ 1000}k', style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
          const Spacer(),
          Text(job.postedDate, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
        ]),
        const SizedBox(height: 12),
        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), padding: const EdgeInsets.symmetric(vertical: 10)),
          child: const Text('Apply Now', style: TextStyle(fontWeight: FontWeight.bold)))),
      ])),
    );
  }
}
