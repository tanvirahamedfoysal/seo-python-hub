part of '../app.dart';

class ModerationScreen extends StatelessWidget {
  const ModerationScreen({super.key});
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            eyebrow: 'Trust & safety',
            title: 'Moderation',
            subtitle:
                'Review reports carefully and keep community spaces useful.',
            actions: [
              OutlinedButton.icon(
                onPressed: () => _notice(context, 'Moderation queue refreshed'),
                icon: const Icon(Icons.refresh_rounded, size: 16),
                label: const Text('Refresh'),
              ),
            ],
          ),
          const Wrap(
            spacing: 8,
            children: [
              StatusPill(
                'Open · 6',
                color: AppColors.coral,
                background: AppColors.coralSoft,
              ),
              StatusPill(
                'In review · 2',
                color: AppColors.gold,
                background: AppColors.goldSoft,
              ),
              StatusPill(
                'Resolved · 48',
                color: AppColors.teal,
                background: AppColors.tealSoft,
              ),
            ],
          ),
          const SizedBox(height: 15),
          const SectionCard(
            child: Column(
              children: [
                _ReportRow(
                  reason: 'Possible harassment',
                  title: '“Why are you making this so complicated?”',
                  discussionContext:
                      'Reported in: How I structure my first Python project',
                  reporter: '2 hours ago · 1 report',
                  state: 'Urgent',
                  color: AppColors.coral,
                ),
                _ReportRow(
                  reason: 'Spam / promotion',
                  title: '“Click here for the best Python course…”',
                  discussionContext: 'Reported in: General Python questions',
                  reporter: '5 hours ago · 3 reports',
                  state: 'Open',
                  color: AppColors.gold,
                ),
                _ReportRow(
                  reason: 'Needs content review',
                  title: 'Answer contains an outdated package version',
                  discussionContext: 'Reported in: Testing with pytest',
                  reporter: 'Yesterday · 1 report',
                  state: 'Open',
                  color: AppColors.violet,
                ),
              ],
            ),
          ),
        ],
      );
}
