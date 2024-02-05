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
  int indexPageSelected = 0;

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
  Widget build(BuildContext context) {
    final Map<String, Widget> pages = {
      'Size': SizePage(onTap: () => setState(() => indexPageSelected = 1)),
      'Milk Type':
          MilkTypePage(onTap: () => setState(() => indexPageSelected = 2)),
      'Milk Balance':
          MilkBalancePage(onTap: () => setState(() => indexPageSelected = 3)),
      'Foam': FoamPage(onTap: () => setState(() => indexPageSelected = 0))
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
              child: Text(
                pages.keys.elementAt(indexPageSelected),
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Constants().yellowColor),
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
