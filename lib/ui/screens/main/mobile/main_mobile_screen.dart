import 'package:flutter/material.dart';
import 'package:flutterx_live_data/flutterx_live_data.dart';
import 'package:nadrus_parent_app/ui/core/layouts/base_scaffold.dart';
import 'package:nadrus_parent_app/ui/core/layouts/theme_widget.dart';
import "package:nadrus_parent_app/ui/widgets/instance/instance_builder.dart";

import '../../../shared/students_widgets/selectable_students_grid.dart';
import "../viewmodels/main_viewmodel.dart";

class MainMobileScreen extends StatelessWidget {
  const MainMobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InstanceBuilder<MainViewModel>(
      builder: (viewModel) {
        return ThemeWidget(
          builder: (context, theme) {
            return BaseScaffold(
              builder: (context, theme) => LiveDataBuilder<bool?>(
                  data: viewModel.params.hasMoreThanOneChild,
                  builder: (context, hasMoreThanOneChild) {
                    return hasMoreThanOneChild != null
                        ? hasMoreThanOneChild
                            ? SelectableStudentsGrid(
                                students: viewModel.params.students)
                            : const Center(
                                child: Text("one child"),
                              )
                        : const Center(
                            child: Text("empty no children"),
                          );
                  }),
            );
          },
        );
      },
    );
  }
}
