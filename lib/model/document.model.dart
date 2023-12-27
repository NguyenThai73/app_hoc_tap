// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:fe/model/user.model.dart';

class DocumentModel {
  int? id;
  int? idSv;
  UserModel? nguoiDung;
  String? createdDate;
  String? title;
  String? moTa;
  String? filename;
  DocumentModel({
    this.id,
    this.idSv,
    this.nguoiDung,
    this.createdDate,
    this.title,
    this.moTa,
    this.filename,
  });

  DocumentModel copyWith({
    int? id,
    int? idSv,
    UserModel? nguoiDung,
    String? createdDate,
    String? title,
    String? moTa,
    String? filename,
  }) {
    return DocumentModel(
      id: id ?? this.id,
      idSv: idSv ?? this.idSv,
      nguoiDung: nguoiDung ?? this.nguoiDung,
      createdDate: createdDate ?? this.createdDate,
      title: title ?? this.title,
      moTa: moTa ?? this.moTa,
      filename: filename ?? this.filename,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'idSv': idSv,
      'title': title,
      'moTa': moTa,
      'filename': filename,
    };
  }

  factory DocumentModel.fromMap(Map<String, dynamic> map) {
    return DocumentModel(
      id: map['id'] != null ? map['id'] as int : null,
      idSv: map['idSv'] != null ? map['idSv'] as int : null,
      nguoiDung: map['nguoiDung'] != null ? UserModel.fromMap(map['nguoiDung'] as Map<String,dynamic>) : null,
      createdDate: map['createdDate'] != null ? map['createdDate'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      moTa: map['moTa'] != null ? map['moTa'] as String : null,
      filename: map['filename'] != null ? map['filename'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DocumentModel.fromJson(String source) => DocumentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DocumentModel(id: $id, idSv: $idSv, nguoiDung: $nguoiDung, createdDate: $createdDate, title: $title, moTa: $moTa, filename: $filename)';
  }

  @override
  bool operator ==(covariant DocumentModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.idSv == idSv &&
      other.nguoiDung == nguoiDung &&
      other.createdDate == createdDate &&
      other.title == title &&
      other.moTa == moTa &&
      other.filename == filename;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      idSv.hashCode ^
      nguoiDung.hashCode ^
      createdDate.hashCode ^
      title.hashCode ^
      moTa.hashCode ^
      filename.hashCode;
  }
}
