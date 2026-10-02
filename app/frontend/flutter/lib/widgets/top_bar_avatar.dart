part of '../app.dart';

class TopBarAvatar extends StatelessWidget {
  const TopBarAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      tooltip: 'Account menu',
      offset: const Offset(0, 44),
      onSelected: (value) {
        if (value == 'profile') {
          Navigator.of(context).pushReplacementNamed('/app/profile');
        }
        if (value == 'signout') {
          Navigator.of(context).pushReplacementNamed('/app/login');
        }
      },
      itemBuilder: (context) => const [
        PopupMenuItem(value: 'profile', child: Text('Profile & settings')),
        PopupMenuItem(value: 'signout', child: Text('Sign out')),
      ],
      child: const CircleAvatar(
        radius: 17,
        backgroundColor: AppColors.coral,
        child: Text(
          'MC',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 11,
          ),
        ),
      ),
    );
  }
}
