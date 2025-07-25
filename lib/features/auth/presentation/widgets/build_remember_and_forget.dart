import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_constants.dart';

class BuildRememberAndForget extends StatelessWidget {
  final bool value;
  final void Function()? onPressed;
  final void Function(bool?)? onChanged;

  const BuildRememberAndForget(
      {super.key,
      required this.onPressed,
      required this.value,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: value,
              onChanged: onChanged,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
            Text(AppConstants.rememberMe,
                style: Theme.of(context).textTheme.headlineLarge),
          ],
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            AppConstants.forgetPassword,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  decoration: TextDecoration.underline,
                ),
          ),
        ),
      ],
    );
  }
}
