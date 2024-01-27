import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatelessWidget {
  final double? size;
  final Color? color;
  const Loader({Key? key, this.color, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(
      color: color ?? Theme.of(context).primaryColor,
      size: size ?? MediaQuery.of(context).size.width * 0.15,
    );
  }
}
