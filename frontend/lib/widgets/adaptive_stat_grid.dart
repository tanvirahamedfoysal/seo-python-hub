part of '../app.dart';

class AdaptiveStatGrid extends StatelessWidget {
  const AdaptiveStatGrid({
    required this.children,
    required this.childAspectRatio,
    required this.crossAxisSpacing,
    required this.mainAxisSpacing,
    required this.shrinkWrap,
    required this.physics,
    super.key,
  });

  final List<Widget> children;
  final double childAspectRatio;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final bool shrinkWrap;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          final columns = constraints.maxWidth < 560 ? 2 : 4;
          final ratio = constraints.maxWidth < 560
              ? childAspectRatio * .7
              : childAspectRatio;
          return GridView.count(
            crossAxisCount: columns,
            childAspectRatio: ratio,
            crossAxisSpacing: crossAxisSpacing,
            mainAxisSpacing: mainAxisSpacing,
            shrinkWrap: shrinkWrap,
            physics: physics,
            children: children,
          );
        },
      );
}
