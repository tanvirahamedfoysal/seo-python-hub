part of '../app.dart';

class _AdminAttention extends StatelessWidget {
  const _AdminAttention();
  @override
  Widget build(BuildContext context) => const SectionCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _CardTitle(title: 'Needs attention', action: 'Open queue'),
            SizedBox(height: 15),
            _AttentionRow(
              icon: Icons.shield_outlined,
              title: 'Moderation reports',
              subtitle: '6 open reports · 2 urgent',
              color: AppColors.coral,
              route: '/app/admin/moderation',
            ),
            _AttentionRow(
              icon: Icons.pending_actions_rounded,
              title: 'Content review',
              subtitle: '6 drafts ready for review',
              color: AppColors.violet,
              route: '/app/admin/content',
            ),
            _AttentionRow(
              icon: Icons.account_tree_outlined,
              title: 'Roadmap validation',
              subtitle: '1 link needs attention',
              color: AppColors.gold,
              route: '/app/admin/roadmap',
            ),
          ],
        ),
      );
}
