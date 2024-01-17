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
      imageName: 'images/01codecheck.png',
      widgetPage: const VerificationCodePage(),
      name: 'Verification Code')
];
