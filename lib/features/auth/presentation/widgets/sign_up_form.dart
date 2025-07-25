import 'package:exam_app/core/route/app_routes.dart';
import 'package:exam_app/features/auth/presentation/cubit/view_model/sign_up_view_model.dart';
import 'package:exam_app/features/auth/presentation/widgets/build_elevated_button.dart';
import 'package:exam_app/features/auth/presentation/widgets/build_navigation_text.dart';
import 'package:exam_app/features/auth/presentation/widgets/build_password_and_confirm_field.dart';
import 'package:exam_app/features/auth/presentation/widgets/build_phone_field.dart';
import 'package:exam_app/features/auth/presentation/widgets/build_user_name_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_constants.dart';
import '../cubit/states/sign_up_states.dart';
import 'build_app_bar.dart';
import 'build_email_field.dart';
import 'build_first_and_last_name_field.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SignUpViewModel>();
    return Scaffold(
      appBar: BuildAppBar(title: AppConstants.signUpTitle),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: viewModel.formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: AutofillGroup(
                child: Column(
                  children: [
                    BuildUserNameField(
                      controller: viewModel.signUpUsernameController,
                    ),
                    SizedBox(height: 24.h),
                    BuildFirstAndLastNameField(
                      firstNameController: viewModel.signUpFirstNameController,
                      secondNameController: viewModel.signUpLastNameController,
                    ),
                    SizedBox(height: 24.h),
                    BuildEmailField(controller: viewModel.signUpEmailController,),
                    SizedBox(height: 24.h),
                    BuildPasswordAndConfirmField(passwordController: viewModel.signUpPasswordController,
                        confirmController: viewModel.signUpRePasswordController),
                    SizedBox(height: 24.h),
                    BuildPhoneField(controller: viewModel.signUpPhoneController,),
                    SizedBox(height: 48.h),

                    BlocBuilder<SignUpViewModel, SignUpState>(
                      builder: (context, state) {
                        return BuildElevatedButton(
                          text: AppConstants.signUpTitle,
                          onPressed: state.isFormValid
                              ? () => viewModel.signUp()
                              : null,
                        );
                      },
                    ),
                    SizedBox(height: 16.h),
                    BuildNavigationText(firstText: AppConstants.alreadyHaveAccount, secondText: AppConstants.login, routeName: AppRoutes.login)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
