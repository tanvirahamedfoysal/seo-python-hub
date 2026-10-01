part of '../app.dart';

class AuthPageFrame extends StatelessWidget {
  const AuthPageFrame({
    required this.child,
    required this.title,
    required this.subtitle,
    super.key,
  });
  final Widget child;
  final String title;
  final String subtitle;

  /*
  Widget build(BuildContext context) => Scaffold(body: SafeArea(child: Center(child: SingleChildScrollView(padding: const EdgeInsets.all(24), child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 470), child: Column(children: [Row(mainAxisAlignment: MainAxisAlignment.center, children: [Container(width: 38, height: 38, decoration: BoxDecoration(color: AppColors.gold, borderRadius: BorderRadius.circular(12)), child: const Icon(Icons.code_rounded, color: AppColors.ink)), const SizedBox(width: 11), const Text('Python Learning Hub', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 17))]), const SizedBox(height: 42), Text(title, style: Theme.of(context).textTheme.headlineLarge, textAlign: TextAlign.center), const SizedBox(height: 8), Text(subtitle, style: const TextStyle(color: AppColors.inkMuted, fontSize: 13, height: 1.45), textAlign: TextAlign.center), const SizedBox(height: 28), child, const SizedBox(height: 22), TextButton.icon(onPressed: () => Navigator.of(context).pushReplacementNamed('/app/dashboard'), icon: const Icon(Icons.arrow_back_rounded, size: 16), label: const Text('Back to the learning hub'))])))));
  */
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 470),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            color: AppColors.gold,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.code_rounded,
                            color: AppColors.ink,
                          ),
                        ),
                        const SizedBox(width: 11),
                        const Text(
                          'Python Learning Hub',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 42),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headlineLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: AppColors.inkMuted,
                        fontSize: 13,
                        height: 1.45,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 28),
                    child,
                    const SizedBox(height: 22),
                    TextButton.icon(
                      onPressed: () => Navigator.of(context)
                          .pushReplacementNamed('/app/dashboard'),
                      icon: const Icon(Icons.arrow_back_rounded, size: 16),
                      label: const Text('Back to the learning hub'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
