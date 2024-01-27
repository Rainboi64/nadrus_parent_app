import "package:auto_route/auto_route.dart";
import 'package:flutter/material.dart';
import 'package:flutterx_live_data/flutterx_live_data.dart';
import 'package:nadrus_parent_app/ui/core/layouts/base_scaffold.dart';
import 'package:nadrus_parent_app/ui/core/responsive/screen_type_layout.dart';
import "package:nadrus_parent_app/ui/widgets/instance/instance_state.dart";
import 'package:nadrus_parent_app/ui/widgets/loaders/live_data_loader.dart';

import "./viewmodels/main_viewmodel.dart";
import 'mobile/main_mobile_screen.dart';

@RoutePage(name: "main")
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with InstanceState<MainScreen, MainViewModel>, ObserverMixin {
  @override
  Widget screen(context, viewModel) {
    return Stack(
      children: [
        BaseScaffold(
          builder: (context, theme) => SafeArea(
            child: const ScreenTypeLayout(mobile: MainMobileScreen()),
          ),
        ),
        LoadingListenerWidget(loading: viewModel.baseParams.loading),
      ],
    );
  }

  @override
  MainViewModel registerInstance() => MainViewModel();
}
