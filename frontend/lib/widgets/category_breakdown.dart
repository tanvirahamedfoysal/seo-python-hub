part of '../app.dart';

class _CategoryBreakdown extends StatelessWidget {
  const _CategoryBreakdown();
  @override
  Widget build(BuildContext context) => const SectionCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _CardTitle(title: 'By category', action: 'View progress'),
            SizedBox(height: 22),
            _BreakdownRow(
              label: 'Core Python',
              value: '68%',
              progress: .68,
              color: AppColors.teal,
            ),
            _BreakdownRow(
              label: 'Web development',
              value: '34%',
              progress: .34,
              color: AppColors.coral,
            ),
            _BreakdownRow(
              label: 'Data & science',
              value: '22%',
              progress: .22,
              color: AppColors.violet,
            ),
            _BreakdownRow(
              label: 'Testing',
              value: '17%',
              progress: .17,
              color: AppColors.gold,
            ),
          ],
        ),
      );
}
