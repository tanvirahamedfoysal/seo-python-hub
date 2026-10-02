part of '../app.dart';

class ContentManagementScreen extends StatelessWidget {
  const ContentManagementScreen({super.key});
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            eyebrow: 'Editorial workspace',
            title: 'Content management',
            subtitle: 'Review, refine, and publish the learning library.',
            actions: [
              FilledButton.icon(
                onPressed: () => _notice(context, 'Create content form'),
                icon: const Icon(Icons.add_rounded, size: 16),
                label: const Text('New content'),
              ),
            ],
          ),
          Row(
            children: [
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search title or slug',
                    prefixIcon: Icon(Icons.search_rounded, size: 18),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.filter_list_rounded, size: 16),
                label: const Text('All statuses'),
              ),
            ],
          ),
          const SizedBox(height: 17),
          const Wrap(
            spacing: 8,
            children: [
              StatusPill('All · 184', color: AppColors.teal),
              StatusPill(
                'Published · 161',
                color: AppColors.teal,
                background: AppColors.tealSoft,
              ),
              StatusPill(
                'Draft · 17',
                color: AppColors.violet,
                background: AppColors.violetSoft,
              ),
              StatusPill(
                'Archived · 6',
                color: AppColors.inkMuted,
                background: AppColors.surface,
              ),
            ],
          ),
          const SizedBox(height: 14),
          const SectionCard(
            child: Column(
              children: [
                _ContentRow(
                  type: 'TOPIC',
                  title: 'Functions & return values',
                  slug: '/topics/python-functions',
                  author: 'Maya Chen',
                  date: 'Updated today',
                  state: 'Published',
                  color: AppColors.teal,
                ),
                _ContentRow(
                  type: 'GUIDE',
                  title: 'Testing with pytest',
                  slug: '/guides/testing-with-pytest',
                  author: 'Jules Martin',
                  date: 'Updated Sep 29',
                  state: 'Published',
                  color: AppColors.violet,
                ),
                _ContentRow(
                  type: 'TUTORIAL',
                  title: 'Build a CLI weather app',
                  slug: '/tutorials/cli-weather-app',
                  author: 'Nadia Cole',
                  date: 'Updated Sep 28',
                  state: 'Draft',
                  color: AppColors.coral,
                ),
                _ContentRow(
                  type: 'TOPIC',
                  title: 'Asyncio event loops',
                  slug: '/topics/python-asyncio',
                  author: 'Maya Chen',
                  date: 'Updated Sep 26',
                  state: 'Needs review',
                  color: AppColors.gold,
                ),
              ],
            ),
          ),
        ],
      );
}
