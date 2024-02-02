import 'package:flutter/material.dart';

import 'package:ui_demos/pages/all_pages/02_coffe_maker/constanst.dart';

class SizePage extends StatelessWidget {
  final void Function() onTap;
  const SizePage({super.key, required this.onTap});

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
                  onTap: onTap,
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
                        Text(
                          'S',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Constants().whiteColor),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: onTap,
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
                        Text(
                          'M',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Constants().whiteColor),
                        )
                      ],
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
                  onTap: onTap,
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
                        Text(
                          'L',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Constants().whiteColor),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: onTap,
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
                        Text(
                          'XL',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Constants().whiteColor),
                        )
                      ],
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
