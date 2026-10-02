part of '../app.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < 780;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageHeader(
              eyebrow: 'Thursday, October 1, 2026',
              title: 'Good morning, Maya',
              subtitle:
                  'A little progress today compounds into a lot of confidence.',
              actions: [
                FilledButton.icon(
                  onPressed: () => Navigator.of(context)
                      .pushReplacementNamed('/app/progress'),
                  icon: const Icon(Icons.route_rounded, size: 16),
                  label: const Text('View roadmap'),
                ),
              ],
            ),
            SectionCard(
              padding: EdgeInsets.zero,
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF163845), Color(0xFF176D6B)],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const StatusPill(
                            'CONTINUE LEARNING',
                            color: AppColors.gold,
                            background: Color(0x3048D5C1),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            'Functions & return values',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 7),
                          const Text(
                            'Turn a sequence of steps into a reusable building block.',
                            style: TextStyle(
                              color: Color(0xCDE7F1EE),
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 19),
                          SizedBox(
                            width: 190,
                            child: FilledButton(
                              style: FilledButton.styleFrom(
                                backgroundColor: AppColors.gold,
                                foregroundColor: AppColors.ink,
                              ),
                              onPressed: () => _notice(
                                context,
                                'Opening the canonical topic page…',
                              ),
                              child: const Text('Continue topic'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (!compact) const SizedBox(width: 50),
                    if (!compact)
                      SizedBox(
                        width: 160,
                        height: 160,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 132,
                              height: 132,
                              child: CircularProgressIndicator(
                                value: .68,
                                strokeWidth: 11,
                                backgroundColor: Colors.white.withValues(alpha: .16),
                                valueColor: const AlwaysStoppedAnimation(
                                  AppColors.gold,
                                ),
                              ),
                            ),
                            const Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '68%',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Text(
                                  'complete',
                                  style: TextStyle(
                                    color: Color(0xCDE7F1EE),
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            GridView.count(
              crossAxisCount: compact ? 2 : 4,
              childAspectRatio: compact ? .82 : 1.2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                StatCard(
                  label: 'Topics completed',
                  value: '24',
                  caption: '+3 this month',
                  icon: Icons.check_circle_outline_rounded,
                  color: AppColors.teal,
                ),
                StatCard(
                  label: 'Current streak',
                  value: '12 days',
                  caption: 'Personal best: 18',
                  icon: Icons.local_fire_department_outlined,
                  color: AppColors.coral,
                ),
                StatCard(
                  label: 'Roadmap progress',
                  value: '42%',
                  caption: 'Core Python stage',
                  icon: Icons.route_outlined,
                  color: AppColors.violet,
                ),
                StatCard(
                  label: 'Saved for later',
                  value: '18',
                  caption: '4 tutorials · 3 guides',
                  icon: Icons.bookmark_border_rounded,
                  color: AppColors.gold,
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (compact) ...[
              const _ActivityCard(),
              const SizedBox(height: 16),
              const _NextStepsCard(),
            ] else
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 3, child: _ActivityCard()),
                  SizedBox(width: 18),
                  Expanded(flex: 2, child: _NextStepsCard()),
                ],
              ),
            const SizedBox(height: 20),
            if (compact)
              const _RecentCard()
            else
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _RecentCard()),
                  SizedBox(width: 18),
                  Expanded(child: _NotificationsPreview()),
                ],
              ),
          ],
        );
      },
    );
  }
}
