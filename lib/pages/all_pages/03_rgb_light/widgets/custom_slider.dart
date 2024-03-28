import 'dart:math';

import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({
    required this.onSlide,
    required this.backgroundColor,
    this.height = 35,
    super.key,
  });

  final double height;
  final ValueChanged<double> onSlide;
  final Color backgroundColor;

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider>
    with SingleTickerProviderStateMixin {
  double _sliderRelativePosition = 0;
  double _startedDraggingAtX = 0;
  Duration animationDuration = const Duration(milliseconds: 300);

  late final AnimationController _animationController;
  late final Animation<double> _sliderAnimation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: animationDuration);

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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(_radius),
        border: _border,
      ),
      child: LayoutBuilder(
        builder: (_, BoxConstraints constraints) {
          final sliderRadius = widget.height / 2;
          final sliderMaxX = constraints.maxWidth - 2 * sliderRadius;
          final sliderPosX = sliderMaxX * _sliderRelativePosition;

          return Stack(
            children: [
              _buildBackground(
                width: constraints.maxWidth,
                backgroundSplitX: sliderPosX + sliderRadius,
              ),
              _buildSlider(sliderMaxX: sliderMaxX, sliderPositionX: sliderPosX),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBackground({
    required double width,
    required double backgroundSplitX,
  }) {
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
        ),
      ],
    );
  }

  Widget _buildSlider({
    required double sliderMaxX,
    required double sliderPositionX,
  }) {
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

          setState(
            () => _sliderRelativePosition =
                max(0, min(1, newSliderRelativePosition)),
          );
          widget.onSlide(_sliderRelativePosition);
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
