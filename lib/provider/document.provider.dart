import 'dart:convert';
import 'package:fe/model/document.model.dart';
import 'package:fe/provider/base.url.dart';
import 'package:http/http.dart' as http;

class DocumentProvider {
  DocumentProvider._();
  static Future<Map<String, String>> getHeader() async {
    Map<String, String> header = {
      'Content-type': 'application/json',
    };

    return header;
  }

  static Future<int?> post(DocumentModel documentModel) async {
    try {
      var url = "$baseUrl/api/document/post";
      var header = await getHeader();
      var response = await http.post(Uri.parse(url.toString()),
          body: documentModel.toJson(), headers: header);
      if (response.statusCode == 200) {
        var bodyConvert = jsonDecode(response.body);
        print(bodyConvert);
        return bodyConvert;
      }
    } catch (e) {
      print("Loi $e");
    }
    return null;
  }

  static Future<List<DocumentModel>> getList(String title) async {
    List<DocumentModel> listData = [];
    try {
      var url =
          "$baseUrl/api/document/get/page?filter=title~'*$title*'&page=0&size=1000000";
      var response = await http.get(Uri.parse(url.toString()));
      if (response.statusCode == 200) {
        var bodyConvert = jsonDecode(response.body);
        for (var element in bodyConvert['content']) {
          DocumentModel item = DocumentModel.fromMap(element);
          listData.add(item);
        }
      }
    } catch (e) {
      print("Loi: $e");
    }
    return listData;
  }
}
