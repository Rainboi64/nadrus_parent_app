import 'package:flutter/material.dart';
import 'package:nadrus_parent_app/ui/core/layouts/theme_widget.dart';
import "package:nadrus_parent_app/ui/widgets/instance/instance_builder.dart";

import "../viewmodels/children_viewmodel.dart";

class ChildrenMobileScreen extends StatelessWidget {
  const ChildrenMobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InstanceBuilder<ChildrenViewModel>(
      builder: (viewModel) {
        return ThemeWidget(
          builder: (context, theme) {
            return Container();
          },
        );
      },
    );
  }
}
