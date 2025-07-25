import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/validators/app_validators.dart';

class BuildPasswordAndConfirmField extends StatelessWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmController;

  const BuildPasswordAndConfirmField(
      {super.key,
      required this.passwordController,
      required this.confirmController});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextFormField(
          controller: passwordController,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.next,
          autofillHints: const [AutofillHints.password],
          decoration: InputDecoration(
            labelText: AppConstants.passwordLabel,
            hintText: AppConstants.passwordHint,
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          validator: AppValidators.validatePassword,
        )),
        SizedBox(width: 8.w),
        Expanded(
            child: TextFormField(
          controller: confirmController,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.next,
          autofillHints: const [AutofillHints.password],
          decoration: InputDecoration(
            labelText: AppConstants.confirmPasswordLabel,
            hintText: AppConstants.confirmPasswordHint,
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          validator: (val) => AppValidators.validateConfirmPassword(
              val, passwordController.text),
        )),
      ],
    );
  }
}
