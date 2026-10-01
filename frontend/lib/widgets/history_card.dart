part of '../app.dart';

class _HistoryCard extends StatelessWidget {
  const _HistoryCard();
  @override
  Widget build(BuildContext context) => const SectionCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _CardTitle(title: 'Recent activity', action: 'Export data'),
            SizedBox(height: 12),
            _HistoryRow(
              icon: Icons.check_circle_rounded,
              title: 'Completed “Functions & return values”',
              meta: 'Today · Core Python',
              color: AppColors.teal,
            ),
            _HistoryRow(
              icon: Icons.bookmark_rounded,
              title: 'Saved “Testing with pytest”',
              meta: 'Yesterday · Guide',
              color: AppColors.gold,
            ),
            _HistoryRow(
              icon: Icons.forum_rounded,
              title: 'Replied to “When should I use a tuple?”',
              meta: 'Sep 28 · Discussion',
              color: AppColors.violet,
            ),
          ],
        ),
      );
}
