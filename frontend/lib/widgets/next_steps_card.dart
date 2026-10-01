part of '../app.dart';

class _NextStepsCard extends StatelessWidget {
  const _NextStepsCard();
  @override
  Widget build(BuildContext context) {
    return const SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CardTitle(title: 'Your next steps', action: 'See roadmap'),
          SizedBox(height: 18),
          _StepItem(
            number: '01',
            title: 'Finish functions',
            subtitle: '2 lessons remaining',
            color: AppColors.teal,
          ),
          _StepItem(
            number: '02',
            title: 'Start collections',
            subtitle: 'Prerequisite unlocked',
            color: AppColors.violet,
          ),
          _StepItem(
            number: '03',
            title: 'Try a small project',
            subtitle: 'Recommended for you',
            color: AppColors.coral,
          ),
        ],
      ),
    );
  }
}
