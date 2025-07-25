import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/validators/app_validators.dart';

class BuildUserNameField extends StatelessWidget {
  final TextEditingController controller;
  const BuildUserNameField({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      autofillHints: const [AutofillHints.name],
      decoration: InputDecoration(
        labelText: AppConstants.usernameLabel,
        hintText: AppConstants.userNameHint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: AppValidators.validateUsername,
    );
  }
}
