import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_demos/app/app.dart';
import 'package:ui_demos/home_desktop/home_desktop.dart';

class HomeDesktopPage extends StatefulWidget {
  const HomeDesktopPage({super.key});

  @override
  State<HomeDesktopPage> createState() => _HomeDesktopPageState();
}

class _HomeDesktopPageState extends State<HomeDesktopPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            '/images/background.jpg',
            height: height,
            width: width,
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10,
              sigmaY: 10,
            ),
            child: Container(
              height: height,
              width: width,
              color: Colors.black.withOpacity(0.2),
            ),
          ),
          Center(
            child: BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                return PhoneFrameWidget(
                    height: height * 0.9, child: state.pageSelected);
              },
            ),
          )
        ],
      ),
    );
  }
}
