class SigninUserRequest {
  final String email;
  final String password;

  SigninUserRequest({
    required this.email, 
    required this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}