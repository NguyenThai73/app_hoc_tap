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

  static Future<bool> put(CategoryModel categoryModel) async {
    try {
      var url = "$baseUrl/api/catogory/put/${categoryModel.id}";
      var header = await getHeader();
      var response = await http.put(Uri.parse(url.toString()),
          body: categoryModel.toJson(), headers: header);
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      print("Loi $e");
    }
    return false;
  }

  static Future<bool> delete(CategoryModel categoryModel) async {
    try {
      var url = "$baseUrl/api/catogory/del/${categoryModel.id}";
      var header = await getHeader();
      var response =
          await http.delete(Uri.parse(url.toString()), headers: header);
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      print("Loi $e");
    }
    return false;
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

  static Future<List<CategoryModel>> getList(
      {int? status, String? namHoc, int? type}) async {
    List<CategoryModel> listData = [];
    String filter = "";
    if (namHoc != null) {
      filter += " and namHoc~'*$namHoc*'";
    }
    if (status != null) {
      filter += " and status:$status";
    }
    if (type != null) {
      filter += " and type:$type";
    }
    try {
      var url =
          "$baseUrl/api/catogory/get/page?filter=deleted:false$filter&page=0&size=1000000&sort=status";
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
