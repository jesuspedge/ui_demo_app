import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ui_demos/app/app.dart';
import 'package:ui_demos/home_mobile/home_mobile.dart';
import 'package:ui_demos/pages/all_pages/03_rgb_light/widgets/widgets.dart';

class RgbLightPage extends StatefulWidget {
  const RgbLightPage({super.key});

  @override
  State<RgbLightPage> createState() => _RgbLightPageState();
}

class _RgbLightPageState extends State<RgbLightPage> {
  Color selectedColor = const Color(0xFFFBFF00);
  double opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return Container(
      color: const Color(0xFF0B0916),
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
            'RGB Light',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: CustomSlider(
                      onSlide: (value) => setState(() => opacity = value),
                      height: 35,
                      backgroundColor: selectedColor,
                    ),
                  ),
                  const SizedBox(height: 40)
                ],
              ),
              Positioned(
                top: 0,
                child: LightBulbWidget(
                  height: height * 0.6,
                  width: 200,
                  opacity: opacity,
                  selectedColor: selectedColor,
                ),
              ),
              Positioned(
                top: 10,
                left: 20,
                child: ColorSelector(
                  initialColor: selectedColor,
                  onColorSelected: (color) =>
                      setState(() => selectedColor = color),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
