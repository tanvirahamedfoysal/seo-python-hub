part of '../app.dart';

class _RecentCard extends StatelessWidget {
  const _RecentCard();
  @override
  Widget build(BuildContext context) {
    return const SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CardTitle(title: 'Recently saved', action: 'All bookmarks'),
          SizedBox(height: 15),
          _SavedRow(
            icon: Icons.article_outlined,
            title: 'List comprehensions',
            type: 'Topic · Core Python',
            color: AppColors.teal,
          ),
          _SavedRow(
            icon: Icons.layers_outlined,
            title: 'Build a CLI weather app',
            type: 'Tutorial · 35 min',
            color: AppColors.coral,
          ),
          _SavedRow(
            icon: Icons.menu_book_outlined,
            title: 'Testing with pytest',
            type: 'Guide · Testing',
            color: AppColors.violet,
          ),
        ],
      ),
    );
  }
}
