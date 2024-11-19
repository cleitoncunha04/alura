class User {
  String? accessToken;
  int? id;
  String email;
  String? password;

  User({
    this.accessToken,
    this.id,
    required this.email,
    this.password,
  });
}
