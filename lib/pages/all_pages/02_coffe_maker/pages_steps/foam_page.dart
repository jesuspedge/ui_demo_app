import 'package:flutter/material.dart';

import 'package:ui_demos/pages/all_pages/02_coffe_maker/constanst.dart';

class FoamPage extends StatefulWidget {
  const FoamPage({super.key});

  @override
  State<FoamPage> createState() => _FoamPageState();
}

class _FoamPageState extends State<FoamPage> {
  double sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    child: Slider(
                      value: sliderValue,
                      onChanged: (newValue) =>
                          setState(() => sliderValue = newValue),
                      min: 0.0,
                      max: 100.0,
                      thumbColor: Constants().whiteColor,
                      activeColor: Constants().whiteColor,
                      inactiveColor: Constants().yellowColor,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox.square(
                      dimension: 100,
                      child: CustomPaint(
                        foregroundPainter: FilledCupPainter(),
                      ),
                    ),
                    Text(
                      '${sliderValue.toStringAsFixed(0)}%',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(color: Constants().yellowColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            'NEXT',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Constants().whiteColor),
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

    final arc3 = Path();
    arc3.moveTo(size.width * 0.8, size.height * 0.6);
    arc3.arcToPoint(Offset(size.width * 0.9, size.height * 0.15),
        radius: const Radius.circular(15), clockwise: false);

    canvas.drawPath(arc3, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
