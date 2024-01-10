import 'package:flutter/material.dart';

class PhoneFrameWidget extends StatelessWidget {
  final double height;
  final Widget child;
  const PhoneFrameWidget({Key? key, required this.height, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: height * 0.5,
      decoration: const BoxDecoration(
        border: BorderDirectional(
            top: BorderSide(width: 15),
            start: BorderSide(width: 5),
            end: BorderSide(width: 5),
            bottom: BorderSide(width: 10)),
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(55), bottom: Radius.circular(45)),
        boxShadow: [
          BoxShadow(color: Colors.black45, spreadRadius: 5.0, blurRadius: 5.0)
        ],
      ),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          child: child),
    );
  }
}
