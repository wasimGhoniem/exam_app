import 'package:exam_app/features/auth/api/mapper/user_dto_mapper.dart';
import 'package:exam_app/features/auth/api/models/response/sign_up_response_dto.dart';
import 'package:exam_app/features/auth/domain/entities/sign_up_response_entity.dart';

extension SignUpResponseDtoMapper on SignUpResponseDto{
  SignUpResponseEntity toEntity(){
    return SignUpResponseEntity(message: message,user:user?.toEntity() ,token:token );
  }

}