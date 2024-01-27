import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// set application on-launch UI configuration
void uiConfig(BuildContext context) {
  _setupOrientation(context);
}

/// set screen orientation depending on screen size,
///
/// if device is tablet -> set orientation [DeviceOrientation.landscapeRight] and [DeviceOrientation.landscapeLeft],
/// if device is mobile -> set orientation [DeviceOrientation.portraitUp] and [DeviceOrientation.portraitDown].
void _setupOrientation(BuildContext context) {
  const tabletOrientation = [
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft
  ];
  const mobileOrientation = [
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ];
  SystemChrome.setPreferredOrientations(
      isTablet(context) ? tabletOrientation : mobileOrientation);
}

/// detect if device is tablet depending on device screen size.
bool isTablet(BuildContext context) {
  final data = MediaQueryData.fromView(View.of(context));
  return data.size.shortestSide > 600;
}

/// get screen [Size]
Size screenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

/// hide screen status bar
void hideStatusBar() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);
}

/// show screen status bar
void showStatusBar() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: SystemUiOverlay.values);
}

/// hide current foucsed view
void hideSoftKeyboard(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
}
