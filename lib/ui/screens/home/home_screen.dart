import "package:auto_route/auto_route.dart";
import 'package:flutter/material.dart';
import 'package:flutterx_live_data/flutterx_live_data.dart';
import 'package:nadrus_parent_app/ui/core/layouts/base_scaffold.dart';
import 'package:nadrus_parent_app/ui/core/responsive/screen_type_layout.dart';
import "package:nadrus_parent_app/ui/widgets/instance/instance_state.dart";
import 'package:nadrus_parent_app/ui/widgets/loaders/live_data_loader.dart';

import "./viewmodels/home_viewmodel.dart";
import 'mobile/home_mobile_screen.dart';

@RoutePage(name: "home")
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with InstanceState<HomeScreen, HomeViewModel>, ObserverMixin {
  @override
  Widget screen(context, viewModel) {
    return Stack(
      children: [
        BaseScaffold(
          builder: (context, theme) => SafeArea(
            child: const ScreenTypeLayout(mobile: HomeMobileScreen()),
          ),
        ),
        LoadingListenerWidget(loading: viewModel.baseParams.loading),
      ],
    );
  }

  @override
  HomeViewModel registerInstance() => HomeViewModel();
}
