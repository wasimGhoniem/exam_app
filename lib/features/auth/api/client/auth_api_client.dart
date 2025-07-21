import 'package:dio/dio.dart';
import 'package:exam_app/core/api_endpoint/endpoint.dart';
import 'package:exam_app/features/auth/api/models/sign_in_request_dto.dart';
import 'package:exam_app/features/auth/api/models/sign_up_request_dto.dart';
import 'package:exam_app/features/auth/api/models/response/sign_in_response_dto.dart';
import 'package:exam_app/features/auth/api/models/response/sign_up_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_client.g.dart';

@injectable
@RestApi()
abstract class AuthApiClient {
  @factoryMethod
  factory AuthApiClient(Dio dio) = _AuthApiClient;

  @POST(Endpoint.signIn)
  Future<SignInResponseDto> signIn(@Body() SignInRequestDto signInRequest);

  @POST(Endpoint.signUp)
  Future<SignUpResponseDto> signUp(@Body() SignUpRequestDto signUpRequest);
}