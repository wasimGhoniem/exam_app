import 'package:exam_app/core/api_result/api_result.dart';
import 'package:exam_app/features/auth/domain/entities/sign_in_request_entity.dart';
import 'package:exam_app/features/auth/domain/entities/sign_in_response_entity.dart';
import 'package:exam_app/features/auth/domain/entities/sign_up_request_entity.dart';
import 'package:exam_app/features/auth/domain/entities/sign_up_response_entity.dart';

abstract class AuthRepositories {

Future <ApiResult<SignInResponseEntity>> signIn(SignInRequestEntity signInRequest);

Future <ApiResult<SignUpResponseEntity>> signUp(SignUpRequestEntity signUpRequest);


}