import 'package:flutter/material.dart';

import '../../../../config/ui_config.dart';
import '../../../../extensions/date_extension.dart';
import '../../../../models/data/teacher_note/teacher_note.dart';
import '../../../resources/colors/colors.dart';
import '../../../shared/ring_widget.dart';

Map<String, Color> color = {
  "POSITIVE": Colors.green,
  "NEGATIVE": DesignColors.errorColor,
};

class TeacherNoteCard extends StatelessWidget {
  final TeacherNote teacherNote;
  final String? title;
  const TeacherNoteCard({required this.teacherNote, this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 122,
      width: screenSize(context).width,
      margin: const EdgeInsets.fromLTRB(24, 8, 24, 8),
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 12),
      decoration: BoxDecoration(
        color: DesignColors.white,
        boxShadow: [
          BoxShadow(
            color: (color[teacherNote.type] ?? const Color(0xFF5C5050))
                .withOpacity(0.2),
            blurRadius: 4,
            spreadRadius: 5,
            offset: const Offset(0, 0),
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (teacherNote.createdAt != null)
                Text(
                  teacherNote.createdAt!.formatDate(),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Color(0XFFD6D5DC),
                  ),
                ),
              RingWidget(
                color: color[teacherNote.type],
                size: 25,
              ),
            ],
          ),
          const SizedBox(height: 24),
          if (teacherNote.content != null)
            Text(
              teacherNote.content!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            )
        ],
      ),
    );
  }
}
