import 'package:exam_app/features/auth/domain/entities/sign_in_response_entity.dart';

class SignUpResponseEntity {
  SignUpResponseEntity({
    required this.message,
     this.token,
     this.user,
  });

  final String message;
  final String? token;
  final UserEntity? user;
}
