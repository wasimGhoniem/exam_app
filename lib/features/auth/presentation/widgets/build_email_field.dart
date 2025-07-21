import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/validators/app_validators.dart';

class BuildEmailField extends StatelessWidget {
 final TextEditingController controller;
  const BuildEmailField({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      autofillHints: const [AutofillHints.email],
      decoration: InputDecoration(
        labelText: AppConstants.emailLabel,
        hintText: AppConstants.emailHint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: AppValidators.validateEmail,
    );
  }
}
