import 'package:flutter/material.dart';
import 'package:nadrus_parent_app/extensions/theme_extension.dart';
import 'package:nadrus_parent_app/ui/core/layouts/theme_widget.dart';
import 'package:nadrus_parent_app/ui/resources/themes/themes.dart';

import '../animations/scale_fade_widget.dart';

class CustomizedButton extends StatefulWidget {
  final Widget child;
  final bool enabled;
  final Function() callback;
  final ButtonStyle? style;
  const CustomizedButton({
    required this.child,
    required this.callback,
    this.enabled = true,
    this.style,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomizedButton> createState() => _CustomizedButtonState();
}

class _CustomizedButtonState extends State<CustomizedButton> {
  final GlobalKey<ScaleFadeWidgetState> globalKey =
      GlobalKey<ScaleFadeWidgetState>();
  final GlobalKey<ScaleFadeWidgetState> childKey =
      GlobalKey<ScaleFadeWidgetState>();
  @override
  Widget build(BuildContext context) {
    return ThemeWidget(
      builder: (context, theme) {
        return ScaleFadeWidget(
          key: globalKey,
          type: AnimationType.scale,
          scaleValue: 0.015,
          duration: const Duration(milliseconds: 200),
          child: FilledButton(
            onPressed: () async {
              if (!widget.enabled) return;
              globalKey.currentState?.animate();
              childKey.currentState?.animate();
              Future.delayed(
                  const Duration(milliseconds: 300), widget.callback);
            },
            style: (widget.style ??
                    elevatedButtonTheme(darkMode: theme.isDark()).style)
                ?.copyWith(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              backgroundColor: MaterialStateProperty.all(
                  widget.enabled ? theme.primaryColor : Colors.grey.shade400),
            ),
            child: ScaleFadeWidget(
              duration: const Duration(milliseconds: 200),
              type: AnimationType.fade,
              fadeValue: 0.5,
              key: childKey,
              child: widget.child,
            ),
          ),
        );
      },
    );
  }
}
