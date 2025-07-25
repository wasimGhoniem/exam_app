import 'package:exam_app/core/di/di.dart';
import 'package:exam_app/features/auth/presentation/cubit/view_model/sign_in_view_model.dart';
import 'package:exam_app/features/auth/presentation/widgets/handle_sign_in_state_listener.dart';
import 'package:exam_app/features/auth/presentation/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/states/sign_in_state.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInViewModel>(
      create: (context) => getIt<SignInViewModel>(),
      child: BlocListener<SignInViewModel, SignInState>(
          listenWhen: (previous, current) => previous.status != current.status,

          listener: (context, state) {
            handleSignInStateListener(
                context: context,
                state: state,
                successMessage: state.response?.message ?? '',
                errorMessage: state.errorMsg ?? '');
          },
          child: SignInForm()),
    );
  }
}
