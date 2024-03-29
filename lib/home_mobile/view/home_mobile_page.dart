// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:ui_demos/app/app.dart';
import 'package:ui_demos/pages/pages.dart';

class HomeMobilePage extends StatefulWidget {
  const HomeMobilePage({super.key});

  @override
  State<HomeMobilePage> createState() => _HomeMobilePageState();
}

class _HomeMobilePageState extends State<HomeMobilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF348F50),
            Color(0xFF56B4D3),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.5),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          title: const Text(
            'UI Demos App',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          actions: [
            GestureDetector(
              onTap: () => html.window
                  .open('https://github.com/jesuspedge/ui_demo_app', 'Github'),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Icon(
                    Bootstrap.github,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    childAspectRatio: 3 / 4,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: pages.length,
                itemBuilder: (BuildContext context, int index) {
                  return BlocBuilder<AppBloc, AppState>(
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () async {
                          if (state.isDesktop) {
                            context.read<AppBloc>().add(ChangePageSelectedEvent(
                                pageSelected: pages[index].widgetPage));
                          } else {
                            await Navigator.push(
                                context, customRoute(pages[index].widgetPage));
                          }
                        },
                        child: Stack(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        pages[index].imageName,
                                      ),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Colors.transparent, Colors.black]),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: Container(
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black45,
                                          spreadRadius: 1,
                                          blurRadius: 20)
                                    ]),
                                child: const Icon(
                                  CupertinoIcons.chevron_right,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 15,
                              left: 10,
                              child: Text(
                                pages[index].name,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }),
          ),
        ),
      ),
    );
  }
}
