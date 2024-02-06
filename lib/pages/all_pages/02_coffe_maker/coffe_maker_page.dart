import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ui_demos/app/app.dart';
import 'package:ui_demos/home_mobile/home_mobile.dart';
import 'package:ui_demos/pages/all_pages/02_coffe_maker/constanst.dart';
import 'package:ui_demos/pages/all_pages/02_coffe_maker/pages_steps/pages_steps.dart';

//https://dribbble.com/shots/1920183-Coffee-Maker-App
class CoffeMakerPage extends StatefulWidget {
  const CoffeMakerPage({super.key});

  @override
  State<CoffeMakerPage> createState() => _CoffeMakerPageState();
}

class _CoffeMakerPageState extends State<CoffeMakerPage>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  int indexPageSelected = 0;

  Future<void> handleAnimation(int pageIndex) async {
    animationController.reverse();
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() => indexPageSelected = pageIndex);
    animationController.forward();
  }

  @override
  void didChangeDependencies() {
    precacheImage(
        const AssetImage('assets/images/02coffemaker/cow.png'), context);
    precacheImage(
        const AssetImage('assets/images/02coffemaker/soy.png'), context);
    precacheImage(
        const AssetImage('assets/images/02coffemaker/rice.png'), context);
    precacheImage(
        const AssetImage('assets/images/02coffemaker/coconut.png'), context);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..addListener(() => setState(() {}));

    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    super.initState();

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, Widget> pages = {
      'Size': SizePage(onTap: () => handleAnimation(1)),
      'Milk Type': MilkTypePage(onTap: () => handleAnimation(2)),
      'Milk Balance': MilkBalancePage(onTap: () => handleAnimation(3)),
      'Foam': FoamPage(onTap: () => handleAnimation(0))
    };

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFFE65266),
              Color(0xFF81234A),
            ]),
      ),
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
            'Coffe Maker',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 20, bottom: 20, left: 30),
              child: Transform.translate(
                offset:
                    Offset(lerpDouble(-100, 0, animation.value)!.toDouble(), 0),
                child: Opacity(
                  opacity: animation.value,
                  child: Text(
                    pages.keys.elementAt(indexPageSelected),
                    textAlign: TextAlign.left,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: Constants().yellowColor),
                  ),
                ),
              ),
            ),
            Expanded(
              child: pages.values.elementAt(indexPageSelected),
            ),
          ],
        ),
      ),
    );
  }
}
