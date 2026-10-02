part of '../app.dart';

class _PreferencesCard extends StatelessWidget {
  const _PreferencesCard();
  @override
  Widget build(BuildContext context) => SectionCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Preferences',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              value: true,
              onChanged: (_) {},
              title: const Text(
                'Learning reminders',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
              ),
              subtitle: const Text(
                'A gentle nudge to keep your streak alive.',
                style: TextStyle(fontSize: 11, color: AppColors.inkMuted),
              ),
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              value: true,
              onChanged: (_) {},
              title: const Text(
                'Discussion updates',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
              ),
              subtitle: const Text(
                'Replies and mentions from conversations you follow.',
                style: TextStyle(fontSize: 11, color: AppColors.inkMuted),
              ),
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              value: false,
              onChanged: (_) {},
              title: const Text(
                'Product news',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
              ),
              subtitle: const Text(
                'Occasional notes about new learning content.',
                style: TextStyle(fontSize: 11, color: AppColors.inkMuted),
              ),
            ),
          ],
        ),
      );
}
