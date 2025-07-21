import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/validators/app_validators.dart';

class  BuildPasswordField extends StatelessWidget {
  final TextEditingController controller;
  const  BuildPasswordField({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: AppConstants.passwordLabel,
        hintText: AppConstants.passwordHint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: AppValidators.validatePassword,
    );
  }
}
