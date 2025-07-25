import 'package:exam_app/core/di/di.dart';
import 'package:exam_app/features/auth/presentation/cubit/states/sign_up_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/view_model/sign_up_view_model.dart';
import '../widgets/handle_sign_up_state_listener.dart';
import '../widgets/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpViewModel>(
      create: (context) => getIt<SignUpViewModel>(),
      child: BlocListener<SignUpViewModel,SignUpState>(
        listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            handleSignUpStateListener(
                context: context,
                state: state,
                successMessage: state.response?.message ?? '',
                errorMessage: state.errorMsg ?? '');
          },
         child: SignUpForm(),


      ),
    );
  }
}
