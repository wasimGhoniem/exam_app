import 'package:exam_app/features/auth/domain/entities/sign_in_request_entity.dart';
import 'package:exam_app/features/auth/domain/repositories/auth_repositories.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api_result/api_result.dart';
import '../entities/sign_in_response_entity.dart';
@injectable
class SignInUseCase {
  AuthRepositories authRepositories;
  SignInUseCase({required this.authRepositories});

  Future <ApiResult<SignInResponseEntity>> invoke(SignInRequestEntity signInRequest){
     return authRepositories.signIn(signInRequest);
  }
}