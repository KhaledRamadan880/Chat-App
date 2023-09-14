class UserModel {
  final String name;
  final String email;
  final String phone;
  final String department;
  final String uid;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.department,
    required this.uid,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      department: json['department'],
      uid: json['uid'],
    );
  }
}
