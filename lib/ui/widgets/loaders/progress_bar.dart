import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loader.dart';

class AppProgressBar extends StatelessWidget {
  final double strokeWidth;
  final Color? color;
  const AppProgressBar({this.color, this.strokeWidth = 4, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Platform.isIOS
          ? CupertinoActivityIndicator(
              color: color ?? Theme.of(context).colorScheme.primary,
            )
          : CircularProgressIndicator(
              strokeWidth: strokeWidth,
              valueColor: AlwaysStoppedAnimation<Color>(
                color ?? Theme.of(context).colorScheme.primary,
              ),
            ),
    );
  }
}

Widget textFieldLoader() => const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Loader(size: 25),
    );

BoxConstraints textFieldLoaderConstraints() =>
    const BoxConstraints(maxWidth: 40, maxHeight: 25);
