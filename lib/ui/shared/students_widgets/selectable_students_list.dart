import 'package:flutter/material.dart';
import 'package:flutterx_live_data/flutterx_live_data.dart';
import '../../../models/data/student/student.dart';
import '../../widgets/animations/animated_gesture.dart';
import '../selectable_item.dart';

class SelectableStudentsList extends StatelessWidget {
  final MutableLiveData<List<Student>> students;
  const SelectableStudentsList({required this.students, super.key});

  @override
  Widget build(BuildContext context) {
    return LiveDataBuilder<List<Student>>(
      data: students,
      builder: (context, list) {
        return list.isNotEmpty
            ? SizedBox(
                height: 300,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (context, index) => AnimatedGesture(
                    child: selectableItem(
                      "${list[index].firstName} ${list[index].lastName}",
                      isCircle: false,
                      selected: !list[index].selected,
                    ),
                    callback: () {
                      students.postValue(_toggleStudent(list, index));
                    },
                  ),
                ),
              )
            : const SizedBox();
      },
    );
  }

  _toggleStudent(List<Student> students, int index) {
    return students.map((student) {
      if (student == students[index]) {
        return student.copyWith(selected: !students[index].selected);
      }
      return student;
    }).toList();
  }
}
