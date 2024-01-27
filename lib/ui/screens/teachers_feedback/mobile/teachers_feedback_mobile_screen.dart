import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutterx_live_data/flutterx_live_data.dart';
import 'package:nadrus_parent_app/ui/core/layouts/theme_widget.dart';
import "package:nadrus_parent_app/ui/widgets/instance/instance_builder.dart";

import '../../../../models/data/teacher_note/teacher_note.dart';
import '../../../shared/customized_app_bar.dart';
import '../../../widgets/animations/animated_column.dart';
import "../viewmodels/teachers_feedback_viewmodel.dart";
import '../widgets/teacher_note_card.dart';

class TeachersFeedbackMobileScreen extends StatelessWidget {
  const TeachersFeedbackMobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InstanceBuilder<TeachersFeedbackViewModel>(
      builder: (viewModel) {
        return ThemeWidget(
          builder: (context, theme) {
            return AnimatedColumn(
              children: [
                CustomizedAppBar(
                  title: "teachers_notes".tr(),
                ),
                LiveDataBuilder<List<TeacherNote>>(
                  data: viewModel.params.teacherNotes,
                  builder: (context, teachersNotes) {
                    if (teachersNotes.isNotEmpty) {
                      return SizedBox(
                        height: (84.0) * teachersNotes.length + 28,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: teachersNotes.length,
                          itemBuilder: (context, index) => TeacherNoteCard(
                            teacherNote: teachersNotes[index],
                          ),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
