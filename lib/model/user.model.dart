// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final int? id;
  final int? role;
  final String userName;
  final String password;
  final String fullName;
  final String avatarPath;
  final int? status;
  UserModel({
    this.id,
    this.role,
    required this.userName,
    required this.password,
    required this.fullName,
    required this.avatarPath,
    this.status,
  });

  UserModel copyWith({
    int? id,
    int? role,
    String? userName,
    String? password,
    String? fullName,
    String? avatarPath,
    int? status,
  }) {
    return UserModel(
      id: id ?? this.id,
      role: role ?? this.role,
      userName: userName ?? this.userName,
      password: password ?? this.password,
      fullName: fullName ?? this.fullName,
      avatarPath: avatarPath ?? this.avatarPath,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'role': role,
      'userName': userName,
      'password': password,
      'fullName': fullName,
      'avatarPath': avatarPath,
      'status': status,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as int : null,
      role: map['role'] != null ? map['role'] as int : null,
      userName: map['userName'] as String,
      password: map['password'] as String,
      fullName: map['fullName'] as String,
      avatarPath: map['avatarPath'] as String,
      status: map['status'] != null ? map['status'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, role: $role, userName: $userName, password: $password, fullName: $fullName, avatarPath: $avatarPath, status: $status)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.role == role &&
      other.userName == userName &&
      other.password == password &&
      other.fullName == fullName &&
      other.avatarPath == avatarPath &&
      other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      role.hashCode ^
      userName.hashCode ^
      password.hashCode ^
      fullName.hashCode ^
      avatarPath.hashCode ^
      status.hashCode;
  }
}
