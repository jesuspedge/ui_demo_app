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
        body: Center(
          child: FlipWidget(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text(
                '0',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 200,
                  height: 1,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FlipWidget extends StatelessWidget {
  final Widget child;
  const FlipWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRect(
          child: Align(
            alignment: Alignment.topCenter,
            heightFactor: 0.5,
            child: child,
          ),
        ),
        const SizedBox(height: 2),
        ClipRect(
          child: Align(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.5,
            child: child,
          ),
        ),
      ],
    );
  }
}
