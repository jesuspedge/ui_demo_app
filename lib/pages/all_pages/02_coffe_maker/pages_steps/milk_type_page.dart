import 'package:flutter/material.dart';

import 'package:ui_demos/pages/all_pages/02_coffe_maker/constanst.dart';

class MilkTypePage extends StatelessWidget {
  final void Function() onTap;
  const MilkTypePage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onTap,
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
                  Text(
                    'Cow',
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
                  Text(
                    'Soy',
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
                  Text(
                    'Rice',
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
                  Text(
                    'Coconut',
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
    );
  }
}
