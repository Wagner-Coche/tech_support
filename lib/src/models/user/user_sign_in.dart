class UserSignIn {
  final String email;
  final String password;

  UserSignIn({
    required this.email,
    required this.password
  });

  factory UserSignIn.fromJson(Map<String, dynamic> json) {
    return UserSignIn(
      email: json["email"], 
      password: json["password"]
    );
  }

  Map<String, dynamic> toJson(UserSignIn user) {
    return {
      "email": user.email,
      "password": user.password
    };
  }
}