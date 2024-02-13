import 'package:flutter/material.dart';
import 'package:ui_demos/pages/all_pages/all_pages.dart';

class UIPage {
  final String imageName;
  final Widget widgetPage;
  final String name;

  UIPage(
      {required this.imageName, required this.widgetPage, required this.name});
}

List<UIPage> pages = [
  UIPage(
      imageName: 'assets/images/01codecheck.png',
      widgetPage: const VerificationCodePage(),
      name: 'Verification Code'),
  UIPage(
      imageName: 'assets/images/02coffemaker.png',
      widgetPage: const CoffeMakerPage(),
      name: 'Coffe Maker'),
  UIPage(
      imageName: 'assets/images/02coffemaker.png',
      widgetPage: const LampPage(),
      name: 'RGB Lamp'),
];
