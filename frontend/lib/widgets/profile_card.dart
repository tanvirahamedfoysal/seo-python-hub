part of '../app.dart';

class _ProfileCard extends StatelessWidget {
  const _ProfileCard();
  @override
  Widget build(BuildContext context) => SectionCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Personal details',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const CircleAvatar(
                  radius: 31,
                  backgroundColor: AppColors.coral,
                  child: Text(
                    'MC',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Maya Chen',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Learner · Administrator',
                      style: TextStyle(color: AppColors.inkMuted, fontSize: 12),
                    ),
                    const SizedBox(height: 9),
                    TextButton(
                      onPressed: () => _notice(
                        context,
                        'Avatar upload is ready to connect to /api/v1/users/me/avatar.',
                      ),
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      child: const Text('Change photo'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 22),
            TextFormField(
              initialValue: 'Maya Chen',
              decoration: const InputDecoration(labelText: 'Display name'),
            ),
            const SizedBox(height: 14),
            TextFormField(
              initialValue: 'maya.chen@example.com',
              decoration: const InputDecoration(
                labelText: 'Email address',
                suffixIcon: Icon(Icons.verified_rounded, color: AppColors.teal),
              ),
            ),
            const SizedBox(height: 14),
            TextFormField(
              initialValue: 'Learning in public, one small project at a time.',
              maxLines: 3,
              decoration: const InputDecoration(labelText: 'Bio (optional)'),
            ),
            const SizedBox(height: 18),
            Align(
              alignment: Alignment.centerRight,
              child: FilledButton(
                onPressed: () => _notice(context, 'Profile saved'),
                child: const Text('Save changes'),
              ),
            ),
          ],
        ),
      );
}
