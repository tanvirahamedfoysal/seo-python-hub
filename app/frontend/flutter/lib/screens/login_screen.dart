part of '../app.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscure = true;
  bool loading = false;
  /*
  Widget build(BuildContext context) => AuthPageFrame(title: 'Welcome back', subtitle: 'Sign in to continue your learning journey.', child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [const TextField(decoration: InputDecoration(labelText: 'Email address', prefixIcon: Icon(Icons.mail_outline_rounded))), const SizedBox(height: 14), TextField(obscureText: obscure, decoration: InputDecoration(labelText: 'Password', prefixIcon: const Icon(Icons.lock_outline_rounded), suffixIcon: IconButton(tooltip: obscure ? 'Show password' : 'Hide password', icon: Icon(obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined), onPressed: () => setState(() => obscure = !obscure)))), Align(alignment: Alignment.centerRight, child: TextButton(onPressed: () => Navigator.of(context).pushReplacementNamed('/app/forgot-password'), child: const Text('Forgot password?'))), const SizedBox(height: 8), SizedBox(height: 48, child: FilledButton(onPressed: loading ? null : () { setState(() => loading = true); Future.delayed(const Duration(milliseconds: 500), () { if (mounted) Navigator.of(context).pushReplacementNamed('/app/dashboard'); }); }, child: loading ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)) : const Text('Sign in'))), const SizedBox(height: 16), Row(mainAxisAlignment: MainAxisAlignment.center, children: [const Text('New to the Hub?', style: TextStyle(color: AppColors.inkMuted, fontSize: 12)), TextButton(onPressed: () => Navigator.of(context).pushReplacementNamed('/app/register'), child: const Text('Create an account'))])])));
  */
  @override
  Widget build(BuildContext context) => AuthPageFrame(
        title: 'Welcome back',
        subtitle: 'Sign in to continue your learning journey.',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email address',
                prefixIcon: Icon(Icons.mail_outline_rounded),
              ),
            ),
            const SizedBox(height: 14),
            TextField(
              obscureText: obscure,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(Icons.lock_outline_rounded),
                suffixIcon: IconButton(
                  tooltip: obscure ? 'Show password' : 'Hide password',
                  icon: Icon(
                    obscure
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  onPressed: () => setState(() => obscure = !obscure),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => Navigator.of(context)
                    .pushReplacementNamed('/app/forgot-password'),
                child: const Text('Forgot password?'),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 48,
              child: FilledButton(
                onPressed: loading
                    ? null
                    : () {
                        setState(() => loading = true);
                        final navigator = Navigator.of(context);
                        Future.delayed(const Duration(milliseconds: 500), () {
                          if (!mounted) return;
                          navigator.pushReplacementNamed('/app/dashboard');
                        });
                      },
                child: loading
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text('Sign in'),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'New to the Hub?',
                  style: TextStyle(color: AppColors.inkMuted, fontSize: 12),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context)
                      .pushReplacementNamed('/app/register'),
                  child: const Text('Create an account'),
                ),
              ],
            ),
          ],
        ),
      );
}
