// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:fe/model/user.model.dart';

class CategoryModel {
  int? id;
  int? idSv;
  UserModel? nguoiDung;
  String? createdDate;
  int? type;
  String? namHoc;
  int? hocKy;
  String? lyDo;
  String? attachment;
  String? attachmenAdmin;
  String? phanHoi;
  int? status;
  CategoryModel({
    this.id,
    this.idSv,
    this.nguoiDung,
    this.createdDate,
    this.type,
    this.namHoc,
    this.hocKy,
    this.lyDo,
    this.attachment,
    this.attachmenAdmin,
    this.phanHoi,
    this.status,
  });

  CategoryModel copyWith({
    int? id,
    int? idSv,
    UserModel? nguoiDung,
    String? createdDate,
    int? type,
    String? namHoc,
    int? hocKy,
    String? lyDo,
    String? attachment,
    String? attachmenAdmin,
    String? phanHoi,
    int? status,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      idSv: idSv ?? this.idSv,
      nguoiDung: nguoiDung ?? this.nguoiDung,
      createdDate: createdDate ?? this.createdDate,
      type: type ?? this.type,
      namHoc: namHoc ?? this.namHoc,
      hocKy: hocKy ?? this.hocKy,
      lyDo: lyDo ?? this.lyDo,
      attachment: attachment ?? this.attachment,
      attachmenAdmin: attachmenAdmin ?? this.attachmenAdmin,
      phanHoi: phanHoi ?? this.phanHoi,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'idSv': idSv,
      'createdDate': createdDate,
      'type': type,
      'namHoc': namHoc,
      'hocKy': hocKy,
      'lyDo': lyDo,
      'attachment': attachment,
      'attachmenAdmin': attachmenAdmin,
      'phanHoi': phanHoi,
      'status': status,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] != null ? map['id'] as int : null,
      idSv: map['idSv'] != null ? map['idSv'] as int : null,
      nguoiDung: map['nguoiDung'] != null ? UserModel.fromMap(map['nguoiDung'] as Map<String,dynamic>) : null,
      createdDate: map['createdDate'] != null ? map['createdDate'] as String : null,
      type: map['type'] != null ? map['type'] as int : null,
      namHoc: map['namHoc'] != null ? map['namHoc'] as String : null,
      hocKy: map['hocKy'] != null ? map['hocKy'] as int : null,
      lyDo: map['lyDo'] != null ? map['lyDo'] as String : null,
      attachment: map['attachment'] != null ? map['attachment'] as String : null,
      attachmenAdmin: map['attachmenAdmin'] != null ? map['attachmenAdmin'] as String : null,
      phanHoi: map['phanHoi'] != null ? map['phanHoi'] as String : null,
      status: map['status'] != null ? map['status'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) => CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CategoryModel(id: $id, idSv: $idSv, nguoiDung: $nguoiDung, createdDate: $createdDate, type: $type, namHoc: $namHoc, hocKy: $hocKy, lyDo: $lyDo, attachment: $attachment, attachmenAdmin: $attachmenAdmin, phanHoi: $phanHoi, status: $status)';
  }

  @override
  bool operator ==(covariant CategoryModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.idSv == idSv &&
      other.nguoiDung == nguoiDung &&
      other.createdDate == createdDate &&
      other.type == type &&
      other.namHoc == namHoc &&
      other.hocKy == hocKy &&
      other.lyDo == lyDo &&
      other.attachment == attachment &&
      other.attachmenAdmin == attachmenAdmin &&
      other.phanHoi == phanHoi &&
      other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      idSv.hashCode ^
      nguoiDung.hashCode ^
      createdDate.hashCode ^
      type.hashCode ^
      namHoc.hashCode ^
      hocKy.hashCode ^
      lyDo.hashCode ^
      attachment.hashCode ^
      attachmenAdmin.hashCode ^
      phanHoi.hashCode ^
      status.hashCode;
  }
}
