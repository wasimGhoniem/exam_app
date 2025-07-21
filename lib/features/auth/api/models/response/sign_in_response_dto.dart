import 'package:exam_app/features/auth/api/models/user_dto.dart';
import 'package:exam_app/features/auth/domain/entities/sign_in_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_in_response_dto.g.dart';

@JsonSerializable()
class SignInResponseDto {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "token")
  final String? token;
  @JsonKey(name: "user")
  final UserDto? user;

  SignInResponseDto ({
    required this.message,
    this.token,
    this.user,
  });

  factory SignInResponseDto.fromJson(Map<String, dynamic> json) {
    return _$SignInResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SignInResponseDtoToJson(this);
  }



}




