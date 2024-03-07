import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ui_demos/app/app.dart';
import 'package:ui_demos/home_mobile/home_mobile.dart';

class FlipClockPage extends StatelessWidget {
  const FlipClockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFC2DCFF),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  if (state.isDesktop) {
                    context.read<AppBloc>().add(const ChangePageSelectedEvent(
                        pageSelected: HomeMobilePage()));
                  } else {
                    Navigator.of(context).pop();
                  }
                },
                child: const Icon(Icons.arrow_back_ios_new_rounded,
                    color: Colors.white),
              );
            },
          ),
          title: const Text(
            'Flip clock',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: const Center(
          child: FlipNumberWidget(),
        ),
      ),
    );
  }
}

class FlipNumberWidget extends StatefulWidget {
  const FlipNumberWidget({
    super.key,
  });

  @override
  State<FlipNumberWidget> createState() => _FlipNumberWidgetState();
}

class _FlipNumberWidgetState extends State<FlipNumberWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    _animation = Tween<double>(begin: -(math.pi * 2), end: -math.pi)
        .animate(_animationController);

    _animation.addListener(() => setState(() {}));

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ///First element
        Stack(
          children: [
            Container(
              height: 220,
              width: 200,
              decoration: const BoxDecoration(color: Colors.red),
              child: const Text('0'),
            ),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform(
                  alignment: Alignment.bottomCenter,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateX(_animation.value),
                  child: child,
                );
              },
              child: Container(
                height: 220,
                width: 200,
                decoration: const BoxDecoration(color: Colors.green),
                child: const Text('1'),
              ),
            ),
          ],
        ),

        ///Division
        const SizedBox(height: 2),

        ///Second element
        Container(
          height: 220,
          width: 200,
          decoration: const BoxDecoration(color: Colors.yellow),
          child: const Text('0'),
        ),
      ],
    );
  }
}
