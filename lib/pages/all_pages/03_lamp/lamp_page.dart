import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_demos/app/app.dart';
import 'package:ui_demos/home_mobile/home_mobile.dart';

class LampPage extends StatefulWidget {
  const LampPage({super.key});

  @override
  State<LampPage> createState() => _LampPageState();
}

class _LampPageState extends State<LampPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
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
            'Lamp Page',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.light, color: Colors.white),
              CustomSlider(
                onSlide: () {},
                backgroundColor: const Color(0xFF00BDD6),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SliderButtonController extends ChangeNotifier {
  void reset() {
    notifyListeners();
  }
}

class CustomSlider extends StatefulWidget {
  final double height = 35;
  final Duration animationDuration = const Duration(milliseconds: 300);
  final Function() onSlide;
  final Color backgroundColor;
  final SliderButtonController? controller;
  const CustomSlider(
      {required this.onSlide,
      required this.backgroundColor,
      this.controller,
      super.key});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider>
    with SingleTickerProviderStateMixin {
  double _sliderRelativePosition = 0.0;
  double _startedDraggingAtX = 0.0;
  late final AnimationController _animationController;
  late final Animation _sliderAnimation;

  @override
  void initState() {
    super.initState();

    if (widget.controller != null) {
      widget.controller!.addListener(reset);
    }

    _animationController =
        AnimationController(vsync: this, duration: widget.animationDuration);

    _sliderAnimation =
        CurveTween(curve: Curves.easeInQuad).animate(_animationController);

    _animationController.addListener(() {
      setState(() => _sliderRelativePosition = _sliderAnimation.value);
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void reset() {
    _animationController.reverse(from: _sliderRelativePosition);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(_radius),
        border: _border,
      ),
      child: LayoutBuilder(builder: (_, BoxConstraints constraints) {
        final sliderRadius = widget.height / 2;
        final sliderMaxX = constraints.maxWidth - 2 * sliderRadius;
        final sliderPosX = sliderMaxX * _sliderRelativePosition;

        return Stack(
          children: [
            _buildBackground(
                width: constraints.maxWidth,
                backgroundSplitX: sliderPosX + sliderRadius),
            _buildText(),
            _buildSlider(sliderMaxX: sliderMaxX, sliderPositionX: sliderPosX),
          ],
        );
      }),
    );
  }

  Widget _buildBackground(
      {required double width, required double backgroundSplitX}) {
    return Row(
      children: [
        Container(
          height: widget.height,
          width: backgroundSplitX,
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.only(topLeft: _radius, bottomLeft: _radius),
            color: widget.backgroundColor.withOpacity(0.8),
          ),
        ),
        Container(
          height: widget.height,
          width: width - backgroundSplitX,
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.only(topRight: _radius, bottomRight: _radius),
            color: Colors.white.withOpacity(0.2),
          ),
        )
      ],
    );
  }

  Widget _buildText() {
    return SizedBox(
      height: widget.height,
      child: Center(
        child: Text('Percent', style: Theme.of(context).textTheme.titleLarge),
      ),
    );
  }

  Widget _buildSlider(
      {required double sliderMaxX, required double sliderPositionX}) {
    return Positioned(
      left: sliderPositionX,
      child: GestureDetector(
        onHorizontalDragStart: (start) {
          _startedDraggingAtX = sliderPositionX;
          _animationController.stop();
        },
        onHorizontalDragUpdate: (update) {
          final newSliderPositionX =
              _startedDraggingAtX + update.localPosition.dx;
          final newSliderRelativePosition = newSliderPositionX / sliderMaxX;

          setState(() => _sliderRelativePosition =
              max(0, min(1, newSliderRelativePosition)));
        },
        onHorizontalDragEnd: (end) {
          if (_sliderRelativePosition == 1.0) {
            widget.onSlide();
          } else {
            reset();
          }
        },
        child: Container(
          height: widget.height,
          width: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(_radius),
            color: widget.backgroundColor,
            border: _border,
          ),
        ),
      ),
    );
  }

  Radius get _radius => Radius.circular(widget.height);

  Border get _border => Border.all(color: Colors.white.withOpacity(0.7));
}
