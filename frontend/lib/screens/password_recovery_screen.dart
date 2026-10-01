part of '../app.dart';

class PasswordRecoveryScreen extends StatelessWidget {
  const PasswordRecoveryScreen({required this.reset, super.key});
  final bool reset;
  @override
  Widget build(BuildContext context) => AuthPageFrame(
        title: reset ? 'Choose a new password' : 'Reset your password',
        subtitle: reset
            ? 'Make it memorable for you and difficult for anyone else.'
            : 'We will send a neutral recovery link if the account exists.',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (!reset) ...[
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email address',
                  prefixIcon: Icon(Icons.mail_outline_rounded),
                ),
              ),
              const SizedBox(height: 18),
              SizedBox(
                height: 48,
                child: FilledButton(
                  onPressed: () => _notice(
                    context,
                    'If the account exists, a recovery link is on its way.',
                  ),
                  child: const Text('Send recovery link'),
                ),
              ),
            ] else ...[
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'New password',
                  prefixIcon: Icon(Icons.lock_outline_rounded),
                ),
              ),
              const SizedBox(height: 14),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm new password',
                  prefixIcon: Icon(Icons.lock_outline_rounded),
                ),
              ),
              const SizedBox(height: 18),
              SizedBox(
                height: 48,
                child: FilledButton(
                  onPressed: () =>
                      Navigator.of(context).pushReplacementNamed('/app/login'),
                  child: const Text('Save new password'),
                ),
              ),
            ],
            const SizedBox(height: 14),
            TextButton(
              onPressed: () =>
                  Navigator.of(context).pushReplacementNamed('/app/login'),
              child: const Text('Back to sign in'),
            ),
          ],
        ),
      );
}
