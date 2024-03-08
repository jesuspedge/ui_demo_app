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
  late DateTime _currentTime;
  late DateTime _newTime;
  late Stream _timer;

  @override
  void initState() {
    super.initState();

    _currentTime = DateTime.now();
    _newTime = DateTime.now();

    _timer = Stream.periodic(
      const Duration(seconds: 1),
      (_) => _newTime = DateTime.now(),
    );

    _timer.listen((event) {
      DateTime newTime = event;
      if (newTime.minute != _currentTime.minute) {
        setState(() => _currentTime = event);
      }
    });
  }

  // _listenTimeStream() {
  //   _timer.listen((event) {
  //     print(event);
  //     _currentTime = DateTime.parse(event.toString());
  //   });
  // }

  @override
  void dispose() {
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
          child: FlipNumberWidget(
            number: _currentTime.minute,
            timerDuration: const Duration(minutes: 1),
          ),
        ),
      ),
    );
  }
}
