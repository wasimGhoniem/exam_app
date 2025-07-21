import 'package:exam_app/features/auth/domain/repositories/auth_repositories.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api_result/api_result.dart';
import '../entities/sign_up_request_entity.dart';
import '../entities/sign_up_response_entity.dart';
@injectable
class SignUpUseCase {
  AuthRepositories authRepositories;

  SignUpUseCase({required this.authRepositories});

  Future <ApiResult<SignUpResponseEntity>>invoke(SignUpRequestEntity signUpRequest){
       return authRepositories.signUp(signUpRequest);
  }
}