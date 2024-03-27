import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:ui_demos/pages/all_pages/02_coffe_maker/constanst.dart';

class FoamPage extends StatefulWidget {
  const FoamPage({
    required this.onTap,
    super.key,
  });
  final void Function() onTap;

  @override
  State<FoamPage> createState() => _FoamPageState();
}

class _FoamPageState extends State<FoamPage> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  double sliderValue = 0;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    )..addListener(() => setState(() {}));

    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    super.initState();

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Constants().backColor.withOpacity(0.6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RotatedBox(
                  quarterTurns: 1,
                  child: SliderTheme(
                    data: const SliderThemeData(trackHeight: 10),
                    child: Transform.scale(
                      alignment: Alignment.centerLeft,
                      scaleX: animation.value,
                      child: Slider(
                        value: sliderValue,
                        onChanged: (newValue) =>
                            setState(() => sliderValue = newValue),
                        max: 100,
                        thumbColor: Constants().whiteColor,
                        activeColor: Constants().whiteColor,
                        inactiveColor: Constants().yellowColor,
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox.square(
                      dimension: 100,
                      child: Transform.scale(
                        scale: animation.value,
                        child: CustomPaint(
                          foregroundPainter:
                              FoamCupPainter(percent: sliderValue / 100),
                          painter: FilledCupPainter(),
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(
                        0,
                        lerpDouble(100, 0, animation.value)!,
                      ),
                      child: Opacity(
                        opacity: animation.value,
                        child: Text(
                          '${sliderValue.toStringAsFixed(0)}%',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(color: Constants().yellowColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: widget.onTap,
            child: Text(
              'NEXT',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Constants().whiteColor),
            ),
          ),
        ],
      ),
    );
  }
}

class FilledCupPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final painter = Paint()
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke
      ..color = Constants().yellowColor;

    final arc1 = Path()
      ..moveTo(0, 0)
      ..arcToPoint(
        Offset(size.width * 0.2, size.height * 0.8),
        radius: const Radius.circular(200),
        clockwise: false,
      );

    canvas
      ..drawPath(arc1, painter)
      ..drawLine(
        Offset(size.width * 0.2, size.height * 0.8),
        Offset(size.width * 0.75, size.height * 0.8),
        painter,
      );

    final arc2 = Path()
      ..moveTo(size.width * 0.75, size.height * 0.8)
      ..arcToPoint(
        Offset(size.width * 0.9, 0),
        radius: const Radius.circular(200),
        clockwise: false,
      );

    canvas.drawPath(arc2, painter);

    final arc3 = Path()
      ..moveTo(size.width * 0.8, size.height * 0.6)
      ..arcToPoint(
        Offset(size.width * 0.9, size.height * 0.15),
        radius: const Radius.circular(15),
        clockwise: false,
      );

    canvas.drawPath(arc3, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class FoamCupPainter extends CustomPainter {
  FoamCupPainter({
    required this.percent,
    super.repaint,
  });

  final double percent;

  @override
  void paint(Canvas canvas, Size size) {
    final painter = Paint()
      ..style = PaintingStyle.fill
      ..color = Constants().whiteColor;

    final path = Path()
      ..moveTo(size.width * 0.07, 0)
      ..arcToPoint(
          Offset(size.width * lerpDouble(0.07, 0.25, percent)!,
              (size.height * percent) * 0.75),
          radius: const Radius.circular(200),
          clockwise: false)
      ..lineTo(size.width * lerpDouble(0.83, 0.7, percent)!,
          (size.height * percent) * 0.75)
      ..arcToPoint(
        Offset(size.width * 0.83, 0),
        radius: const Radius.circular(200),
        clockwise: false,
      );

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
