class User {
  User({required this.username, required this.email, required this.password});

  final String username;
  final String email;
  final String password;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'username': username,
        'email': email,
        'password': password,
      };

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json['username'],
        password: json['password'],
        email: json['email'],
      );
}
