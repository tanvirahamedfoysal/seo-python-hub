part of '../app.dart';

class _RoadmapAdminRow extends StatelessWidget {
  const _RoadmapAdminRow({
    required this.stage,
    required this.title,
    required this.nodes,
    required this.status,
    required this.color,
    required this.indent,
  });
  final String stage;
  final String title;
  final String nodes;
  final String status;
  final Color color;
  final int indent;
  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.fromLTRB(indent * 28.0, 8, 0, 8),
        child: Row(
          children: [
            Icon(
              indent == 0
                  ? Icons.folder_open_outlined
                  : Icons.subdirectory_arrow_right_rounded,
              color: color,
              size: 18,
            ),
            const SizedBox(width: 10),
            Text(
              stage,
              style: TextStyle(
                color: color,
                fontSize: 10,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: indent == 0 ? 13 : 12,
                      fontWeight:
                          indent == 0 ? FontWeight.w800 : FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    nodes,
                    style: const TextStyle(
                        color: AppColors.inkMuted, fontSize: 10),
                  ),
                ],
              ),
            ),
            StatusPill(
              status,
              color: status == 'Needs link' ? AppColors.gold : AppColors.teal,
            ),
            const SizedBox(width: 6),
            const Icon(
              Icons.drag_indicator_rounded,
              color: AppColors.inkMuted,
              size: 18,
            ),
          ],
        ),
      );
}
