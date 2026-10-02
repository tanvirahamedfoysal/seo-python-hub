part of '../app.dart';

class RoadmapManagementScreen extends StatelessWidget {
  const RoadmapManagementScreen({super.key});
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            eyebrow: 'Learning architecture',
            title: 'Roadmap management',
            subtitle:
                'Keep the public learning path ordered, clear, and connected.',
            actions: [
              OutlinedButton.icon(
                onPressed: () => _notice(context, 'Public roadmap preview'),
                icon: const Icon(Icons.open_in_new_rounded, size: 16),
                label: const Text('Preview public page'),
              ),
              FilledButton.icon(
                onPressed: () => _notice(context, 'Roadmap saved'),
                icon: const Icon(Icons.save_outlined, size: 16),
                label: const Text('Save changes'),
              ),
            ],
          ),
          const SectionCard(
            child: Row(
              children: [
                Icon(
                  Icons.check_circle_rounded,
                  color: AppColors.teal,
                  size: 20,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Validation passed for 47 nodes and 62 prerequisite links.',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ),
                StatusPill('1 suggestion', color: AppColors.gold),
              ],
            ),
          ),
          const SizedBox(height: 15),
          const SectionCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Stages & nodes',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 14),
                _RoadmapAdminRow(
                  stage: 'STAGE 1',
                  title: 'Python fundamentals',
                  nodes: '18 nodes',
                  status: 'Published',
                  color: AppColors.teal,
                  indent: 0,
                ),
                _RoadmapAdminRow(
                  stage: '01.03',
                  title: 'Control flow',
                  nodes: 'Topic linked',
                  status: 'Ready',
                  color: AppColors.coral,
                  indent: 1,
                ),
                _RoadmapAdminRow(
                  stage: '01.04',
                  title: 'Functions & return values',
                  nodes: 'Topic linked',
                  status: 'Ready',
                  color: AppColors.coral,
                  indent: 1,
                ),
                _RoadmapAdminRow(
                  stage: 'STAGE 2',
                  title: 'Core data structures',
                  nodes: '11 nodes',
                  status: 'Published',
                  color: AppColors.violet,
                  indent: 0,
                ),
                _RoadmapAdminRow(
                  stage: '02.01',
                  title: 'Lists, tuples & sets',
                  nodes: 'Topic linked',
                  status: 'Ready',
                  color: AppColors.violet,
                  indent: 1,
                ),
                _RoadmapAdminRow(
                  stage: '02.02',
                  title: 'Dictionaries',
                  nodes: 'Topic not linked',
                  status: 'Needs link',
                  color: AppColors.gold,
                  indent: 1,
                ),
              ],
            ),
          ),
        ],
      );
}
