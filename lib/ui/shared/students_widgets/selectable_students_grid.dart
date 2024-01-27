import 'package:flutter/material.dart';
import 'package:flutterx_live_data/flutterx_live_data.dart';

import '../../../models/data/student/student.dart';
import 'student_card_widget.dart';

class SelectableStudentsGrid extends StatelessWidget {
  final MutableLiveData<List<Student>> students;
  final MutableLiveData<List<Student>>? selectedStudents;

  const SelectableStudentsGrid({
    required this.students,
    this.selectedStudents,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LiveDataBuilder<List<Student>>(
          data: students,
          builder: (context, list) {
            return list.isNotEmpty
                ? SizedBox(
                    height: (list.length / 2) * 128,
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: List.generate(
                        list.length,
                        (index) {
                          return StudentCardWidget(
                            selected: list[index].selected,
                            student: list[index],
                            callback: () {
                              students.postValue(_toggleStudent(list, index));
                              setSelectedStudents();
                            },
                          );
                        },
                      ),
                    ),
                  )
                : const SizedBox();
          },
        ),
        const SizedBox(
            height: 16.0), // Adjust the space between the grid and the button
        ElevatedButton(
          onPressed: () {
            // Handle the "Next" button click event here
            // You can navigate to the next screen or perform any other action
          },
          child: Text('Next'),
        ),
      ],
    );
  }

  List<Student> _toggleStudent(List<Student> students, int index) {
    return students.map((student) {
      if (student == students[index]) {
        return student.copyWith(selected: !students[index].selected);
      }
      return student;
    }).toList();
  }

  void setSelectedStudents() {
    if (selectedStudents != null) {
      List<Student> temp = [];
      for (var element in students.value) {
        if (element.selected == true) {
          temp.add(element);
        }
      }
      selectedStudents!.postValue(temp);
    }
  }
}
