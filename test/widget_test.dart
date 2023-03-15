class User {
  final int userId;
  final String name;
  final String email;
  final String phone;

  User(
      {required this.userId,
      required this.name,
      required this.email,
      required this.phone});

  // fromJson - json 데이터를 dart 오브젝트로 변환
  factory User.fromJson(Map<String, dynamic> json) => User(
      userId: json['userId'],
      name: json['name'],
      email: json['email'],
      phone: json['phone']);

  // toJson - dart오브젝트에서 제이슨 데이터로 변환
  Map<String, dynamic> toJson() =>
      {'userid': userId, 'name': name, 'email': email, 'phone': phone};
}
