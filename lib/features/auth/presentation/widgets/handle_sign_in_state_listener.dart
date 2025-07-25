import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/dialog/dialog_utils.dart';
import '../cubit/states/sign_in_state.dart';


void handleSignInStateListener({
  required BuildContext context,
  required dynamic state,
  required String successMessage,
  required String errorMessage,
  VoidCallback? onSuccess,
}) {
  if (state.status == SignInStatus.loading) {
    DialogUtils.showLoading(
      context: context,
      message: AppConstants.loadingMessage,
    );
  } else if (state.status == SignInStatus.error) {
    DialogUtils.hideLoading(context);
    DialogUtils.showMessage(
      context: context,
      message: errorMessage,
      title: AppConstants.errorTitle,
      posActionName: AppConstants.ok,
    );
  } else if (state.status == SignInStatus.success) {
    DialogUtils.hideLoading(context);
    DialogUtils.showMessage(
      context: context,
      message: successMessage,
      title: AppConstants.successTitle,
      posActionName: AppConstants.ok,
      posAction: onSuccess,
    );
  }
}
