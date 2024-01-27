import "package:auto_route/auto_route.dart";
import 'package:flutter/material.dart';
import 'package:flutterx_live_data/flutterx_live_data.dart';
import 'package:nadrus_parent_app/ui/core/layouts/base_scaffold.dart';
import 'package:nadrus_parent_app/ui/core/responsive/screen_type_layout.dart';
import "package:nadrus_parent_app/ui/widgets/instance/instance_state.dart";
import 'package:nadrus_parent_app/ui/widgets/loaders/live_data_loader.dart';

import "./viewmodels/children_viewmodel.dart";
import 'mobile/children_mobile_screen.dart';

@RoutePage(name: "children")
class ChildrenScreen extends StatefulWidget {
  const ChildrenScreen({Key? key}) : super(key: key);

  @override
  State<ChildrenScreen> createState() => _ChildrenScreenState();
}

class _ChildrenScreenState extends State<ChildrenScreen>
    with InstanceState<ChildrenScreen, ChildrenViewModel>, ObserverMixin {
  @override
  Widget screen(context, viewModel) {
    return Stack(
      children: [
        BaseScaffold(
          builder: (context, theme) => SafeArea(
            child: const ScreenTypeLayout(mobile: ChildrenMobileScreen()),
          ),
        ),
        LoadingListenerWidget(loading: viewModel.baseParams.loading),
      ],
    );
  }

  @override
  ChildrenViewModel registerInstance() => ChildrenViewModel();
}
