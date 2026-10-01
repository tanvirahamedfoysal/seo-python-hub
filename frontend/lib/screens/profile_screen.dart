part of '../app.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PageHeader(
            eyebrow: 'Account',
            title: 'Profile & settings',
            subtitle: 'Manage how Python Learning Hub works for you.',
          ),
          LayoutBuilder(
            builder: (context, c) => c.maxWidth < 760
                ? const Column(
                    children: [
                      _ProfileCard(),
                      SizedBox(height: 16),
                      _PreferencesCard(),
                      SizedBox(height: 16),
                      _SecurityCard(),
                    ],
                  )
                : const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _ProfileCard()),
                      SizedBox(width: 18),
                      Expanded(
                        child: Column(
                          children: [
                            _PreferencesCard(),
                            SizedBox(height: 16),
                            _SecurityCard(),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      );
}
