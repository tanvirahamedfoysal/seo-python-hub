part of '../app.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            eyebrow: 'Stay in the loop',
            title: 'Notifications',
            subtitle:
                'Replies, milestones, and updates that matter to your learning.',
            actions: [
              TextButton(
                onPressed: () =>
                    _notice(context, 'All notifications marked as read'),
                child: const Text('Mark all as read'),
              ),
            ],
          ),
          const Row(
            children: [
              StatusPill('All · 12', color: AppColors.teal),
              SizedBox(width: 8),
              StatusPill(
                'Unread · 4',
                color: AppColors.coral,
                background: AppColors.coralSoft,
              ),
              SizedBox(width: 8),
              StatusPill(
                'Mentions · 3',
                color: AppColors.inkMuted,
                background: AppColors.surface,
              ),
            ],
          ),
          const SizedBox(height: 15),
          const SectionCard(
            child: Column(
              children: [
                _FullNotification(
                  icon: Icons.reply_rounded,
                  title: 'Jules replied to your discussion',
                  body:
                      '“A good rule is to use tuples when the shape of your data should not change.”',
                  time: '12 min ago',
                  color: AppColors.teal,
                  unread: true,
                ),
                _FullNotification(
                  icon: Icons.alternate_email_rounded,
                  title: 'You were mentioned in a discussion',
                  body:
                      'Nadia mentioned you in “How I structure my first Python project”.',
                  time: '2 hours ago',
                  color: AppColors.violet,
                  unread: true,
                ),
                _FullNotification(
                  icon: Icons.emoji_events_outlined,
                  title: 'You reached a 12 day learning streak',
                  body: 'Nice work. Your personal best is 18 days.',
                  time: 'Yesterday',
                  color: AppColors.gold,
                  unread: true,
                ),
                _FullNotification(
                  icon: Icons.auto_awesome_outlined,
                  title: 'A new guide matches your path',
                  body:
                      '“Testing with pytest” is a great next step after your recent topics.',
                  time: '2 days ago',
                  color: AppColors.coral,
                  unread: false,
                ),
              ],
            ),
          ),
        ],
      );
}
