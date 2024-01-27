import 'package:flutter/material.dart';
import 'package:flutterx_live_data/flutterx_live_data.dart';

import '../blur_widget.dart';
import 'full_screen_loader.dart';

class LoadingListenerWidget extends StatelessWidget {
  final LiveData<bool> loading;
  final double blur;
  const LoadingListenerWidget(
      {required this.loading, this.blur = 1.8, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LiveDataBuilder<bool>(
      data: loading,
      builder: (context, boolean) {
        return boolean
            ? Stack(
                children: [
                  BlurWidget(
                      width: double.infinity,
                      height: double.infinity,
                      blur: blur),
                  const FullScreenLoader(),
                ],
              )
            : const SizedBox.shrink();
      },
    );
  }
}
