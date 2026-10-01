part of '../app.dart';

class DesktopTopBar extends StatelessWidget {
  const DesktopTopBar({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      padding: const EdgeInsets.symmetric(horizontal: 38),
      decoration: const BoxDecoration(
        color: AppColors.canvas,
        border: Border(bottom: BorderSide(color: AppColors.line)),
      ),
      child: Row(
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const Spacer(),
          SizedBox(
            width: 235,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search your hub',
                prefixIcon: const Icon(Icons.search_rounded, size: 19),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: const BorderSide(color: AppColors.line),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: const BorderSide(color: AppColors.line),
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          IconButton(
            tooltip: 'Notifications',
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: AppColors.inkMuted,
            ),
            onPressed: () => Navigator.of(context)
                .pushReplacementNamed('/app/notifications'),
          ),
          const SizedBox(width: 8),
          const TopBarAvatar(),
        ],
      ),
    );
  }
}
