import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/validators/app_validators.dart';

class BuildPhoneField extends StatelessWidget {
  final TextEditingController controller;
  const BuildPhoneField({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      autofillHints: const [AutofillHints.telephoneNumber],
      decoration: InputDecoration(
        labelText: AppConstants.phoneLabel,
        hintText: AppConstants.phoneNumberHint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: AppValidators.validatePhoneNumber,
    );
  }
}
