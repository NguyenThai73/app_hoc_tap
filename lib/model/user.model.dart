// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
   int? id;
   int? role;
   String? userName;
   String? password;
   String? fullName;
   String? avatar;
   String? ngaySinh;
   bool? gioiTinh;
   String? email;
   String? address;
   String? sdt;
   String? lopHoc;
   String? heHoc;
   String? nganhHoc;
   int? status;
  UserModel({
    this.id,
    this.role,
    this.userName,
    this.password,
    this.fullName,
    this.avatar,
    this.ngaySinh,
    this.gioiTinh,
    this.email,
    this.address,
    this.sdt,
    this.lopHoc,
    this.heHoc,
    this.nganhHoc,
    this.status,
  });

  UserModel copyWith({
    int? id,
    int? role,
    String? userName,
    String? password,
    String? fullName,
    String? avatar,
    String? ngaySinh,
    bool? gioiTinh,
    String? email,
    String? address,
    String? sdt,
    String? lopHoc,
    String? heHoc,
    String? nganhHoc,
    int? status,
  }) {
    return UserModel(
      id: id ?? this.id,
      role: role ?? this.role,
      userName: userName ?? this.userName,
      password: password ?? this.password,
      fullName: fullName ?? this.fullName,
      avatar: avatar ?? this.avatar,
      ngaySinh: ngaySinh ?? this.ngaySinh,
      gioiTinh: gioiTinh ?? this.gioiTinh,
      email: email ?? this.email,
      address: address ?? this.address,
      sdt: sdt ?? this.sdt,
      lopHoc: lopHoc ?? this.lopHoc,
      heHoc: heHoc ?? this.heHoc,
      nganhHoc: nganhHoc ?? this.nganhHoc,
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
      'avatar': avatar,
      'ngaySinh': ngaySinh,
      'gioiTinh': gioiTinh,
      'email': email,
      'address': address,
      'sdt': sdt,
      'lopHoc': lopHoc,
      'heHoc': heHoc,
      'nganhHoc': nganhHoc,
      'status': status,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as int : null,
      role: map['role'] != null ? map['role'] as int : null,
      userName: map['userName'] != null ? map['userName'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      fullName: map['fullName'] != null ? map['fullName'] as String : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      ngaySinh: map['ngaySinh'] != null ? map['ngaySinh'] as String : null,
      gioiTinh: map['gioiTinh'] != null ? map['gioiTinh'] as bool : null,
      email: map['email'] != null ? map['email'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      sdt: map['sdt'] != null ? map['sdt'] as String : null,
      lopHoc: map['lopHoc'] != null ? map['lopHoc'] as String : null,
      heHoc: map['heHoc'] != null ? map['heHoc'] as String : null,
      nganhHoc: map['nganhHoc'] != null ? map['nganhHoc'] as String : null,
      status: map['status'] != null ? map['status'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, role: $role, userName: $userName, password: $password, fullName: $fullName, avatar: $avatar, ngaySinh: $ngaySinh, gioiTinh: $gioiTinh, email: $email, address: $address, sdt: $sdt, lopHoc: $lopHoc, heHoc: $heHoc, nganhHoc: $nganhHoc, status: $status)';
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
      other.avatar == avatar &&
      other.ngaySinh == ngaySinh &&
      other.gioiTinh == gioiTinh &&
      other.email == email &&
      other.address == address &&
      other.sdt == sdt &&
      other.lopHoc == lopHoc &&
      other.heHoc == heHoc &&
      other.nganhHoc == nganhHoc &&
      other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      role.hashCode ^
      userName.hashCode ^
      password.hashCode ^
      fullName.hashCode ^
      avatar.hashCode ^
      ngaySinh.hashCode ^
      gioiTinh.hashCode ^
      email.hashCode ^
      address.hashCode ^
      sdt.hashCode ^
      lopHoc.hashCode ^
      heHoc.hashCode ^
      nganhHoc.hashCode ^
      status.hashCode;
  }
}
