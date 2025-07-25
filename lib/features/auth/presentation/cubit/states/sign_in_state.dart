import 'package:equatable/equatable.dart';
import 'package:exam_app/features/auth/domain/entities/sign_in_response_entity.dart';

enum SignInStatus { initial, loading, success, error }

class SignInState extends Equatable {
  final SignInResponseEntity? response;
  final String? errorMsg;
  final bool rememberMe;
  final SignInStatus status;
  final bool isFormValid;

  const SignInState({
    this.response,
    this.errorMsg,
    this.rememberMe = false,
    this.status = SignInStatus.initial,
    this.isFormValid = false,
  });

  SignInState copyWith({
    SignInResponseEntity? response,
    String? errorMsg,
    bool? rememberMe,
    SignInStatus? status,
    bool? isFormValid,
  }) {
    return SignInState(
        status: status ?? this.status,
        response: response ?? this.response,
        errorMsg: errorMsg ?? this.errorMsg,
        rememberMe: rememberMe ?? this.rememberMe,
      isFormValid: isFormValid ?? this.isFormValid,
    );
  }

  @override
  List<Object?> get props => [response, errorMsg, rememberMe, status,isFormValid];
}
