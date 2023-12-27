// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MessageModel {
  int? id;
  String? message;
  String? type;
  String? linkFile;
  String? createdDate;
  String? fileName;
  int? createUserId;
  String? createUserName;
  String? createUserImage;
  MessageModel({
    this.id,
    this.message,
    this.type,
    this.linkFile,
    this.createdDate,
    this.fileName,
    this.createUserId,
    this.createUserName,
    this.createUserImage,
  });

  MessageModel copyWith({
    int? id,
    String? message,
    String? type,
    String? linkFile,
    String? createdDate,
    String? fileName,
    int? createUserId,
    String? createUserName,
    String? createUserImage,
  }) {
    return MessageModel(
      id: id ?? this.id,
      message: message ?? this.message,
      type: type ?? this.type,
      linkFile: linkFile ?? this.linkFile,
      createdDate: createdDate ?? this.createdDate,
      fileName: fileName ?? this.fileName,
      createUserId: createUserId ?? this.createUserId,
      createUserName: createUserName ?? this.createUserName,
      createUserImage: createUserImage ?? this.createUserImage,
    );
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'] != null ? map['id'] as int : null,
      message: map['message'] != null ? map['message'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      linkFile: map['linkFile'] != null ? map['linkFile'] as String : null,
      createdDate: map['createdDate'] != null ? map['createdDate'] as String : null,
      fileName: map['fileName'] != null ? map['fileName'] as String : null,
      createUserId: map['createUserId'] != null ? map['createUserId'] as int : null,
      createUserName: map['createUserName'] != null ? map['createUserName'] as String : null,
      createUserImage: map['createUserImage'] != null ? map['createUserImage'] as String : null,
    );
  }

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'message': message,
      'type': type,
      'linkFile': linkFile,
      'createdDate': createdDate,
      'fileName': fileName,
      'createUserId': createUserId,
      'createUserName': createUserName,
      'createUserImage': createUserImage,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'MessageModel(id: $id, message: $message, type: $type, linkFile: $linkFile, createdDate: $createdDate, fileName: $fileName, createUserId: $createUserId, createUserName: $createUserName, createUserImage: $createUserImage)';
  }

  @override
  bool operator ==(covariant MessageModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.message == message &&
      other.type == type &&
      other.linkFile == linkFile &&
      other.createdDate == createdDate &&
      other.fileName == fileName &&
      other.createUserId == createUserId &&
      other.createUserName == createUserName &&
      other.createUserImage == createUserImage;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      message.hashCode ^
      type.hashCode ^
      linkFile.hashCode ^
      createdDate.hashCode ^
      fileName.hashCode ^
      createUserId.hashCode ^
      createUserName.hashCode ^
      createUserImage.hashCode;
  }
}
