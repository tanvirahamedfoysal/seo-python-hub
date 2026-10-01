part of '../app.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            eyebrow: 'Private conversations',
            title: 'Messages',
            subtitle:
                'Talk through tricky ideas with your mentors and learning groups.',
            actions: [
              FilledButton.icon(
                onPressed: () => _notice(context, 'New conversation flow'),
                icon: const Icon(Icons.edit_rounded, size: 16),
                label: const Text('New message'),
              ),
            ],
          ),
          Row(
            children: [
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search conversations',
                    prefixIcon: Icon(Icons.search_rounded, size: 19),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.filter_list_rounded, size: 17),
                label: const Text('All'),
              ),
            ],
          ),
          const SizedBox(height: 17),
          SectionCard(
            child: Column(
              children: [
                _ConversationRow(
                  name: 'Jules Martin',
                  preview: 'Try writing the test before changing the function.',
                  time: '12 min',
                  initials: 'JM',
                  color: AppColors.coral,
                  unread: 2,
                  onTap: () => Navigator.of(context)
                      .pushReplacementNamed('/app/messages/mentor-jules'),
                ),
                _ConversationRow(
                  name: 'Python Study Circle',
                  preview: 'Nadia: Has anyone tried the new data guide?',
                  time: '2 h',
                  initials: 'PS',
                  color: AppColors.teal,
                  unread: 0,
                  onTap: () => _notice(context, 'Opening group conversation…'),
                ),
                _ConversationRow(
                  name: 'Alex Rivera',
                  preview: 'The async example made it click. Thanks!',
                  time: 'Yesterday',
                  initials: 'AR',
                  color: AppColors.violet,
                  unread: 0,
                  onTap: () => _notice(context, 'Opening conversation…'),
                ),
                _ConversationRow(
                  name: 'Project accountability',
                  preview: 'Your weekly check-in is due tomorrow.',
                  time: 'Sep 27',
                  initials: 'PA',
                  color: AppColors.gold,
                  unread: 0,
                  onTap: () => _notice(context, 'Opening group conversation…'),
                ),
              ],
            ),
          ),
        ],
      );
}
