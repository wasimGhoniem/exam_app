import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/dialog/dialog_utils.dart';


void handleStateListener({
  required BuildContext context,
  required dynamic state,
  required String successMessage,
  required String errorMessage,
  VoidCallback? onSuccess,
}) {
  if (state.isLoading) {
    DialogUtils.showLoading(
      context: context,
      message: AppConstants.loadingMessage,
    );
  } else if (state.errorMsg != null) {
    DialogUtils.hideLoading(context);
    DialogUtils.showMessage(
      context: context,
      message: errorMessage,
      title: AppConstants.errorTitle,
      posActionName: AppConstants.ok,
    );
  } else if (state.response != null) {
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
