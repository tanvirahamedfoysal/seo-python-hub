part of '../app.dart';

class StatCard extends StatelessWidget {
  const StatCard({
    required this.label,
    required this.value,
    required this.caption,
    required this.icon,
    required this.color,
    super.key,
  });
  final String label;
  final String value;
  final String caption;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final compact =
            constraints.maxWidth < 190 || constraints.maxHeight < 150;
        return SectionCard(
          padding: EdgeInsets.all(compact ? 9 : 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    width: compact ? 27 : 34,
                    height: compact ? 27 : 34,
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: .13),
                      borderRadius: BorderRadius.circular(compact ? 8 : 10),
                    ),
                    child: Icon(icon, color: color, size: compact ? 15 : 18),
                  ),
                  const Spacer(),
                  if (!compact)
                    const Icon(
                      Icons.more_horiz_rounded,
                      color: AppColors.inkMuted,
                      size: 18,
                    ),
                ],
              ),
              SizedBox(height: compact ? 4 : 20),
              Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: compact ? 19 : 26,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -.7,
                ),
              ),
              SizedBox(height: compact ? 0 : 3),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: compact ? 10 : 12,
                  color: AppColors.inkMuted,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: compact ? 2 : 11),
              Text(
                caption,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: compact ? 8 : 11,
                  color: color,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
