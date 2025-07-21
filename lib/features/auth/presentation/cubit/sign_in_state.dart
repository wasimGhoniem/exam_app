import 'package:equatable/equatable.dart';
import 'package:exam_app/features/auth/domain/entities/sign_in_response_entity.dart';

class SignInState extends Equatable {
  final bool isLoading;
  final SignInResponseEntity? response;
  final String? errorMsg;

  const SignInState({
    this.isLoading = false,
    this.response,
    this.errorMsg,
  });

  SignInState copyWith({
    bool? isLoading,
    SignInResponseEntity? response,
    String? errorMsg,
  }) {
    return SignInState(
      isLoading: isLoading ?? this.isLoading,
      response: response ?? this.response,
      errorMsg: errorMsg,
    );
  }

  List<Object?> get props => [isLoading, response, errorMsg];
}
