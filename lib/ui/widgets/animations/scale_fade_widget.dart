import 'package:flutter/material.dart';

enum AnimationType { fade, scale, fadeScale }

class ScaleFadeWidget extends StatefulWidget {
  final Widget child;
  final Duration? duration;
  final AnimationType type;
  final double? fadeValue;
  final double? scaleValue;
  const ScaleFadeWidget({
    required this.child,
    this.duration,
    this.type = AnimationType.fadeScale,
    this.fadeValue,
    this.scaleValue,
    Key? key,
  }) : super(key: key);

  @override
  State<ScaleFadeWidget> createState() => ScaleFadeWidgetState();
}

class ScaleFadeWidgetState extends State<ScaleFadeWidget>
    with SingleTickerProviderStateMixin {
  double? _scale;
  AnimationController? _controller;
  Duration get _duration =>
      widget.duration ?? const Duration(milliseconds: 150);
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: _duration,
      lowerBound: 0.0,
      upperBound: widget.scaleValue ?? 0.025,
    )
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller!.reverse();
        }
      })
      ..addListener(() {
        if (mounted) setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void animate({Function()? callback}) {
    _controller?.forward().whenCompleteOrCancel(() => callback?.call());
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - (_controller?.value ?? 0);
    return StatefulBuilder(
      builder: (context, setState) {
        switch (widget.type) {
          case AnimationType.scale:
            return Transform.scale(
              scale: _scale,
              child: widget.child,
            );

          case AnimationType.fade:
            return AnimatedOpacity(
              opacity: _controller?.value == 0 ? 1 : widget.fadeValue ?? 0.1,
              duration: _duration,
              child: widget.child,
            );

          case AnimationType.fadeScale:
          default:
            return Transform.scale(
              scale: _scale,
              child: AnimatedOpacity(
                opacity: _controller?.value == 0 ? 1 : widget.fadeValue ?? 0.35,
                duration: _duration,
                child: widget.child,
              ),
            );
        }
      },
    );
  }
}
