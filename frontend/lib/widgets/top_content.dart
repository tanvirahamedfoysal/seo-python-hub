part of '../app.dart';

class _TopContent extends StatelessWidget {
  const _TopContent();
  @override
  Widget build(BuildContext context) => const SectionCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _CardTitle(title: 'Top content', action: 'All content'),
            SizedBox(height: 16),
            _RankRow(
              rank: '01',
              title: 'Functions & return values',
              value: '12.4k views',
              color: AppColors.teal,
            ),
            _RankRow(
              rank: '02',
              title: 'Lists, tuples & sets',
              value: '9.8k views',
              color: AppColors.coral,
            ),
            _RankRow(
              rank: '03',
              title: 'Build a CLI weather app',
              value: '8.1k views',
              color: AppColors.violet,
            ),
            _RankRow(
              rank: '04',
              title: 'Testing with pytest',
              value: '7.6k views',
              color: AppColors.gold,
            ),
          ],
        ),
      );
}
