part of '../app.dart';

class _StudyChart extends StatelessWidget {
  const _StudyChart();
  @override
  Widget build(BuildContext context) => SectionCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _CardTitle(title: 'Study time', action: 'By week'),
            const SizedBox(height: 20),
            SizedBox(height: 180, child: CustomPaint(painter: _BarPainter())),
            const SizedBox(height: 12),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('W1', style: _TinyLabel.style),
                Text('W2', style: _TinyLabel.style),
                Text('W3', style: _TinyLabel.style),
                Text('W4', style: _TinyLabel.style),
              ],
            ),
          ],
        ),
      );
}
