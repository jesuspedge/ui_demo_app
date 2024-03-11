import 'dart:math' as math;

import 'package:flutter/material.dart';

class FlipNumberWidget extends StatefulWidget {
  final int number;
  const FlipNumberWidget({super.key, required this.number});

  @override
  State<FlipNumberWidget> createState() => _FlipNumberWidgetState();
}

class _FlipNumberWidgetState extends State<FlipNumberWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    _animation = Tween<double>(begin: -(math.pi * 2), end: -(math.pi * 1.5))
        .animate(_animationController);

    _animation.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String number =
        widget.number < 10 ? '0${widget.number}' : widget.number.toString();

    _animationController
        .forward()
        .whenComplete(() => _animationController.reset());

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
                  animation: _animation,
                  builder: (context, child) {
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateX(_animation.value),
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
          child: Align(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.5,
            child: NumberContainer(number: number),
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