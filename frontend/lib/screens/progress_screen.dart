part of '../app.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final stages = [
      const _RoadmapStage(
        title: 'Orientation & setup',
        subtitle: 'Getting comfortable with the tools',
        progress: .96,
        count: '6 / 6',
        color: AppColors.teal,
        topics: [
          'What is programming?',
          'Install Python',
          'Your first program',
        ],
      ),
      const _RoadmapStage(
        title: 'Python fundamentals',
        subtitle: 'The building blocks of every program',
        progress: .72,
        count: '13 / 18',
        color: AppColors.coral,
        topics: [
          'Variables & values',
          'Control flow',
          'Functions & return values',
        ],
      ),
      const _RoadmapStage(
        title: 'Core data structures',
        subtitle: 'Modeling and transforming information',
        progress: .18,
        count: '2 / 11',
        color: AppColors.violet,
        topics: ['Lists & tuples', 'Dictionaries', 'Comprehensions'],
      ),
      const _RoadmapStage(
        title: 'Reusable Python programs',
        subtitle: 'Build robust, maintainable tools',
        progress: 0,
        count: '0 / 14',
        color: AppColors.gold,
        topics: ['Modules & imports', 'Exceptions', 'Files & paths'],
      ),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHeader(
          eyebrow: 'Your learning path',
          title: 'Progress',
          subtitle:
              'A private view of your journey through the Python roadmap.',
          actions: [
            OutlinedButton.icon(
              onPressed: () => _notice(context, 'Progress refreshed'),
              icon: const Icon(Icons.refresh_rounded, size: 16),
              label: const Text('Refresh'),
            ),
          ],
        ),
        const SectionCard(
          child: Row(
            children: [
              SizedBox(
                width: 102,
                height: 102,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularProgressIndicator(
                      value: .42,
                      strokeWidth: 10,
                      backgroundColor: AppColors.line,
                      valueColor: AlwaysStoppedAnimation(AppColors.teal),
                    ),
                    Text(
                      '42%',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 25),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'You are building a strong foundation.',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(height: 7),
                    Text(
                      '24 topics completed across 2 stages. Keep your 12-day streak going with one focused lesson today.',
                      style: TextStyle(
                        color: AppColors.inkMuted,
                        fontSize: 13,
                        height: 1.45,
                      ),
                    ),
                    SizedBox(height: 13),
                    Wrap(
                      spacing: 20,
                      runSpacing: 8,
                      children: [
                        Text(
                          '24 completed',
                          style: TextStyle(
                            color: AppColors.teal,
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          '5 in progress',
                          style: TextStyle(
                            color: AppColors.coral,
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          '28 not started',
                          style: TextStyle(
                            color: AppColors.inkMuted,
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 22),
        Row(
          children: [
            Text(
              'Roadmap stages',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.tune_rounded, size: 16),
              label: const Text('Filter'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...stages.map(
          (stage) =>
              Padding(padding: const EdgeInsets.only(bottom: 12), child: stage),
        ),
        const SizedBox(height: 8),
        SectionCard(
          child: Row(
            children: [
              const Icon(
                Icons.info_outline_rounded,
                color: AppColors.inkMuted,
                size: 18,
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  'Completion is recorded when the API confirms a topic is finished. Every node links back to its canonical public lesson.',
                  style: TextStyle(color: AppColors.inkMuted, fontSize: 12),
                ),
              ),
              TextButton(
                onPressed: () => _notice(context, 'Opening public roadmap…'),
                child: const Text('Public roadmap'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
