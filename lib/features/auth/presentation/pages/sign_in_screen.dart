import 'package:exam_app/core/constants/app_constants.dart';
import 'package:exam_app/core/di/di.dart';
import 'package:exam_app/features/auth/presentation/cubit/sign_in_view_model.dart';
import 'package:exam_app/features/auth/presentation/widgets/build_app_bar.dart';
import 'package:exam_app/features/auth/presentation/widgets/build_navigation_text.dart';
import 'package:exam_app/features/auth/presentation/widgets/build_remember_and_forget.dart';
import 'package:exam_app/features/auth/presentation/widgets/handle_state_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/route/app_routes.dart';
import '../cubit/sign_in_state.dart';
import '../widgets/build_elevated_button.dart';
import '../widgets/build_email_field.dart';
import '../widgets/build_password_field.dart';

class SignInScreen extends StatelessWidget {
  final SignInViewModel viewModel = getIt<SignInViewModel>();

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInViewModel>(
      create: (context) => viewModel,
      child: BlocListener<SignInViewModel, SignInState>(
        listener: (context, state) {
          handleStateListener(
              context: context,
              state: state,
              successMessage: 'successMessage',
              errorMessage: 'errorMessage');
        },
        child: Scaffold(
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
                            BuildRememberAndForget(onPressed: (){}, value: viewModel.rememberMe),
                            SizedBox(height: 16.h),
                            BuildElevatedButton(text:AppConstants.login ,onPressed:(){} ,),
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
        ),
      ),
    );
  }




}
