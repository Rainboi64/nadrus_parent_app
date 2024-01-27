import 'package:flutter/material.dart';
import 'package:nadrus_parent_app/ui/core/layouts/theme_widget.dart';
import "package:nadrus_parent_app/ui/widgets/instance/instance_builder.dart";

import "../viewmodels/initial_viewmodel.dart";

class InitialMobileScreen extends StatelessWidget {
  const InitialMobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InstanceBuilder<InitialViewModel>(
      builder: (viewModel) {
        return ThemeWidget(
          builder: (context, theme) {
            ///TODO ADD SPLASH SCREEN
            return Container();
          },
        );
      },
    );
  }
}
