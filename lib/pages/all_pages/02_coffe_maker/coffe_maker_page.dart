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

class _CoffeMakerPageState extends State<CoffeMakerPage> {
  final Map<String, Widget> pages = {
    'Size': const SizePage(),
    'Milk Type': const MilkTypePage(),
    'Milk Balance': const MilkBalancePage(),
    'Foam': const FoamPage()
  };

  @override
  Widget build(BuildContext context) {
    int _indexPageSelected = 0;

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
              child: Text(
                pages.keys.elementAt(_indexPageSelected),
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Constants().yellowColor),
              ),
            ),
            Expanded(
              child: pages.values.elementAt(_indexPageSelected),
            ),
          ],
        ),
      ),
    );
  }
}
