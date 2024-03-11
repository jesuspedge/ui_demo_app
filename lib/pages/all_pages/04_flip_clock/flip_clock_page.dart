import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ui_demos/app/app.dart';
import 'package:ui_demos/home_mobile/home_mobile.dart';

import 'widgets/flip_number_widget.dart';

class FlipClockPage extends StatefulWidget {
  const FlipClockPage({super.key});

  @override
  State<FlipClockPage> createState() => _FlipClockPageState();
}

class _FlipClockPageState extends State<FlipClockPage> {
  final _timerController = StreamController<DateTime>();
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    //Adding new value each second
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _timerController.sink.add(DateTime.now());
    });
  }

  @override
  void dispose() {
    _timerController.close();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFC2DCFF),
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
            'Flip clock',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: StreamBuilder<DateTime>(
              stream: _timerController.stream,
              builder: (context, snapshot) {
                DateTime currentTime = snapshot.data ?? DateTime.now();

                return FlipNumberWidget(
                  number: currentTime.second,
                );
              }),
        ),
      ),
    );
  }
}
