import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/route/app_routes.dart';
import '../cubit/states/sign_in_state.dart';
import '../cubit/view_model/sign_in_view_model.dart';
import 'build_app_bar.dart';
import 'build_elevated_button.dart';
import 'build_email_field.dart';
import 'build_navigation_text.dart';
import 'build_password_field.dart';
import 'build_remember_and_forget.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SignInViewModel>();
    return Scaffold(
      appBar: BuildAppBar(title: AppConstants.login),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
            key: viewModel.formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: AutofillGroup(
                child: Column(
                  children: [
                    BuildEmailField(
                      controller: viewModel.signInEmailController,
                    ),
                    SizedBox(height: 24.h),
                    BuildPasswordField(
                        controller: viewModel.signInPasswordController),
                    SizedBox(height: 16.h),
                    BlocBuilder<SignInViewModel, SignInState>(
                      builder: (context, state) {
                        return BuildRememberAndForget(
                          onPressed: () {
                            viewModel.toggleRememberMe(!state.rememberMe);
                          },
                          value: state.rememberMe,
                          onChanged: (bool? newValue) {
                            viewModel.toggleRememberMe(newValue ?? false);
                          },
                        );
                      },
                    ),
                    SizedBox(height: 16.h),
                    BlocBuilder<SignInViewModel, SignInState>(
                      builder: (context, state) {
                        return BuildElevatedButton(
                          text: AppConstants.login,
                          onPressed: state.isFormValid
                              ? () => viewModel.signIn()
                              : null,
                        );
                      },
                    ),
                    SizedBox(height: 16.h),
                    BuildNavigationText(
                        firstText: AppConstants.doNotHaveAccount,
                        secondText: AppConstants.signUpTitle,
                        routeName: AppRoutes.signup)
                  ],
                ),
              ),
            )),
      )),
    );
  }
}
