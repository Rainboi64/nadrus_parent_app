import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/ui_config.dart';
import '../../../extensions/assets_extension.dart';
import '../../../models/data/student/student.dart';
import '../../resources/colors/colors.dart';
import '../../widgets/animations/animated_gesture.dart';

class StudentCardWidget extends StatelessWidget {
  final Student student;
  final bool selected;
  final Function() callback;
  const StudentCardWidget(
      {required this.student,
      required this.callback,
      this.selected = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedGesture(
      callback: callback,
      child: Container(
        height: 101,
        width: screenSize(context).width / 2 - 30,
        decoration: BoxDecoration(
          border: Border.all(
              color: selected
                  ? DesignColors.primaryColor
                  : const Color(0XFFE0E0E0)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Text(
                "${student.firstName} ${student.lastName}",
                style: const TextStyle(fontSize: 17),
              ),
            ),
            SvgPicture.asset(
                selected ? "selected".svgAsset : "unselected".svgAsset),
          ],
        ),
      ),
    );
  }
}
