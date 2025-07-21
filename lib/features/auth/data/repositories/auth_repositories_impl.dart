import 'package:exam_app/core/api_result/api_result.dart';
import 'package:exam_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:exam_app/features/auth/domain/entities/sign_in_request_entity.dart';
import 'package:exam_app/features/auth/domain/entities/sign_in_response_entity.dart';
import 'package:exam_app/features/auth/domain/entities/sign_up_request_entity.dart';
import 'package:exam_app/features/auth/domain/entities/sign_up_response_entity.dart';
import 'package:exam_app/features/auth/domain/repositories/auth_repositories.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:AuthRepositories )
class AuthRepositoriesImpl extends AuthRepositories{
  final AuthRemoteDataSource _authRemoteDataSource;
  AuthRepositoriesImpl({required AuthRemoteDataSource authRemoteDataSource})
      : _authRemoteDataSource = authRemoteDataSource;

  @override
  Future<ApiResult<SignInResponseEntity>> signIn(SignInRequestEntity signInRequest) {
     return _authRemoteDataSource.signIn(signInRequest);
  }

  @override
  Future<ApiResult<SignUpResponseEntity>> signUp(SignUpRequestEntity signUpRequest) {
    return _authRemoteDataSource.signUp(signUpRequest);
  }
}