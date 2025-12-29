import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:ppob_koperasi_payment/feature/login/login_controller.dart';
import 'package:ppob_koperasi_payment/utils/theme/app_color.dart';
import 'package:ppob_koperasi_payment/utils/widgets/custom_text_field.dart';
import 'package:ppob_koperasi_payment/utils/widgets/primary_button.dart';

class FormLogin extends GetView<LoginController> {
  const FormLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: controller.loginFromKey,
      child: Column(
        children: [
          const CustomTextField(
            name: 'email',
            label: 'Email',
            required: true,
            hint: 'Enter your email',
          ),
          const SizedBox(height: 16.0),
          Obx(() {
            return CustomTextField(
              name: 'Password',
              label: 'Password',
              required: true,
              hint: 'Enter your password',
              obscureText: controller.isPasswordObscured.value,
              suffixIcon: IconButton(
                icon: Icon(
                  controller.isPasswordObscured.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: AppColors.text50,
                ),
                onPressed: () {
                  controller.isPasswordObscured.value =
                      !controller.isPasswordObscured.value;
                },
                splashColor: AppColors.transparent,
                highlightColor: AppColors.transparent,
              ),
            );
          }),
          const SizedBox(height: 24.0),
          Obx(
            () => PrimaryButton(
              text: 'Login',
              isLoading: controller.isLoading.value,
              onPressed: controller.isLoading.value ? null : controller.login,
            ),
          ),
        ],
      ),
    );
  }
}
