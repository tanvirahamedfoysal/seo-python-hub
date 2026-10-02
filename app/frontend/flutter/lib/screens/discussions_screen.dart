part of '../app.dart';

class DiscussionsScreen extends StatelessWidget {
  const DiscussionsScreen({super.key});
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            eyebrow: 'Community participation',
            title: 'My discussions',
            subtitle:
                'Follow your questions, replies, and conversations in one private view.',
            actions: [
              FilledButton.icon(
                onPressed: () => _notice(context, 'Create discussion form'),
                icon: const Icon(Icons.add_rounded, size: 16),
                label: const Text('Start a discussion'),
              ),
            ],
          ),
          const Wrap(
            spacing: 8,
            children: [
              StatusPill('All · 8', color: AppColors.teal),
              StatusPill(
                'Started by me · 3',
                color: AppColors.inkMuted,
                background: AppColors.surface,
              ),
              StatusPill(
                'Following · 5',
                color: AppColors.inkMuted,
                background: AppColors.surface,
              ),
              StatusPill(
                'Mentions · 2',
                color: AppColors.inkMuted,
                background: AppColors.surface,
              ),
            ],
          ),
          const SizedBox(height: 15),
          const SectionCard(
            child: Column(
              children: [
                _DiscussionRow(
                  title: 'When should I use a tuple instead of a list?',
                  topic: 'Data structures',
                  replies: '8 replies',
                  activity: 'Active 12 min ago',
                  state: 'Following',
                  color: AppColors.teal,
                ),
                _DiscussionRow(
                  title: 'How I structure my first Python project',
                  topic: 'Project workflow',
                  replies: '5 replies',
                  activity: 'Active yesterday',
                  state: 'Started by me',
                  color: AppColors.coral,
                ),
                _DiscussionRow(
                  title: 'My mental model for decorators',
                  topic: 'Advanced Python',
                  replies: '12 replies',
                  activity: 'Active Sep 24',
                  state: 'Following',
                  color: AppColors.violet,
                ),
                _DiscussionRow(
                  title: 'Good beginner-friendly testing projects?',
                  topic: 'Testing',
                  replies: '3 replies',
                  activity: 'Active Sep 18',
                  state: 'Started by me',
                  color: AppColors.gold,
                ),
              ],
            ),
          ),
        ],
      );
}
