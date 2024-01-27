import "package:auto_route/auto_route.dart";
import 'package:flutter/material.dart';
import 'package:flutterx_live_data/flutterx_live_data.dart';
import 'package:nadrus_parent_app/ui/core/layouts/base_scaffold.dart';
import 'package:nadrus_parent_app/ui/core/responsive/screen_type_layout.dart';
import "package:nadrus_parent_app/ui/widgets/instance/instance_state.dart";
import 'package:nadrus_parent_app/ui/widgets/loaders/live_data_loader.dart';

import "./viewmodels/initial_viewmodel.dart";
import '../../../controllers/auth_controller.dart';
import '../../../router/app_router.dart';
import 'mobile/initial_mobile_screen.dart';

@RoutePage(name: "initial")
class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen>
    with InstanceState<InitialScreen, InitialViewModel>, ObserverMixin {
  @override
  void onInitState(InitialViewModel instance) {
    _handleNavigation();
    super.onInitState(instance);
  }

  _handleNavigation() async {
    bool isLoggedIn = await AuthenticationController.loggedIn();
    appRouter.replaceAll([isLoggedIn ? const Main() : const DetectTenant()]);
  }

  @override
  Widget screen(context, viewModel) {
    return Stack(
      children: [
        BaseScaffold(
          builder: (context, theme) => const SafeArea(
            child: ScreenTypeLayout(mobile: InitialMobileScreen()),
          ),
        ),
        LoadingListenerWidget(loading: viewModel.baseParams.loading),
      ],
    );
  }

  @override
  InitialViewModel registerInstance() => InitialViewModel();
}
