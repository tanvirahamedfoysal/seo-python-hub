part of '../app.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});
  @override
  Widget build(BuildContext context) => AuthPageFrame(
        title: 'Check your inbox',
        subtitle:
            'We sent a verification link to the email address you used to register.',
        child: Column(
          children: [
            Container(
              width: 74,
              height: 74,
              decoration: BoxDecoration(
                color: AppColors.tealSoft,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Icon(
                Icons.mark_email_read_outlined,
                color: AppColors.teal,
                size: 37,
              ),
            ),
            const SizedBox(height: 22),
            const Text(
              'Almost there',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            const Text(
              'Verify your email to unlock progress tracking, bookmarks, and community participation.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.inkMuted,
                fontSize: 13,
                height: 1.45,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: FilledButton(
                onPressed: () => Navigator.of(context)
                    .pushReplacementNamed('/app/dashboard'),
                child: const Text('I have verified my email'),
              ),
            ),
            const SizedBox(height: 9),
            TextButton(
              onPressed: () => _notice(context, 'Verification email resent'),
              child: const Text('Resend verification email'),
            ),
            const SizedBox(height: 8),
            const Text(
              'You can browse public learning content while you wait.',
              style: TextStyle(color: AppColors.inkMuted, fontSize: 11),
            ),
          ],
        ),
      );
}
