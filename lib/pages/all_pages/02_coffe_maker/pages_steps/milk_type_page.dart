import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:ui_demos/pages/all_pages/02_coffe_maker/constanst.dart';

class MilkTypePage extends StatefulWidget {
  const MilkTypePage({
    required this.onTap,
    super.key,
  });
  final void Function() onTap;

  @override
  State<MilkTypePage> createState() => _MilkTypePageState();
}

class _MilkTypePageState extends State<MilkTypePage>
    with TickerProviderStateMixin {
  late AnimationController animationController1;
  late AnimationController animationController2;
  late AnimationController animationController3;
  late AnimationController animationController4;

  late Animation<double> scaleAnimation1;
  late Animation<double> scaleAnimation2;
  late Animation<double> scaleAnimation3;
  late Animation<double> scaleAnimation4;

  Future<void> initAnimations() async {
    await animationController1.forward();
    await animationController2.forward();
    await animationController3.forward();
    await animationController4.forward();
  }

  @override
  void initState() {
    animationController1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    )..addListener(() => setState(() {}));

    animationController2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    )..addListener(() => setState(() {}));

    animationController3 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    )..addListener(() => setState(() {}));

    animationController4 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    )..addListener(() => setState(() {}));

    scaleAnimation1 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController1,
        curve: Curves.fastOutSlowIn,
      ),
    );

    scaleAnimation2 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController2,
        curve: Curves.fastOutSlowIn,
      ),
    );

    scaleAnimation3 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController3,
        curve: Curves.fastOutSlowIn,
      ),
    );

    scaleAnimation4 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController4,
        curve: Curves.fastOutSlowIn,
      ),
    );

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
          child: GestureDetector(
            onTap: widget.onTap,
            child: Transform.scale(
              alignment: Alignment.centerLeft,
              scale: scaleAnimation1.value,
              child: Opacity(
                opacity: scaleAnimation1.value,
                child: ColoredBox(
                  color: Constants().backColor.withOpacity(0.6),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(40),
                        child: Image.asset(
                          'assets/images/02coffemaker/cow.png',
                          fit: BoxFit.contain,
                          color: Constants().yellowColor,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(
                          lerpDouble(-200, 0, scaleAnimation1.value)!,
                          0,
                        ),
                        child: Text(
                          'Cow',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Constants().whiteColor),
                        ),
                      ),
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
              alignment: Alignment.centerLeft,
              scale: scaleAnimation2.value,
              child: Opacity(
                opacity: scaleAnimation2.value,
                child: ColoredBox(
                  color: Constants().backColor.withOpacity(0.7),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(40),
                        child: Image.asset(
                          'assets/images/02coffemaker/soy.png',
                          fit: BoxFit.contain,
                          color: Constants().yellowColor,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(
                          lerpDouble(-200, 0, scaleAnimation2.value)!,
                          0,
                        ),
                        child: Text(
                          'Soy',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Constants().whiteColor),
                        ),
                      ),
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
              alignment: Alignment.centerLeft,
              scale: scaleAnimation3.value,
              child: Opacity(
                opacity: scaleAnimation3.value,
                child: ColoredBox(
                  color: Constants().backColor.withOpacity(0.8),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(40),
                        child: Image.asset(
                          'assets/images/02coffemaker/rice.png',
                          fit: BoxFit.contain,
                          color: Constants().yellowColor,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(
                          lerpDouble(-200, 0, scaleAnimation3.value)!,
                          0,
                        ),
                        child: Text(
                          'Rice',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Constants().whiteColor),
                        ),
                      ),
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
              alignment: Alignment.centerLeft,
              scale: scaleAnimation4.value,
              child: Opacity(
                opacity: scaleAnimation4.value,
                child: ColoredBox(
                  color: Constants().backColor.withOpacity(0.9),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(40),
                        child: Image.asset(
                          'assets/images/02coffemaker/coconut.png',
                          fit: BoxFit.contain,
                          color: Constants().yellowColor,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(
                          lerpDouble(-200, 0, scaleAnimation4.value)!,
                          0,
                        ),
                        child: Text(
                          'Coconut',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Constants().whiteColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
