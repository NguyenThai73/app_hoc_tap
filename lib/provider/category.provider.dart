import 'dart:convert';
import 'package:fe/constant/shared.preferences.dart';
import 'package:fe/model/category.model.dart';
import 'package:fe/provider/base.url.dart';
import 'package:http/http.dart' as http;

class CategoryProvider {
  CategoryProvider._();
  static Future<Map<String, String>> getHeader() async {
    Map<String, String> header = {
      'Content-type': 'application/json',
    };

    return header;
  }

  static Future<int?> post(CategoryModel categoryModel) async {
    try {
      var url = "$baseUrl/api/catogory/post";
      var header = await getHeader();
      var response = await http.post(Uri.parse(url.toString()),
          body: categoryModel.toJson(), headers: header);
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

  static Future<List<CategoryModel>> getListForStatus(int status) async {
    List<CategoryModel> listData = [];
    try {
      var idSV = await MySP.getIdSV();
      var url =
          "$baseUrl/api/catogory/get/page?filter=idSv:$idSV and status:$status&page=0&size=1000000";
      var response = await http.get(Uri.parse(url.toString()));
      if (response.statusCode == 200) {
        var bodyConvert = jsonDecode(response.body);
        for (var element in bodyConvert['content']) {
          CategoryModel item = CategoryModel.fromMap(element);
          listData.add(item);
        }
      }
    } catch (e) {
      print("Loi: $e");
    }
    return listData;
  }
}
