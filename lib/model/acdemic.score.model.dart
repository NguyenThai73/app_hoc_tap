// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AcademicScoreModel {
  final String name;
  final String namHoc;
  final String kyHoc;
  final double diem;
  AcademicScoreModel({
    required this.name,
    required this.namHoc,
    required this.kyHoc,
    required this.diem,
  });

  AcademicScoreModel copyWith({
    String? name,
    String? namHoc,
    String? kyHoc,
    double? diem,
  }) {
    return AcademicScoreModel(
      name: name ?? this.name,
      namHoc: namHoc ?? this.namHoc,
      kyHoc: kyHoc ?? this.kyHoc,
      diem: diem ?? this.diem,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'namHoc': namHoc,
      'kyHoc': kyHoc,
      'diem': diem,
    };
  }

  factory AcademicScoreModel.fromMap(Map<String, dynamic> map) {
    return AcademicScoreModel(
      name: map['name'] as String,
      namHoc: map['namHoc'] as String,
      kyHoc: map['kyHoc'] as String,
      diem: map['diem'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory AcademicScoreModel.fromJson(String source) => AcademicScoreModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AcademicScoreModel(name: $name, namHoc: $namHoc, kyHoc: $kyHoc, diem: $diem)';
  }

  @override
  bool operator ==(covariant AcademicScoreModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.namHoc == namHoc &&
      other.kyHoc == kyHoc &&
      other.diem == diem;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      namHoc.hashCode ^
      kyHoc.hashCode ^
      diem.hashCode;
  }
}
