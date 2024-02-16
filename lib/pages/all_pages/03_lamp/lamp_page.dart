import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ui_demos/app/app.dart';
import 'package:ui_demos/home_mobile/home_mobile.dart';
import 'package:ui_demos/pages/all_pages/03_lamp/widgets/widgets.dart';

class LampPage extends StatefulWidget {
  const LampPage({super.key});

  @override
  State<LampPage> createState() => _LampPageState();
}

class _LampPageState extends State<LampPage> {
  Color selectedColor = const Color(0xFFFBFF00);
  double opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
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
            'Lamp Page',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: CustomSlider(
                      onSlide: (value) async {
                        //Fix this
                        Future.delayed(Duration.zero, () async {
                          setState(() {
                            opacity = value;
                          });
                        });
                      },
                      height: 35,
                      backgroundColor: selectedColor,
                    ),
                  ),
                  const SizedBox(height: 40)
                ],
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
        ),
      ),
    );
  }
}
