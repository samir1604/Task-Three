class User {
  User(this.username, this.email, this.password);

  final String username;
  final String email;
  final String password;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'username': username,
        'email': email,
        'password': password,
      };

  factory User.fromJson(Map<String, dynamic> json) => User(
        json['username'],
        json['email'],
        json['password'],
      );
}
