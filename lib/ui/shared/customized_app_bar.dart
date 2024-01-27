import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../controllers/auth_controller.dart';
import '../../extensions/assets_extension.dart';
import '../../router/app_router.dart';
import '../resources/colors/colors.dart';
import '../widgets/animations/animated_gesture.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedGesture(
      callback: () => appRouter.pop(),
      child: Container(
        padding: const EdgeInsets.all(6),
        child: const Icon(
          Icons.arrow_back,
          color: DesignColors.textColor,
        ),
      ),
    );
    // return AnimatedGesture(
    //   callback: () => appRouter.pop(),
    //   child: Container(
    //     padding: const EdgeInsets.all(6),
    //     decoration: BoxDecoration(
    //       shape: BoxShape.circle,
    //       color: DesignColors.primaryColor.withOpacity(0.35),
    //     ),
    //     child: const Icon(
    //       Icons.arrow_back,
    //       color: DesignColors.textColor,
    //     ),
    //   ),
    // );
  }
}

class CustomizedAppBar extends StatefulWidget {
  final String title;
  const CustomizedAppBar({required this.title, Key? key}) : super(key: key);

  @override
  State<CustomizedAppBar> createState() => _CustomizedAppBarState();
}

class _CustomizedAppBarState extends State<CustomizedAppBar> {
  String? name;

  getName() async {
    await AuthenticationController.getUser().then((value) {
      if (value != null && value.user != null) {
        setState(() {
          name = value.user!.username ?? "";
        });
      }
    });
  }

  @override
  void initState() {
    getName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 23, 24, 18),
      decoration: BoxDecoration(
        color: DesignColors.white,
        boxShadow: [
          BoxShadow(
            color: DesignColors.grey.withOpacity(0.075),
            blurRadius: 4,
            spreadRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const AppBackButton(),
              const SizedBox(width: 8),
              Text(
                widget.title,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
          Row(
            children: [
              name != null
                  ? CircleAvatar(
                      radius: 18,
                      backgroundColor: DesignColors.secondaryColor,
                      child: Text(
                        name![0],
                        style:
                            const TextStyle(color: DesignColors.primaryColor),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          )
        ],
      ),
    );
  }
}

class WelcomeCustomizedAppBar extends StatelessWidget {
  final Function showProfileDialog;
  final Function goToTeachersNotes;
  final String? name;
  const WelcomeCustomizedAppBar(
      {required this.showProfileDialog,
      required this.goToTeachersNotes,
      this.name,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 23, 24, 18),
      decoration: BoxDecoration(
        color: DesignColors.white,
        boxShadow: [
          BoxShadow(
            color: DesignColors.grey.withOpacity(0.075),
            blurRadius: 4,
            spreadRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("welcome".tr(namedArgs: {"model": " $name"})),
          Row(
            children: [
              AnimatedGesture(
                callback: () {
                  goToTeachersNotes();
                },
                child: SvgPicture.asset(
                  'notes'.svgAsset,
                ),
              ),
              const SizedBox(width: 20),
              AnimatedGesture(
                callback: () {
                  showProfileDialog();
                },
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: DesignColors.secondaryColor,
                  child: name != null && name!.isNotEmpty
                      ? Text(
                          name![0],
                          style:
                              const TextStyle(color: DesignColors.primaryColor),
                        )
                      : const SizedBox.shrink(),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
