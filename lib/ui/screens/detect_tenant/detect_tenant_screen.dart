import "package:auto_route/auto_route.dart";
import 'package:flutter/material.dart';
import 'package:flutterx_live_data/flutterx_live_data.dart';

import "./viewmodels/detect_tenant_viewmodel.dart";
import '../../core/layouts/base_scaffold.dart';
import '../../core/responsive/screen_type_layout.dart';
import '../../widgets/instance/instance_state.dart';
import '../../widgets/loaders/live_data_loader.dart';
import 'mobile/detect_tenant_mobile_screen.dart';

@RoutePage(name: "detectTenant")
class DetectTenantScreen extends StatefulWidget {
  const DetectTenantScreen({Key? key}) : super(key: key);

  @override
  State<DetectTenantScreen> createState() => _DetectTenantScreenState();
}

class _DetectTenantScreenState extends State<DetectTenantScreen>
    with
        InstanceState<DetectTenantScreen, DetectTenantViewModel>,
        ObserverMixin {
  @override
  Widget screen(context, viewModel) {
    return Stack(
      children: [
        BaseScaffold(
          builder: (context, theme) => const SafeArea(
            child: ScreenTypeLayout(
              mobile: DetectTenantMobileScreen(),
            ),
          ),
        ),
        LoadingListenerWidget(loading: viewModel.baseParams.loading),
      ],
    );
  }

  @override
  DetectTenantViewModel registerInstance() => DetectTenantViewModel();
}
