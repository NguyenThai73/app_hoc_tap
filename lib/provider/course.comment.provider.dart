import 'dart:convert';
import 'package:fe/model/course.comment.model.dart';
import 'package:fe/model/course.model.dart';
import 'package:fe/provider/base.url.dart';
import 'package:http/http.dart' as http;

class CourseCommentProvider {
  CourseCommentProvider._();
  static Future<Map<String, String>> getHeader() async {
    Map<String, String> header = {
      'Content-type': 'application/json',
    };

    return header;
  }

  static Future<bool> post(CourseCommentModel courseCommentModel) async {
    try {
      var url = "$baseUrl/api/course-comment/post";
      var header = await getHeader();
      var response = await http.post(Uri.parse(url.toString()),
          body: courseCommentModel.toJson(), headers: header);
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      print("Loi $e");
    }
    return false;
  }

  static Future<List<CourseCommentModel>> getList({required int idCourse}) async {
    List<CourseCommentModel> listData = [];
    try {
      var url =
          "$baseUrl/api/course-comment/get/page?filter=idCourse:$idCourse&page=0&size=1000000&sort=createdDate,desc";
      print(url);
      var response = await http.get(Uri.parse(url.toString()));
      if (response.statusCode == 200) {
        var bodyConvert = jsonDecode(response.body);
        for (var element in bodyConvert['content']) {
          CourseCommentModel item = CourseCommentModel.fromMap(element);
          listData.add(item);
        }
      }
    } catch (e) {
      print("Loi: $e");
    }
    return listData;
  }

  static Future<bool> put(CourseModel courseModel) async {
    try {
      var url = "$baseUrl/api/course/put/${courseModel.id}";
      var header = await getHeader();
      var response = await http.put(Uri.parse(url.toString()),
          body: courseModel.toJson(), headers: header);
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      print("Loi $e");
    }
    return false;
  }

  static Future<bool> delete(CourseModel courseModel) async {
    try {
      var url = "$baseUrl/api/course/del/${courseModel.id}";
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
}
