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
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: height * 0.5,
            child: CircleAvatar(
              backgroundColor: selectedColor
                  .withOpacity(lerpDouble(0.05, 1.0, opacity)!.toDouble()),
            ),
          ),
          Positioned(
            child: Image.asset(
              'assets/images/03light/lightbulb.png',
              fit: BoxFit.contain,
              color: const Color(0xFF434255),
            ),
          ),
          Positioned(
            top: height * 0.5,
            child: Container(
              margin: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: selectedColor.withOpacity(opacity),
                      blurRadius: 150,
                      spreadRadius: 150),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
