part of '../app.dart';

class _ActivityCard extends StatelessWidget {
  const _ActivityCard();
  @override
  Widget build(BuildContext context) {
    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _CardTitle(title: 'Learning activity', action: 'View activity'),
          const SizedBox(height: 24),
          SizedBox(
            height: 160,
            child: CustomPaint(painter: _ActivityPainter()),
          ),
          const SizedBox(height: 15),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Mon', style: _TinyLabel.style),
              Text('Tue', style: _TinyLabel.style),
              Text('Wed', style: _TinyLabel.style),
              Text('Thu', style: _TinyLabel.style),
              Text('Fri', style: _TinyLabel.style),
              Text('Sat', style: _TinyLabel.style),
              Text('Sun', style: _TinyLabel.style),
            ],
          ),
        ],
      ),
    );
  }
}
