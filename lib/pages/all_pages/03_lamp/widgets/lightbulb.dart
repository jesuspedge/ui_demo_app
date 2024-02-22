import 'dart:ui';

import 'package:flutter/material.dart';

class LightBulbWidget extends StatelessWidget {
  final double height;
  final double width;
  final double opacity;
  final Color selectedColor;

  const LightBulbWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.opacity,
      required this.selectedColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.withOpacity(0.1),
      height: height,
      width: width,
      child: Stack(
        children: [
          Positioned(
            child: Image.asset('assets/images/03light/lightbulb.png'),
          ),
          Positioned(
            child: Container(
              margin: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: selectedColor.withOpacity(
                    lerpDouble(0.01, 1.0, opacity * 0.1)!.toDouble()),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: selectedColor.withOpacity(opacity),
                      blurRadius: 100,
                      spreadRadius: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
