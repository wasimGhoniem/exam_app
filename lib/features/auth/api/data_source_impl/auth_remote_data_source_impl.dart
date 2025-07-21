import 'package:exam_app/core/api_result/api_result.dart';
import 'package:exam_app/features/auth/api/mapper/sign_in_response_dto_mapper.dart';
import 'package:exam_app/features/auth/api/mapper/sign_up_response_dto_mapper.dart';
import 'package:exam_app/features/auth/api/models/sign_in_request_dto.dart';
import 'package:exam_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:exam_app/features/auth/domain/entities/sign_in_request_entity.dart';
import 'package:exam_app/features/auth/domain/entities/sign_in_response_entity.dart';
import 'package:exam_app/features/auth/domain/entities/sign_up_request_entity.dart';
import 'package:exam_app/features/auth/domain/entities/sign_up_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/error_handler.dart';
import '../client/auth_api_client.dart';
import '../models/sign_up_request_dto.dart';
@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource{
  final AuthApiClient _authApiClient;
  AuthRemoteDataSourceImpl({required AuthApiClient authApiClient}) : _authApiClient = authApiClient;
  @override
  Future<ApiResult<SignInResponseEntity>> signIn(SignInRequestEntity signInRequest) async {
    try {
      var response = await _authApiClient.signIn(SignInRequestDto.fromDomain(signInRequest));
         return ApiSuccessResult(data: response.toEntity());
    } catch (e) {

      return ApiErrorResult<SignInResponseEntity>(errorMsg: ErrorHandler.getFriendlyMessage(e.toString()));
    }
  }

  @override
  Future<ApiResult<SignUpResponseEntity>> signUp(SignUpRequestEntity signUpRequest)async {
    try {
      var response = await _authApiClient.signUp(SignUpRequestDto.fromDomain(signUpRequest));
      return ApiSuccessResult(data: response.toEntity());
    } catch (e) {

      return ApiErrorResult<SignUpResponseEntity>(errorMsg: ErrorHandler.getFriendlyMessage(e.toString()));
    }
  }
}

