// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CourseModel {
  final int? id;
  final int? type;
  final String? title;
  final String? moTa;
  final String? employer;
  final String? employerPath;
  final String? url;
  final double? numberStart;
  final int? numberComment;
  CourseModel({
    this.id,
    this.type,
    this.title,
    this.moTa,
    this.employer,
    this.employerPath,
    this.url,
    this.numberStart,
    this.numberComment,
  });

  CourseModel copyWith({
    int? id,
    int? type,
    String? title,
    String? moTa,
    String? employer,
    String? employerPath,
    String? url,
    double? numberStart,
    int? numberComment,
  }) {
    return CourseModel(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      moTa: moTa ?? this.moTa,
      employer: employer ?? this.employer,
      employerPath: employerPath ?? this.employerPath,
      url: url ?? this.url,
      numberStart: numberStart ?? this.numberStart,
      numberComment: numberComment ?? this.numberComment,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'type': type,
      'title': title,
      'moTa': moTa,
      'employer': employer,
      'employerPath': employerPath,
      'url': url,
      'numberStart': numberStart,
      'numberComment': numberComment,
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      id: map['id'] != null ? map['id'] as int : null,
      type: map['type'] != null ? map['type'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      moTa: map['moTa'] != null ? map['moTa'] as String : null,
      employer: map['employer'] != null ? map['employer'] as String : null,
      employerPath:
          map['employerPath'] != null ? map['employerPath'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
      numberStart:
          map['numberStart'] != null ? map['numberStart'] as double : null,
      numberComment:
          map['numberComment'] != null ? map['numberComment'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseModel.fromJson(String source) =>
      CourseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CourseModel(id: $id, type: $type, title: $title, moTa: $moTa, employer: $employer, employerPath: $employerPath, url: $url, numberStart: $numberStart, numberComment: $numberComment)';
  }

  @override
  bool operator ==(covariant CourseModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.type == type &&
        other.title == title &&
        other.moTa == moTa &&
        other.employer == employer &&
        other.employerPath == employerPath &&
        other.url == url &&
        other.numberStart == numberStart &&
        other.numberComment == numberComment;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        type.hashCode ^
        title.hashCode ^
        moTa.hashCode ^
        employer.hashCode ^
        employerPath.hashCode ^
        url.hashCode ^
        numberStart.hashCode ^
        numberComment.hashCode;
  }
}
