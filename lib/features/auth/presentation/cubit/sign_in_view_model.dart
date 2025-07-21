import 'package:exam_app/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:exam_app/features/auth/domain/entities/sign_in_request_entity.dart';
import 'package:exam_app/features/auth/presentation/cubit/sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/api_result/api_result.dart';

@injectable
class SignInViewModel extends Cubit<SignInState> {
  final SignInUseCase _signInUseCase;

  SignInViewModel({required SignInUseCase signInUseCase})
      : _signInUseCase = signInUseCase,
        super(const SignInState());

  final formKey = GlobalKey<FormState>();
  late final TextEditingController signInEmailController;
  late final TextEditingController signInPasswordController;
  final bool rememberMe = false;



  /// Called when the user presses the sign-in button
  Future<void> signIn() async {
    // Validate the form before proceeding
    if (formKey.currentState?.validate() != true) {
      // Optionally, emit a state with an error message if you want to show a general error
      // emit(state.copyWith(errorMsg: "Please fix the errors in the form."));
      return;
    }

    emit(state.copyWith(isLoading: true, errorMsg: null));

    final request = SignInRequestEntity(
      email: signInEmailController.text.trim(),
      password: signInPasswordController.text,
    );

    final result = await signInUseCase.invoke(request);

    if (result is ApiSuccessResult) {
      emit(state.copyWith(
        isLoading: false,
        response: result.data,
        errorMsg: null,
      ));
    } else if (result is ApiErrorResult) {
      emit(state.copyWith(
        isLoading: false,
        errorMsg: result.errorMsg,
      ));
    } else {
      emit(state.copyWith(
        isLoading: false,
        errorMsg: "Unknown error occurred.",
      ));
    }
  }

  @override
  Future<void> close() {
    signInEmailController.dispose();
    signInPasswordController.dispose();
    return super.close();
  }
}