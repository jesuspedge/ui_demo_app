import 'dart:math' as math;

import 'package:flutter/material.dart';

class FlipNumberWidget extends StatefulWidget {
  final int number;
  const FlipNumberWidget({super.key, required this.number});

  @override
  State<FlipNumberWidget> createState() => _FlipNumberWidgetState();
}

class _FlipNumberWidgetState extends State<FlipNumberWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationTopHalfController;
  late AnimationController _animationBottomHalfController;

  late Animation _animationTopHalf;
  late Animation _animationBottomHalf;

  late int _numberWhenAnimationEnds;

  @override
  void initState() {
    super.initState();

    _animationTopHalfController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400))
      ..addListener(() => setState(() => {}));
    _animationBottomHalfController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400))
      ..addListener(() => setState(() => {}));

    _animationTopHalf =
        Tween<double>(begin: -(math.pi * 2), end: -(math.pi * 1.5))
            .animate(_animationTopHalfController);
    _animationBottomHalf =
        Tween<double>(begin: -(math.pi * 1.5), end: -(math.pi))
            .animate(_animationBottomHalfController);

    _numberWhenAnimationEnds = widget.number;
  }

  Future<void> initAnimation() async {
    _animationTopHalfController.forward();
    if (_animationTopHalfController.isCompleted) {
      _animationBottomHalfController.forward();
    }

    if (_animationTopHalfController.isCompleted &&
        _animationBottomHalfController.isCompleted) {
      setState(() => _numberWhenAnimationEnds = widget.number);
      _animationTopHalfController.reset();
      _animationBottomHalfController.reset();
    }
  }

  @override
  void dispose() {
    _animationTopHalfController.dispose();
    _animationBottomHalfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String number =
        widget.number < 10 ? '0${widget.number}' : widget.number.toString();

    if (_numberWhenAnimationEnds != widget.number) initAnimation();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                heightFactor: 0.5,
                child: NumberContainer(number: number),
              ),
              Align(
                alignment: Alignment.topCenter,
                heightFactor: 0.5,
                child: AnimatedBuilder(
                  animation: _animationTopHalf,
                  builder: (context, child) {
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateX(_animationTopHalf.value),
                      child: child,
                    );
                  },
                  child: NumberContainer(number: number),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 2),
        ClipRect(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                heightFactor: 0.5,
                child: NumberContainer(number: number),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                heightFactor: 0.5,
                child: AnimatedBuilder(
                  animation: _animationBottomHalf,
                  builder: (context, child) {
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateX(_animationBottomHalf.value),
                      child: child,
                    );
                  },
                  child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationX(math.pi),
                      child: NumberContainer(number: number)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NumberContainer extends StatelessWidget {
  const NumberContainer({
    super.key,
    required this.number,
  });

  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        number,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 200,
          height: 1,
        ),
      ),
    );
  }
}


///OLD
// return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         ///First element
//         Stack(
//           children: [
//             Container(
//               height: 220,
//               width: 200,
//               decoration: const BoxDecoration(color: Colors.red),
//               child: Text(number),
//             ),
//             AnimatedBuilder(
//               animation: _animation,
//               builder: (context, child) {
//                 return Transform(
//                   alignment: Alignment.bottomCenter,
//                   transform: Matrix4.identity()
//                     ..setEntry(3, 2, 0.001)
//                     ..rotateX(_animation.value),
//                   child: child,
//                 );
//               },
//               child: Container(
//                 height: 220,
//                 width: 200,
//                 decoration: const BoxDecoration(color: Colors.green),
//                 child: Text(number),
//               ),
//             ),
//           ],
//         ),

//         ///Division
//         const SizedBox(height: 2),

//         //Second element
//         Container(
//           height: 220,
//           width: 200,
//           decoration: const BoxDecoration(color: Colors.yellow),
//           child: Text(number),
//         ),
//       ],
//     );