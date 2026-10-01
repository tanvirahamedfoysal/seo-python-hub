part of '../app.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  /*
  Widget build(BuildContext context) => AuthPageFrame(title: 'Start learning with intention', subtitle: 'Create a free account to track progress, save lessons, and join the community.', child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [const TextField(decoration: InputDecoration(labelText: 'Display name', prefixIcon: Icon(Icons.person_outline_rounded))), const SizedBox(height: 14), const TextField(decoration: InputDecoration(labelText: 'Email address', prefixIcon: Icon(Icons.mail_outline_rounded))), const SizedBox(height: 14), const TextField(obscureText: true, decoration: InputDecoration(labelText: 'Password', prefixIcon: Icon(Icons.lock_outline_rounded))), const SizedBox(height: 8), const Text('Use at least 8 characters with a number and a symbol.', style: TextStyle(color: AppColors.inkMuted, fontSize: 11)), const SizedBox(height: 14), const TextField(obscureText: true, decoration: InputDecoration(labelText: 'Confirm password', prefixIcon: Icon(Icons.lock_outline_rounded))), const SizedBox(height: 16), const Text('By creating an account, you agree to the Terms of Service and Privacy Policy.', style: TextStyle(color: AppColors.inkMuted, fontSize: 11, height: 1.4)), const SizedBox(height: 18), SizedBox(height: 48, child: FilledButton(onPressed: () => Navigator.of(context).pushReplacementNamed('/app/verify-email'), child: const Text('Create account'))), const SizedBox(height: 14), Row(mainAxisAlignment: MainAxisAlignment.center, children: [const Text('Already have an account?', style: TextStyle(color: AppColors.inkMuted, fontSize: 12)), TextButton(onPressed: () => Navigator.of(context).pushReplacementNamed('/app/login'), child: const Text('Sign in'))])])));
  */
  @override
  Widget build(BuildContext context) => AuthPageFrame(
        title: 'Start learning with intention',
        subtitle:
            'Create a free account to track progress, save lessons, and join the community.',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Display name',
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
            ),
            const SizedBox(height: 14),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email address',
                prefixIcon: Icon(Icons.mail_outline_rounded),
              ),
            ),
            const SizedBox(height: 14),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock_outline_rounded),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Use at least 8 characters with a number and a symbol.',
              style: TextStyle(color: AppColors.inkMuted, fontSize: 11),
            ),
            const SizedBox(height: 14),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm password',
                prefixIcon: Icon(Icons.lock_outline_rounded),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'By creating an account, you agree to the Terms of Service and Privacy Policy.',
              style: TextStyle(
                color: AppColors.inkMuted,
                fontSize: 11,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 18),
            SizedBox(
              height: 48,
              child: FilledButton(
                onPressed: () => Navigator.of(context)
                    .pushReplacementNamed('/app/verify-email'),
                child: const Text('Create account'),
              ),
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(color: AppColors.inkMuted, fontSize: 12),
                ),
                TextButton(
                  onPressed: () =>
                      Navigator.of(context).pushReplacementNamed('/app/login'),
                  child: const Text('Sign in'),
                ),
              ],
            ),
          ],
        ),
      );
}
