part of '../app.dart';

class _ContentPulse extends StatelessWidget {
  const _ContentPulse();
  @override
  Widget build(BuildContext context) => SectionCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _CardTitle(title: 'Content pulse', action: 'Analytics'),
            const SizedBox(height: 22),
            SizedBox(height: 150, child: CustomPaint(painter: _PulsePainter())),
            const SizedBox(height: 11),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Sep 25', style: _TinyLabel.style),
                Text('Sep 27', style: _TinyLabel.style),
                Text('Sep 29', style: _TinyLabel.style),
                Text('Oct 1', style: _TinyLabel.style),
              ],
            ),
          ],
        ),
      );
}
