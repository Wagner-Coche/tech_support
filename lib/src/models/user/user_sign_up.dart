class UserSignUp {
  final String fullName;
  final String email;
  final String password;

  UserSignUp({
    required this.fullName,
    required this.email,
    required this.password
  });

  factory UserSignUp.fromJson(Map<String, dynamic> json) {
    return UserSignUp(
      fullName: json["fullName"], 
      email: json["email"], 
      password: json["password"]
    );
  }

  Map<String, dynamic> toJson(UserSignUp user) {
    return {
      "fullName": user.fullName,
      "email": user.email,
      "password": user.password
    };
  }
}