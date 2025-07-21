
import 'package:exam_app/features/auth/api/mapper/user_dto_mapper.dart';
import '../../domain/entities/sign_in_response_entity.dart';
import '../models/response/sign_in_response_dto.dart';

extension SignInResponseDtoMapper on SignInResponseDto{
  SignInResponseEntity toEntity(){
    return SignInResponseEntity(message: message,token:token,user: user?.toEntity() );
  }

}