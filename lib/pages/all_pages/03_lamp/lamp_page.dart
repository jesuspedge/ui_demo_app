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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.light, color: Colors.white),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: CustomSlider(
                  onSlide: (value) {},
                  height: 35,
                  backgroundColor: const Color(0xFF00BDD6),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
