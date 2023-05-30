import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum Direction { fromTop(), fromBottom, fromLeft, fromRight }

class FadeAnimation extends StatelessWidget {
  const FadeAnimation({
    super.key,
    required this.delay,
    required this.child,
    required this.direction,
  });

  final double delay;
  final Widget child;
  final Direction direction;

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween(
        'opacity',
        Tween<double>(begin: 0, end: 1),
        duration: const Duration(milliseconds: 500),
      )
      ..tween(
          'translate',
          Tween<double>(
              begin: direction == Direction.fromTop ||
                      direction == Direction.fromLeft
                  ? -30
                  : 30,
              end: 0),
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut);

    return PlayAnimationBuilder<Movie>(
        delay: Duration(milliseconds: (500 * delay).round()),
        tween: tween,
        duration: tween.duration,
        child: child,
        builder: (_, value, child) => Opacity(
              opacity: value.get('opacity'),
              child: Transform.translate(
                offset: Offset(
                    direction == Direction.fromLeft ||
                            direction == Direction.fromRight
                        ? value.get('translate')
                        : 0,
                    direction == Direction.fromTop ||
                            direction == Direction.fromBottom
                        ? value.get('translate')
                        : 0),
                child: child,
              ),
            ));
  }
}
