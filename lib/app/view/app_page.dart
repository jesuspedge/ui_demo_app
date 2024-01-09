import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ui_demos/home_desktop/home_desktop.dart';
import 'package:ui_demos/home_mobile/home_mobile.dart';

class UIDemosApp extends StatelessWidget {
  const UIDemosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UI Demos App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: isDesktop() ? const HomeDesktopPage() : const HomeMobilePage(),
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

    default:
      return false;
  }
}
