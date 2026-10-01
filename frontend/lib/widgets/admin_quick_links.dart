part of '../app.dart';

class _AdminQuickLinks extends StatelessWidget {
  const _AdminQuickLinks();
  @override
  Widget build(BuildContext context) => const SectionCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quick links',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 15),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _AdminLink(
                  icon: Icons.article_outlined,
                  label: 'Create content',
                  route: '/app/admin/content',
                  color: AppColors.teal,
                ),
                _AdminLink(
                  icon: Icons.account_tree_outlined,
                  label: 'Edit roadmap',
                  route: '/app/admin/roadmap',
                  color: AppColors.violet,
                ),
                _AdminLink(
                  icon: Icons.people_outline_rounded,
                  label: 'Manage users',
                  route: '/app/admin/users',
                  color: AppColors.coral,
                ),
                _AdminLink(
                  icon: Icons.bar_chart_rounded,
                  label: 'View analytics',
                  route: '/app/admin/analytics',
                  color: AppColors.gold,
                ),
              ],
            ),
          ],
        ),
      );
}
