part of '../app.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHeader(
          eyebrow: 'Your library',
          title: 'Bookmarks',
          subtitle:
              'Keep the ideas, guides, and projects you want to return to close by.',
          actions: [
            FilledButton.icon(
              onPressed: () => _notice(
                context,
                'Use the bookmark control on any public lesson to save it here.',
              ),
              icon: const Icon(Icons.add_rounded, size: 16),
              label: const Text('How to save'),
            ),
          ],
        ),
        Row(
          children: [
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search bookmarks',
                  prefixIcon: Icon(Icons.search_rounded, size: 19),
                ),
              ),
            ),
            const SizedBox(width: 12),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.filter_list_rounded, size: 17),
              label: const Text('All types'),
            ),
          ],
        ),
        const SizedBox(height: 18),
        const Wrap(
          spacing: 8,
          children: [
            StatusPill('All · 18', color: AppColors.teal),
            StatusPill(
              'Topics · 11',
              color: AppColors.inkMuted,
              background: AppColors.surface,
            ),
            StatusPill(
              'Tutorials · 4',
              color: AppColors.inkMuted,
              background: AppColors.surface,
            ),
            StatusPill(
              'Guides · 3',
              color: AppColors.inkMuted,
              background: AppColors.surface,
            ),
          ],
        ),
        const SizedBox(height: 14),
        const SectionCard(
          child: Column(
            children: [
              _BookmarkRow(
                icon: Icons.article_outlined,
                title: 'List comprehensions',
                summary: 'Write concise transformations over iterable data.',
                type: 'Topic',
                category: 'Core Python',
                saved: 'Saved today',
                color: AppColors.teal,
              ),
              _BookmarkRow(
                icon: Icons.layers_outlined,
                title: 'Build a CLI weather app',
                summary: 'A practical project with APIs, parsing, and tests.',
                type: 'Tutorial',
                category: 'Projects',
                saved: 'Saved Sep 28',
                color: AppColors.coral,
              ),
              _BookmarkRow(
                icon: Icons.menu_book_outlined,
                title: 'Testing with pytest',
                summary: 'A friendly introduction to reliable Python tests.',
                type: 'Guide',
                category: 'Testing',
                saved: 'Saved Sep 22',
                color: AppColors.violet,
              ),
              _BookmarkRow(
                icon: Icons.article_outlined,
                title: 'Exceptions & error handling',
                summary: 'Handle expected failures without hiding real bugs.',
                type: 'Topic',
                category: 'Core Python',
                saved: 'Saved Sep 18',
                color: AppColors.teal,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
