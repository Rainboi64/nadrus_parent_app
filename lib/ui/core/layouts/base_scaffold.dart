import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nadrus_parent_app/extensions/nullable_extension.dart';
import 'package:nadrus_parent_app/extensions/theme_extension.dart';

import 'theme_widget.dart';

class BaseScaffold extends StatefulWidget {
  final Brightness? statusBarIconBrightness;
  final Widget? drawer;
  final PreferredSizeWidget? Function(BuildContext context, ThemeData theme)?
      appBar;
  final FloatingActionButton? floatingActionButton;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;
  final bool? resizeToAvoidBottomInset;
  final Widget Function(BuildContext context, ThemeData theme) builder;

  const BaseScaffold({
    required this.builder,
    this.appBar,
    this.drawer,
    this.floatingActionButton,
    this.statusBarIconBrightness,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset,
    Key? key,
  }) : super(key: key);

  @override
  State<BaseScaffold> createState() => BaseScaffoldState();
}

class BaseScaffoldState extends State<BaseScaffold> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ThemeWidget(
      builder: (context, theme) {
        final brightness = theme.isDark() ? Brightness.light : Brightness.dark;
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness:
                  widget.statusBarIconBrightness ?? brightness),
          child: Scaffold(
            key: scaffoldKey,
            extendBody: true,
            extendBodyBehindAppBar: true,
            backgroundColor:
                widget.backgroundColor ?? theme.scaffoldBackgroundColor,
            drawer: widget.drawer,
            body: widget.builder(context, theme),
            appBar: widget.appBar?.let((it) => it(context, theme)),
            floatingActionButton: widget.floatingActionButton,
            bottomNavigationBar: widget.bottomNavigationBar,
            resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
          ),
        );
      },
    );
  }
}
