import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

class FlipNumberWidget extends StatefulWidget {
  final int number;
  final Duration timerDuration;

  const FlipNumberWidget(
      {super.key, required this.number, required this.timerDuration});

  @override
  State<FlipNumberWidget> createState() => _FlipNumberWidgetState();
}

class _FlipNumberWidgetState extends State<FlipNumberWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  late Timer _timer;

  // void _startTimer() {
  //   Duration flipDuration = widget.timerDuration;

  //   _timer = Timer.periodic(flipDuration, (timer) {
  //     _animationController.reset();
  //     _animationController.forward();
  //   });
  // }

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _animation = Tween<double>(begin: -(math.pi * 2), end: -math.pi)
        .animate(_animationController);

    _animation.addListener(() => setState(() {}));

    // _startTimer();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String number =
        widget.number < 10 ? '0${widget.number}' : widget.number.toString();

    _animationController.forward();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ///First element
        Stack(
          children: [
            Container(
              height: 220,
              width: 200,
              decoration: const BoxDecoration(color: Colors.red),
              child: Text(number),
            ),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform(
                  alignment: Alignment.bottomCenter,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateX(_animation.value),
                  child: child,
                );
              },
              child: Container(
                height: 220,
                width: 200,
                decoration: const BoxDecoration(color: Colors.green),
                child: Text(number),
              ),
            ),
          ],
        ),

        ///Division
        const SizedBox(height: 2),

        ///Second element
        Container(
          height: 220,
          width: 200,
          decoration: const BoxDecoration(color: Colors.yellow),
          child: Text(number),
        ),
      ],
    );
  }
}
