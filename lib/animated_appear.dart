library animated_appear;

import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedAppear extends StatefulWidget {
  const AnimatedAppear({
    Key? key,
    required this.child,
    this.delay = const Duration(milliseconds: 0),
    this.duration = const Duration(milliseconds: 0),
    this.slideBeginOffset = const Offset(0, .2),
    this.slideEndOffset = Offset.zero,
    this.curve = Curves.fastOutSlowIn,
  }) : super(key: key);

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
