class SignInResponseEntity {
  SignInResponseEntity({
    required this.message,
     this.token,
     this.user,
  });

  final String message;
  final String? token;
  final UserEntity? user;
}

class UserEntity {
  final String id;
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String role;
  final bool isVerified;
  final String createdAt;


  UserEntity({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.role,
    required this.isVerified,
    required this.createdAt,

  });
}

