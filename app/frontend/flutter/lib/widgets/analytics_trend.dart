part of '../app.dart';

class _AnalyticsTrend extends StatelessWidget {
  const _AnalyticsTrend();
  @override
  Widget build(BuildContext context) => SectionCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _CardTitle(title: 'Completion trend', action: 'Measured'),
            const SizedBox(height: 19),
            SizedBox(height: 190, child: CustomPaint(painter: _TrendPainter())),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Sep 1', style: _TinyLabel.style),
                Text('Sep 10', style: _TinyLabel.style),
                Text('Sep 20', style: _TinyLabel.style),
                Text('Oct 1', style: _TinyLabel.style),
              ],
            ),
          ],
        ),
      );
}
