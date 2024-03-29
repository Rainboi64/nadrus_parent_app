import 'package:flutter/material.dart';

import '../animations/customized_animated_widget.dart';
import '../buttons/text_button.dart';

class PaginationErrorWidget extends StatelessWidget {
  final Function()? retry;
  const PaginationErrorWidget({this.retry, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomizedAnimatedWidget(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: AppTextButton(
          text: "Error try again",
          callback: () {
            retry?.call();
          },
        ),
      ),
    );
  }
}
