import 'package:flutter/material.dart';

import 'package:ui_demos/pages/all_pages/02_coffe_maker/constanst.dart';

class MilkTypePage extends StatelessWidget {
  const MilkTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(color: Constants().backColor.withOpacity(0.5));
  }
}
