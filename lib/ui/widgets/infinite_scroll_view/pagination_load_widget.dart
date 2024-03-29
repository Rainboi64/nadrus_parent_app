import 'package:flutter/material.dart';

import '../animations/customized_animated_widget.dart';
import '../loaders/progress_bar.dart';

class PaginationLoaderWidget extends StatelessWidget {
  const PaginationLoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomizedAnimatedWidget(
      child: SizedBox(
          width: 30, height: 30, child: AppProgressBar(strokeWidth: 2.5)),
    );
  }
}
