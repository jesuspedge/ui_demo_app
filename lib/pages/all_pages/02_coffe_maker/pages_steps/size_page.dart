import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:ui_demos/pages/all_pages/02_coffe_maker/constanst.dart';

class SizePage extends StatefulWidget {
  final void Function() onTap;
  const SizePage({super.key, required this.onTap});

  @override
  State<SizePage> createState() => _SizePageState();
}

class _SizePageState extends State<SizePage> with TickerProviderStateMixin {
  late AnimationController animationController1;
  late AnimationController animationController2;
  late AnimationController animationController3;
  late AnimationController animationController4;

  late Animation scaleAnimation1;
  late Animation scaleAnimation2;
  late Animation scaleAnimation3;
  late Animation scaleAnimation4;

  Future<void> initAnimations() async {
    animationController1.forward();
    await Future.delayed(const Duration(milliseconds: 150));
    animationController2.forward();
    await Future.delayed(const Duration(milliseconds: 150));
    animationController3.forward();
    await Future.delayed(const Duration(milliseconds: 150));
    animationController4.forward();
  }

  @override
  void initState() {
    animationController1 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..addListener(() => setState(() {}));

    animationController2 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..addListener(() => setState(() {}));

    animationController3 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..addListener(() => setState(() {}));

    animationController4 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..addListener(() => setState(() {}));

    scaleAnimation1 = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: animationController1, curve: Curves.fastOutSlowIn));

    scaleAnimation2 = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: animationController2, curve: Curves.fastOutSlowIn));

    scaleAnimation3 = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: animationController3, curve: Curves.fastOutSlowIn));

    scaleAnimation4 = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: animationController4, curve: Curves.fastOutSlowIn));

    super.initState();

    initAnimations();
  }

  @override
  void dispose() {
    animationController1.dispose();
    animationController2.dispose();
    animationController3.dispose();
    animationController4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: widget.onTap,
                  child: Transform.scale(
                    scale: scaleAnimation1.value,
                    child: Opacity(
                      opacity: scaleAnimation1.value,
                      child: ColoredBox(
                        color: Constants().backColor.withOpacity(0.2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Transform.scale(
                              scale: 0.6,
                              child: SizedBox.square(
                                dimension: 100,
                                child: CustomPaint(
                                  foregroundPainter: CupPainter(),
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(
                                0,
                                lerpDouble(200, 0, scaleAnimation1.value)!
                                    .toDouble(),
                              ),
                              child: Text(
                                'S',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(color: Constants().whiteColor),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: widget.onTap,
                  child: Transform.scale(
                    scale: scaleAnimation2.value,
                    child: Opacity(
                      opacity: scaleAnimation2.value,
                      child: ColoredBox(
                        color: Constants().backColor.withOpacity(0.4),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Transform.scale(
                              scale: 0.7,
                              child: SizedBox.square(
                                dimension: 100,
                                child: CustomPaint(
                                  foregroundPainter: CupPainter(),
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(
                                0,
                                lerpDouble(200, 0, scaleAnimation2.value)!
                                    .toDouble(),
                              ),
                              child: Text(
                                'M',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(color: Constants().whiteColor),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: widget.onTap,
                  child: Transform.scale(
                    scale: scaleAnimation4.value,
                    child: Opacity(
                      opacity: scaleAnimation4.value,
                      child: ColoredBox(
                        color: Constants().backColor.withOpacity(0.6),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Transform.scale(
                              scale: 0.8,
                              child: SizedBox.square(
                                dimension: 100,
                                child: CustomPaint(
                                  foregroundPainter: CupPainter(),
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(
                                0,
                                lerpDouble(200, 0, scaleAnimation4.value)!
                                    .toDouble(),
                              ),
                              child: Text(
                                'L',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(color: Constants().whiteColor),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: widget.onTap,
                  child: Transform.scale(
                    scale: scaleAnimation3.value,
                    child: Opacity(
                      opacity: scaleAnimation3.value,
                      child: ColoredBox(
                        color: Constants().backColor.withOpacity(0.8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Transform.scale(
                              scale: 0.95,
                              child: SizedBox.square(
                                dimension: 100,
                                child: CustomPaint(
                                  foregroundPainter: CupPainter(),
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(
                                0,
                                lerpDouble(200, 0, scaleAnimation3.value)!
                                    .toDouble(),
                              ),
                              child: Text(
                                'XL',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(color: Constants().whiteColor),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CupPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final painter = Paint()
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke
      ..color = Constants().yellowColor;

    final arc1 = Path();
    arc1.moveTo(0, 0);
    arc1.arcToPoint(Offset(size.width * 0.2, size.height * 0.8),
        radius: const Radius.circular(200), clockwise: false);

    canvas.drawPath(arc1, painter);

    canvas.drawLine(Offset(size.width * 0.2, size.height * 0.8),
        Offset(size.width * 0.75, size.height * 0.8), painter);

    final arc2 = Path();
    arc2.moveTo(size.width * 0.75, size.height * 0.8);
    arc2.arcToPoint(Offset(size.width * 0.9, 0),
        radius: const Radius.circular(200), clockwise: false);

    canvas.drawPath(arc2, painter);

    canvas.drawLine(Offset(size.width * 0.9, 0), const Offset(0, 0), painter);

    final arc3 = Path();
    arc3.moveTo(size.width * 0.8, size.height * 0.6);
    arc3.arcToPoint(Offset(size.width * 0.9, size.height * 0.15),
        radius: const Radius.circular(15), clockwise: false);

    canvas.drawPath(arc3, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
