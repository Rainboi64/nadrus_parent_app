import "package:auto_route/auto_route.dart";
import 'package:flutter/material.dart';
import 'package:flutterx_live_data/flutterx_live_data.dart';
import 'package:nadrus_parent_app/ui/core/layouts/base_scaffold.dart';
import 'package:nadrus_parent_app/ui/core/responsive/screen_type_layout.dart';
import "package:nadrus_parent_app/ui/widgets/instance/instance_state.dart";
import 'package:nadrus_parent_app/ui/widgets/loaders/live_data_loader.dart';

import "./viewmodels/teachers_feedback_viewmodel.dart";
import 'mobile/teachers_feedback_mobile_screen.dart';

@RoutePage(name: "teachersFeedback")
class TeachersFeedbackScreen extends StatefulWidget {
  const TeachersFeedbackScreen({Key? key}) : super(key: key);

  @override
  State<TeachersFeedbackScreen> createState() => _TeachersFeedbackScreenState();
}

class _TeachersFeedbackScreenState extends State<TeachersFeedbackScreen>
    with
        InstanceState<TeachersFeedbackScreen, TeachersFeedbackViewModel>,
        ObserverMixin {
  @override
  Widget screen(context, viewModel) {
    return Stack(
      children: [
        BaseScaffold(
          builder: (context, theme) => SafeArea(
            child:
                const ScreenTypeLayout(mobile: TeachersFeedbackMobileScreen()),
          ),
        ),
        LoadingListenerWidget(loading: viewModel.baseParams.loading),
      ],
    );
  }

  @override
  TeachersFeedbackViewModel registerInstance() => TeachersFeedbackViewModel();
}
