import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_demos/app/app.dart';
import 'package:ui_demos/home_desktop/home_desktop.dart';
import 'package:ui_demos/home_mobile/home_mobile.dart';

class UIDemosApp extends StatefulWidget {
  const UIDemosApp({super.key});

  @override
  State<UIDemosApp> createState() => _UIDemosAppState();
}

class _UIDemosAppState extends State<UIDemosApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(isDesktop: isDesktop()),
      child: const UIDemosAppView(),
    );
  }
}

class UIDemosAppView extends StatelessWidget {
  const UIDemosAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return MaterialApp(
          scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.trackpad,
            PointerDeviceKind.stylus
          }),
          debugShowCheckedModeBanner: false,
          title: 'UI Demos App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          home: state.isDesktop
              ? const HomeDesktopPage()
              : const HomeMobilePage(),
        );
      },
    );
  }
}

bool isDesktop() {
  switch (defaultTargetPlatform) {
    case TargetPlatform.windows:
      return true;

    case TargetPlatform.macOS:
      return true;

    case TargetPlatform.linux:
      return true;

    case TargetPlatform.android:
      return false;

    case TargetPlatform.fuchsia:
      return false;

    case TargetPlatform.iOS:
      return false;
  }
}

Route<Widget> customRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
  );
}
