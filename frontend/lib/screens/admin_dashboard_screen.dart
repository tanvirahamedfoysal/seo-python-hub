part of '../app.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            eyebrow: 'Workspace overview',
            title: 'Admin overview',
            subtitle:
                'Good morning, Maya. Here is what needs your attention today.',
            actions: [
              OutlinedButton.icon(
                onPressed: () => _notice(context, 'Health checks are green'),
                icon: const Icon(Icons.monitor_heart_outlined, size: 16),
                label: const Text('System health'),
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
                label: 'Total learners',
                value: '12,840',
                caption: '+8.4% this month',
                icon: Icons.people_outline_rounded,
                color: AppColors.teal,
              ),
              StatCard(
                label: 'Published content',
                value: '184',
                caption: '6 awaiting review',
                icon: Icons.article_outlined,
                color: AppColors.violet,
              ),
              StatCard(
                label: 'Open reports',
                value: '6',
                caption: '2 need action today',
                icon: Icons.flag_outlined,
                color: AppColors.coral,
              ),
              StatCard(
                label: 'Weekly completions',
                value: '3,492',
                caption: '+12.7% vs last week',
                icon: Icons.trending_up_rounded,
                color: AppColors.gold,
              ),
            ],
          ),
          const SizedBox(height: 18),
          LayoutBuilder(
            builder: (context, c) => c.maxWidth < 760
                ? const Column(
                    children: [
                      _AdminAttention(),
                      SizedBox(height: 16),
                      _ContentPulse(),
                    ],
                  )
                : const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _AdminAttention()),
                      SizedBox(width: 18),
                      Expanded(child: _ContentPulse()),
                    ],
                  ),
          ),
          const SizedBox(height: 18),
          const _AdminQuickLinks(),
        ],
      );
}
