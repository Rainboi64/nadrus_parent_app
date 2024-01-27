import 'package:flutter/material.dart';

import 'scale_fade_widget.dart';

class AnimatedGesture extends StatefulWidget {
  final Widget child;
  final Function() callback;
  final double? fadeValue;
  final double? scaleValue;
  final AnimationType? animationType;
  const AnimatedGesture({
    required this.child,
    required this.callback,
    this.fadeValue,
    this.scaleValue,
    this.animationType,
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedGesture> createState() => _AnimatedGestureState();
}

class _AnimatedGestureState extends State<AnimatedGesture> {
  final GlobalKey<ScaleFadeWidgetState> globalKey =
      GlobalKey<ScaleFadeWidgetState>();
  @override
  Widget build(BuildContext context) {
    return ScaleFadeWidget(
      key: globalKey,
      fadeValue: widget.fadeValue,
      scaleValue: widget.scaleValue,
      type: widget.animationType ?? AnimationType.fadeScale,
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: () {
          globalKey.currentState?.animate(callback: widget.callback);
        },
        child: widget.child,
      ),
    );
  }
}