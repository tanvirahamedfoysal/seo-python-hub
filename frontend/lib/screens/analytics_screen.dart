part of '../app.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            eyebrow: 'Measured platform health',
            title: 'Analytics',
            subtitle:
                'Aggregate signals for improving content and the learner experience.',
            actions: [
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.date_range_rounded, size: 16),
                label: const Text('Last 30 days'),
              ),
              OutlinedButton.icon(
                onPressed: () => _notice(context, 'Export queued for download'),
                icon: const Icon(Icons.download_outlined, size: 16),
                label: const Text('Export'),
              ),
            ],
          ),
          const AdaptiveStatGrid(
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 1.2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              StatCard(
                label: 'Topic views',
                value: '84.2k',
                caption: '+18.2% vs prior period',
                icon: Icons.visibility_outlined,
                color: AppColors.teal,
              ),
              StatCard(
                label: 'Lesson completion',
                value: '36.8%',
                caption: '+4.1 pts vs prior period',
                icon: Icons.check_circle_outline_rounded,
                color: AppColors.coral,
              ),
              StatCard(
                label: 'Searches',
                value: '21.4k',
                caption: 'Top: “asyncio”',
                icon: Icons.search_rounded,
                color: AppColors.violet,
              ),
              StatCard(
                label: 'New accounts',
                value: '1,284',
                caption: '+8.4% vs prior period',
                icon: Icons.person_add_alt_1_outlined,
                color: AppColors.gold,
              ),
            ],
          ),
          const SizedBox(height: 18),
          LayoutBuilder(
            builder: (context, c) => c.maxWidth < 760
                ? const Column(
                    children: [
                      _AnalyticsTrend(),
                      SizedBox(height: 16),
                      _TopContent(),
                    ],
                  )
                : const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 3, child: _AnalyticsTrend()),
                      SizedBox(width: 18),
                      Expanded(flex: 2, child: _TopContent()),
                    ],
                  ),
          ),
          const SizedBox(height: 18),
          const SectionCard(
            child: Row(
              children: [
                Icon(
                  Icons.privacy_tip_outlined,
                  color: AppColors.inkMuted,
                  size: 18,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Metrics are aggregate and privacy-reviewed. Search terms are shown only above the reporting threshold.',
                    style: TextStyle(color: AppColors.inkMuted, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}
