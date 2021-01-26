class LoginResponse {
  String token;
  int id;
  String username;
  String accountType;
  String profilePic;

  LoginResponse(
      {this.token, this.id, this.username, this.accountType, this.profilePic});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'],
      id: json['id'],
      username: json['username'],
      accountType: json['accountType'],
      profilePic: json['profilePic'],
    );
  }
}
