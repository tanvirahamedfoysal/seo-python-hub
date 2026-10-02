part of '../app.dart';

class _UserRow extends StatelessWidget {
  const _UserRow({
    required this.initials,
    required this.name,
    required this.email,
    required this.role,
    required this.status,
    required this.joined,
    required this.color,
  });
  final String initials;
  final String name;
  final String email;
  final String role;
  final String status;
  final String joined;
  final Color color;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            CircleAvatar(
              radius: 21,
              backgroundColor: color.withValues(alpha: .15),
              child: Text(
                initials,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w800,
                  fontSize: 11,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    email,
                    style: const TextStyle(
                        color: AppColors.inkMuted, fontSize: 10),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                role,
                style:
                    const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                joined,
                style: const TextStyle(color: AppColors.inkMuted, fontSize: 10),
              ),
            ),
            StatusPill(
              status,
              color: status == 'Active' ? AppColors.teal : AppColors.coral,
            ),
            const SizedBox(width: 7),
            IconButton(
              tooltip: 'User actions',
              icon: const Icon(Icons.more_horiz_rounded,
                  color: AppColors.inkMuted),
              onPressed: () => _notice(context, 'User action menu for $name'),
            ),
          ],
        ),
      );
}
