import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:ui_demos/pages/all_pages/02_coffe_maker/constanst.dart';

class MilkBalancePage extends StatefulWidget {
  final void Function() onTap;
  const MilkBalancePage({super.key, required this.onTap});

  @override
  State<MilkBalancePage> createState() => _MilkBalancePageState();
}

class _MilkBalancePageState extends State<MilkBalancePage>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  double sliderValue = 0;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400))
      ..addListener(() => setState(() {}));

    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

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
    return Container(
      color: Constants().backColor.withOpacity(0.6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Transform.translate(
            offset: Offset(0, lerpDouble(200, 0, animation.value)!.toDouble()),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: SliderTheme(
              data: const SliderThemeData(trackHeight: 10),
              child: Transform.scale(
                alignment: Alignment.centerLeft,
                scaleX: animation.value,
                child: Slider(
                  value: sliderValue,
                  onChanged: (newValue) =>
                      setState(() => sliderValue = newValue),
                  min: 0.0,
                  max: 100.0,
                  thumbColor: Constants().whiteColor,
                  activeColor: Constants().whiteColor,
                  inactiveColor: Constants().blueColor,
                ),
              ),
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
