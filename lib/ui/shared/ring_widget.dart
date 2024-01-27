import 'package:flutter/material.dart';

import '../resources/colors/colors.dart';

class RingWidget extends StatelessWidget {
  final double size;
  final Widget? content;
  final Color? color;
  final EdgeInsets? padding;
  const RingWidget(
      {Key? key, this.size = 26, this.content, this.color, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      padding: padding ??
          (content == null ? EdgeInsets.zero : const EdgeInsets.all(12)),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: DesignColors.white,
          border:
              Border.all(color: color ?? DesignColors.primaryColor, width: 2)),
      child: content ?? Container(),
    );
  }
}
