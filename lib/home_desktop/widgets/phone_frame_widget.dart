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
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 10),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        boxShadow: const [
          BoxShadow(color: Colors.black45, spreadRadius: 5.0, blurRadius: 5.0)
        ],
      ),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(18)),
          child: child),
    );
  }
}
