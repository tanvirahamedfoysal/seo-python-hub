part of '../app.dart';

class _SecurityCard extends StatelessWidget {
  const _SecurityCard();
  @override
  Widget build(BuildContext context) => SectionCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Security & account',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 13),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                Icons.lock_outline_rounded,
                color: AppColors.teal,
              ),
              title: Text(
                'Change password',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
              ),
              subtitle: Text(
                'Last changed 3 months ago',
                style: TextStyle(color: AppColors.inkMuted, fontSize: 11),
              ),
              trailing: Icon(
                Icons.chevron_right_rounded,
                color: AppColors.inkMuted,
              ),
            ),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.email_outlined, color: AppColors.teal),
              title: Text(
                'Email verified',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
              ),
              subtitle: Text(
                'maya.chen@example.com',
                style: TextStyle(color: AppColors.inkMuted, fontSize: 11),
              ),
              trailing: StatusPill('Verified', color: AppColors.teal),
            ),
            const Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(
                Icons.delete_outline_rounded,
                color: AppColors.coral,
              ),
              title: const Text(
                'Delete account',
                style: TextStyle(
                  color: AppColors.coral,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: const Text(
                'This action cannot be undone.',
                style: TextStyle(color: AppColors.inkMuted, fontSize: 11),
              ),
              onTap: () => _confirmDelete(context),
            ),
          ],
        ),
      );
}
