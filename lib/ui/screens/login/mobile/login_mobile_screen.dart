import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutterx_live_data/flutterx_live_data.dart';
import 'package:nadrus_parent_app/ui/core/layouts/theme_widget.dart';
import "package:nadrus_parent_app/ui/widgets/instance/instance_builder.dart";

import '../../../../config/ui_config.dart';
import '../../../core/layouts/base_scroll_view.dart';
import '../../../resources/colors/colors.dart';
import '../../../widgets/animations/animated_column.dart';
import '../../../widgets/buttons/customized_button.dart';
import '../../../widgets/text_fields/livedata_text_field.dart';
import "../viewmodels/login_viewmodel.dart";

class LoginMobileScreen extends StatelessWidget {
  const LoginMobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InstanceBuilder<LoginViewModel>(
      builder: (viewModel) {
        return ThemeWidget(
          builder: (context, theme) {
            return BaseScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: AnimatedColumn(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 64),
                        Row(
                          children: [
                            Text(
                              "login_title".tr(),
                              style: const TextStyle(
                                  color: DesignColors.black,
                                  fontSize: 36,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(height: 35),
                        Row(
                          children: [
                            Text(
                              "login_description".tr(),
                              style: const TextStyle(
                                  color: DesignColors.black,
                                  fontSize: 26,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),

                        LiveDataTextField(
                          label: 'username'.tr(),
                          liveData: viewModel.params.username,
                          onTextChanged: viewModel.attrChanged,
                          editable: false,
                        ),
                        const SizedBox(height: 20),

                        LiveDataTextField(
                          label: 'password'.tr(),
                          liveData: viewModel.params.password,
                          onTextChanged: viewModel.attrChanged,
                          textInputAction: TextInputAction.done,
                        ),
                        const SizedBox(height: 100),
                        //const SizedBox(height: 10),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     Text(
                        //       "forgot_password".tr(),
                        //       style: const TextStyle(
                        //           color: Color(0XFF707070), fontSize: 16),
                        //     )
                        //   ],
                        // )
                      ],
                    ),
                    Column(
                      children: [
                        LiveDataBuilder<bool>(
                          data: viewModel.params.submit,
                          builder: (context, enabled) {
                            return SizedBox(
                              width: screenSize(context).width,
                              child: CustomizedButton(
                                  enabled: true, //todo enabled
                                  callback: viewModel.login,
                                  child: const Text("sign_in").tr()),
                            );
                          },
                        ),
                        const SizedBox(height: 70),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
