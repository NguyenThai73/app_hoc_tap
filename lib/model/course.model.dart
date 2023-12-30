// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:fe/model/course.comment.model.dart';
import 'package:fe/model/user.model.dart';

class CourseModel {
  int? id;
  int? idDn;
  UserModel? nguoiDung;
  int? type;
  String? title;
  String? createdDate;
  String? moTa;
  String? url;
  String? urlKhaiGiang;
  double? numberStart;
  int? numberComment;
  int? views;
  int? status;
  List<CourseCommentModel> listComments= [];
  CourseModel({
    this.id,
    this.idDn,
    this.nguoiDung,
    this.type,
    this.title,
    this.createdDate,
    this.moTa,
    this.url,
    this.urlKhaiGiang,
    this.numberStart,
    this.numberComment,
    this.views,
    this.status,
  });

  CourseModel copyWith({
    int? id,
    int? idDn,
    UserModel? nguoiDung,
    int? type,
    String? title,
    String? createdDate,
    String? moTa,
    String? url,
    String? urlKhaiGiang,
    double? numberStart,
    int? numberComment,
    int? views,
    int? status,
  }) {
    return CourseModel(
      id: id ?? this.id,
      idDn: idDn ?? this.idDn,
      nguoiDung: nguoiDung ?? this.nguoiDung,
      type: type ?? this.type,
      title: title ?? this.title,
      createdDate: createdDate ?? this.createdDate,
      moTa: moTa ?? this.moTa,
      url: url ?? this.url,
      urlKhaiGiang: urlKhaiGiang ?? this.urlKhaiGiang,
      numberStart: numberStart ?? this.numberStart,
      numberComment: numberComment ?? this.numberComment,
      views: views ?? this.views,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'idDn': idDn,
      'type': type,
      'title': title,
      'moTa': moTa,
      'url': url,
      'urlKhaiGiang': urlKhaiGiang,
      'views': views,
      'status': status,
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      id: map['id'] != null ? map['id'] as int : null,
      idDn: map['idDn'] != null ? map['idDn'] as int : null,
      nguoiDung: map['nguoiDung'] != null ? UserModel.fromMap(map['nguoiDung'] as Map<String,dynamic>) : null,
      type: map['type'] != null ? map['type'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      createdDate: map['createdDate'] != null ? map['createdDate'] as String : null,
      moTa: map['moTa'] != null ? map['moTa'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
      urlKhaiGiang: map['urlKhaiGiang'] != null ? map['urlKhaiGiang'] as String : null,
      numberStart: map['numberStart'] != null ? map['numberStart'] as double : null,
      numberComment: map['numberComment'] != null ? map['numberComment'] as int : null,
      views: map['views'] != null ? map['views'] as int : null,
      status: map['status'] != null ? map['status'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseModel.fromJson(String source) =>
      CourseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CourseModel(id: $id, idDn: $idDn, nguoiDung: $nguoiDung, type: $type, title: $title, createdDate: $createdDate, moTa: $moTa, url: $url, urlKhaiGiang: $urlKhaiGiang, numberStart: $numberStart, numberComment: $numberComment, views: $views, status: $status)';
  }

  @override
  bool operator ==(covariant CourseModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.idDn == idDn &&
      other.nguoiDung == nguoiDung &&
      other.type == type &&
      other.title == title &&
      other.createdDate == createdDate &&
      other.moTa == moTa &&
      other.url == url &&
      other.urlKhaiGiang == urlKhaiGiang &&
      other.numberStart == numberStart &&
      other.numberComment == numberComment &&
      other.views == views &&
      other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      idDn.hashCode ^
      nguoiDung.hashCode ^
      type.hashCode ^
      title.hashCode ^
      createdDate.hashCode ^
      moTa.hashCode ^
      url.hashCode ^
      urlKhaiGiang.hashCode ^
      numberStart.hashCode ^
      numberComment.hashCode ^
      views.hashCode ^
      status.hashCode;
  }
}
