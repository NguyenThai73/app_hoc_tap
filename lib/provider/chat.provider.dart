// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fe/provider/base.url.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/message.model.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class ChatProvider {
  final firebaseInstance = FirebaseFirestore.instance;
  final CollectionReference<Map<String, dynamic>> _groupCollection =
      FirebaseFirestore.instance.collection('chat');

  Future<List<MessageModel>> getMessAll() async {
    List<MessageModel> listData = [];
    try {
      var url = "$baseUrl/api/message/get/page";
      var response = await http.get(Uri.parse(url.toString()));
      if (response.statusCode == 200) {
        var bodyConvert = jsonDecode(response.body);
        if (bodyConvert['success'] == true) {
          for (var element in bodyConvert['result']['content']) {
            MessageModel item = MessageModel.fromMap(element);
            listData.add(item);
          }
        }
      }
    } catch (e) {
      print("Loi123 $e");
    }

    return listData;
  }

  Stream<MessageModel> messageStream() {
    return _groupCollection
        .orderBy("createdDate", descending: true)
        .limit(1)
        .withConverter<MessageModel>(
          fromFirestore: (snapshot, options) {
            return MessageModel.fromMap(snapshot.data() ?? {});
          },
          toFirestore: (value, options) => value.toMap(),
        )
        .snapshots()
        .map((event) {
      var listChange = event.docChanges
          .where((element) => element.type == DocumentChangeType.added)
          .map((e) {
        return e.doc.data() ?? MessageModel();
      }).toList();
      if (listChange.isNotEmpty) {
        return listChange.first;
      }
      return MessageModel();
    });
  }

  sendMessageText({required String message}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? idSend = prefs.getInt("id");
      String? name = prefs.getString("name");
      MessageModel data = MessageModel(
        message: message,
        createUserId: idSend,
        createUserName: name ?? "",
        createUserImage: "",
        type: "text",
        linkFile: "",
        fileName: "",
      );
      //luu vao database
      var idMessDB = await saveMessToDB(data);
      //luu vao firebase
      if (idMessDB != null) {
        data.id = idMessDB;
        data.createdDate =
            DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
        await FirebaseFirestore.instance
            .collection('chat')
            .doc(idMessDB.toString())
            .set(data.toMap());
      } else {
        var idMess = const Uuid().v4();
        data.id = 0;
        data.createdDate =
            DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
        await FirebaseFirestore.instance
            .collection('chat')
            .doc(idMess)
            .set(data.toMap());
      }
    } catch (e) {
      print("Loi: $e");
    }
  }

  sendMessageImage({required String fileName}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? idSend = prefs.getInt("id");
      String? name = prefs.getString("name");

      MessageModel data = MessageModel(
        message: "",
        createUserId: idSend,
        createUserName: name ?? "",
        createUserImage: "",
        type: "image",
        linkFile: fileName,
        fileName: fileName,
      );
      //luu vao database
      var idMessDB = await saveMessToDB(data);
      //luu vao firebase
      if (idMessDB != null) {
        data.id = idMessDB;
        data.createdDate =
            DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
        await _groupCollection.doc(idMessDB.toString()).set(data.toMap());
      } else {
        var idMess = const Uuid().v4();
        data.id = 0;
        data.createdDate =
            DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
        await FirebaseFirestore.instance
            .collection('chat')
            .doc(idMess)
            .set(data.toMap());
      }
    } catch (e) {
      print("Loi: $e");
    }
  }

  sendMessageFile({required String fileName}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? idSend = prefs.getInt("id");
      String? name = prefs.getString("name");

      MessageModel data = MessageModel(
        message: "",
        createUserId: idSend,
        createUserName: name ?? "",
        createUserImage: "",
        type: "file",
        linkFile: fileName,
        fileName: fileName,
      );
      //luu vao database
      var idMessDB = await saveMessToDB(data);
      //luu vao firebase
      if (idMessDB != null) {
        data.id = idMessDB;
        data.createdDate =
            DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
        await _groupCollection.doc(idMessDB.toString()).set(data.toMap());
      } else {
        var idMess = const Uuid().v4();
        data.id = 0;
        data.createdDate =
            DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
        await FirebaseFirestore.instance
            .collection('chat')
            .doc(idMess)
            .set(data.toMap());
      }
    } catch (e) {
      print("Loi: $e");
    }
  }

  Future<int?> saveMessToDB(MessageModel messageModel) async {
    int? value;
    try {
      var url = "$baseUrl/api/message/post";
      await http.post(
        Uri.parse(url.toString()),
        headers: {'Content-type': 'application/json'},
        body: messageModel.toJson(),
      );
    } catch (e) {
      print("Loi234: $e");
    }

    return value;
  }

  deleteMess(int id) async {
    try {
      var url = "$baseUrl/api/message/del/$id";
      await http.delete(Uri.parse(url.toString()),
          headers: {'Content-type': 'application/json'});
    } catch (e) {
      print("Loi: $e");
    }
  }

  void editMess(MessageModel messageModel) async {
    var url = "$baseUrl/api/message/put/${messageModel.id}";
    await http.put(Uri.parse(url.toString()),
        headers: {'Content-type': 'application/json'},
        body: messageModel.toMap());
  }
}

extension DateTimeExtension on DateTime {
  String get toMyDateTime {
    String formattedDate = DateFormat('yyyy/MM/dd HH:mm:ss').format(this);
    return formattedDate;
  }
}
