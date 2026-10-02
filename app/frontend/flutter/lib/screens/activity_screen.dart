part of '../app.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            eyebrow: 'Your learning signals',
            title: 'Activity & statistics',
            subtitle:
                'See what is helping you move forward, privately and at your own pace.',
            actions: [
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.date_range_rounded, size: 16),
                label: const Text('Last 30 days'),
              ),
            ],
          ),
          const AdaptiveStatGrid(
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 1.25,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              StatCard(
                label: 'Study sessions',
                value: '18',
                caption: '+5 from last month',
                icon: Icons.timer_outlined,
                color: AppColors.teal,
              ),
              StatCard(
                label: 'Longest streak',
                value: '18 days',
                caption: 'Keep it going',
                icon: Icons.local_fire_department_outlined,
                color: AppColors.coral,
              ),
              StatCard(
                label: 'Topics this month',
                value: '9',
                caption: 'Above your average',
                icon: Icons.auto_graph_rounded,
                color: AppColors.violet,
              ),
              StatCard(
                label: 'Avg. session',
                value: '24 min',
                caption: 'A sustainable pace',
                icon: Icons.schedule_rounded,
                color: AppColors.gold,
              ),
            ],
          ),
          const SizedBox(height: 18),
          LayoutBuilder(
            builder: (context, c) => c.maxWidth < 760
                ? const Column(
                    children: [
                      _StudyChart(),
                      SizedBox(height: 16),
                      _CategoryBreakdown(),
                    ],
                  )
                : const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _StudyChart()),
                      SizedBox(width: 18),
                      Expanded(child: _CategoryBreakdown()),
                    ],
                  ),
          ),
          const SizedBox(height: 18),
          const _HistoryCard(),
        ],
      );
}
