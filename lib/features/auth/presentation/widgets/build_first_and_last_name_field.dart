import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/validators/app_validators.dart';

class BuildFirstAndLastNameField extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController secondNameController;

  const BuildFirstAndLastNameField(
      {super.key,
      required this.firstNameController,
      required this.secondNameController});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextFormField(
          controller: firstNameController,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          autofillHints: const [AutofillHints.name],
          decoration: InputDecoration(
            labelText: AppConstants.firstNameLabel,
            hintText: AppConstants.firstNameHint,
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          validator: AppValidators.validateFullName,
        )),
        SizedBox(width: 8.w),
        Expanded(
            child: TextFormField(
          controller: secondNameController,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          autofillHints: const [AutofillHints.name],
          decoration: InputDecoration(
            labelText: AppConstants.lastNameLabel,
            hintText: AppConstants.lastNameHint,
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          validator: AppValidators.validateFullName,
        )),
      ],
    );
  }
}
