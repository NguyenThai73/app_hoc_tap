// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:fe/model/user.model.dart';

class CourseCommentModel {
  int? id;
  String? createdDate;
  int? idNd;
  UserModel? nguoiDung;
  int? idCourse;
  String? star;
  String? comment;
  CourseCommentModel({
    this.id,
    this.createdDate,
    this.idNd,
    this.nguoiDung,
    this.idCourse,
    this.star,
    this.comment,
  });

  CourseCommentModel copyWith({
    int? id,
    String? createdDate,
    int? idNd,
    UserModel? nguoiDung,
    int? idCourse,
    String? star,
    String? comment,
  }) {
    return CourseCommentModel(
      id: id ?? this.id,
      createdDate: createdDate ?? this.createdDate,
      idNd: idNd ?? this.idNd,
      nguoiDung: nguoiDung ?? this.nguoiDung,
      idCourse: idCourse ?? this.idCourse,
      star: star ?? this.star,
      comment: comment ?? this.comment,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'createdDate': createdDate,
      'idNd': idNd,
      'nguoiDung': nguoiDung?.toMap(),
      'idCourse': idCourse,
      'star': star,
      'comment': comment,
    };
  }

  factory CourseCommentModel.fromMap(Map<String, dynamic> map) {
    return CourseCommentModel(
      id: map['id'] != null ? map['id'] as int : null,
      createdDate: map['createdDate'] != null ? map['createdDate'] as String : null,
      idNd: map['idNd'] != null ? map['idNd'] as int : null,
      nguoiDung: map['nguoiDung'] != null ? UserModel.fromMap(map['nguoiDung'] as Map<String,dynamic>) : null,
      idCourse: map['idCourse'] != null ? map['idCourse'] as int : null,
      star: map['star'] != null ? map['star'] as String : null,
      comment: map['comment'] != null ? map['comment'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseCommentModel.fromJson(String source) =>
      CourseCommentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CourseCommentModel(id: $id, createdDate: $createdDate, idNd: $idNd, nguoiDung: $nguoiDung, idCourse: $idCourse, star: $star, comment: $comment)';
  }

  @override
  bool operator ==(covariant CourseCommentModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.createdDate == createdDate &&
        other.idNd == idNd &&
        other.nguoiDung == nguoiDung &&
        other.idCourse == idCourse &&
        other.star == star &&
        other.comment == comment;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        createdDate.hashCode ^
        idNd.hashCode ^
        nguoiDung.hashCode ^
        idCourse.hashCode ^
        star.hashCode ^
        comment.hashCode;
  }
}
