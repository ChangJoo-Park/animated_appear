library animated_appear;

import 'dart:async';

import 'package:flutter/material.dart';

/// A wrapper widget for making fade in widget with animation.
///
/// If you need to implement fade in widget, Just wrap your widget.
///
/// ```dart
/// AnimatedAppear(child: Container());
/// ```
///
/// [AnimatedAppear] can appear your widget little bit delayed.
///
/// ```dart
/// AnimatedAppear(
///   delay: const Duration(milliseconds: 500), // default delay is zero.
///   child: Container(),
/// );
/// ```
///
/// [AnimatedAppear] also use slide your widget when appear in.
///
/// ```dart
/// AnimatedAppear(
///   delay: const Duration(milliseconds: 500,),
///   slideBeginOffset: const Offset(0, 0.2), // It makes your widget appear from the bottom.
///   child: Container(),
/// );
/// ```
///
/// [AnimatedAppear] provide [slideEndOffset].
///
/// [AnimatedAppear] can change Curve. you can set [curve] property.
///
/// ```dart
/// AnimatedAppear(
///   curve: Curves.bounceIn, // default curve is [Curves.fastOutSlowIn]
///   child: Container(),
/// );
/// ```
///
class AnimatedAppear extends StatefulWidget {
  const AnimatedAppear({
    Key? key,
    required this.child,
    this.delay = const Duration(milliseconds: 0),
    this.duration = const Duration(milliseconds: 200),
    this.slideBeginOffset = Offset.zero,
    this.slideEndOffset = Offset.zero,
    this.curve = Curves.fastOutSlowIn,
  }) : super(key: key);

  // Widget for appear with transition.
  final Widget child;
  final Duration delay;
  final Duration duration;
  final Offset slideBeginOffset;
  final Offset slideEndOffset;
  final Curve curve;

  @override
  _AnimatedAppearState createState() => _AnimatedAppearState();
}

class _AnimatedAppearState extends State<AnimatedAppear>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideTransitionOffset;
  Timer? _timer;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _slideTransitionOffset = Tween<Offset>(
      begin: widget.slideBeginOffset,
      end: widget.slideEndOffset,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: widget.curve),
    );

    super.initState();

    _animate();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FadeTransition(
        opacity: _animationController,
        child: SlideTransition(
          position: _slideTransitionOffset,
          child: widget.child,
        ),
      );

  _animate() {
    _timer = Timer(widget.delay, () => _animationController.forward());
  }
}
