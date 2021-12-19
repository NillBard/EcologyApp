class Auth {
  Auth({required this.accessToken, required this.refreshToken});

  String accessToken;
  String refreshToken;

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
        accessToken: json['accessToken'], refreshToken: json['refreshToken']);
  }
}
