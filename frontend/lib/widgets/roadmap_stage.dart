part of '../app.dart';

class _RoadmapStage extends StatelessWidget {
  const _RoadmapStage({
    required this.title,
    required this.subtitle,
    required this.progress,
    required this.count,
    required this.color,
    required this.topics,
  });
  final String title;
  final String subtitle;
  final double progress;
  final String count;
  final Color color;
  final List<String> topics;
  @override
  Widget build(BuildContext context) => SectionCard(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: .12),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Icon(Icons.layers_outlined, color: color, size: 19),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          color: AppColors.inkMuted,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  count,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w800,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            MiniProgress(value: progress, color: color),
            const SizedBox(height: 16),
            Row(
              children: topics
                  .map(
                    (topic) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: InkWell(
                          onTap: () => _notice(context, 'Opening $topic…'),
                          child: Container(
                            padding: const EdgeInsets.all(11),
                            decoration: BoxDecoration(
                              color: AppColors.canvas,
                              borderRadius: BorderRadius.circular(11),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  progress > 0
                                      ? Icons.check_circle_rounded
                                      : Icons.lock_outline_rounded,
                                  size: 15,
                                  color:
                                      progress > 0 ? color : AppColors.inkMuted,
                                ),
                                const SizedBox(width: 7),
                                Expanded(
                                  child: Text(
                                    topic,
                                    style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      );
}
