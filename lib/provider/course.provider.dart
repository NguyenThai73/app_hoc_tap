// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'dart:convert';
import 'package:fe/model/course.model.dart';
import 'package:fe/provider/base.url.dart';
import 'package:http/http.dart' as http;

import 'course.comment.provider.dart';

class CourseProvider {
  CourseProvider._();
  static Future<Map<String, String>> getHeader() async {
    Map<String, String> header = {
      'Content-type': 'application/json',
    };

    return header;
  }

  static Future<int?> post(CourseModel courseModel) async {
    try {
      var url = "$baseUrl/api/course/post";
      var header = await getHeader();
      var response = await http.post(Uri.parse(url.toString()),
          body: courseModel.toJson(), headers: header);
      if (response.statusCode == 200) {
        var bodyConvert = jsonDecode(response.body);
        return bodyConvert;
      }
    } catch (e) {
      print("Loi $e");
    }
    return null;
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

  static Future<List<CourseModel>> getList({String? name}) async {
    List<CourseModel> listData = [];
    try {
      var url =
          "$baseUrl/api/course/get/page?${name != null ? "filter=title~'*$name*'" : ""}page=0&size=1000000&sort=createdDate,desc&sort=status";
      var response = await http.get(Uri.parse(url.toString()));
      if (response.statusCode == 200) {
        var bodyConvert = jsonDecode(response.body);
        for (var element in bodyConvert['content']) {
          CourseModel item = CourseModel.fromMap(element);
          item.listComments =
              await CourseCommentProvider.getList(idCourse: item.id ?? 0);
          int countStar = 0;
          for (var elementComment in item.listComments) {
            countStar += int.tryParse(elementComment.star ?? "") ?? 0;
          }
          if (item.listComments.isNotEmpty) {
            item.numberStart = countStar / item.listComments.length;
            item.numberComment = item.listComments.length;
          }
          listData.add(item);
        }
      }
    } catch (e) {
      print("Loi: $e");
    }
    return listData;
  }

  static Future<List<CourseModel>> getListFostudent({String? name}) async {
    List<CourseModel> listData = [];
    try {
      var url =
          "$baseUrl/api/course/get/page?${name != null ? "filter=title~'*$name*' and status:1&" : "filter=status:1&"}page=0&size=1000000&sort=createdDate,desc&sort=status";
      var response = await http.get(Uri.parse(url.toString()));
      if (response.statusCode == 200) {
        var bodyConvert = jsonDecode(response.body);
        for (var element in bodyConvert['content']) {
          CourseModel item = CourseModel.fromMap(element);
          item.listComments =
              await CourseCommentProvider.getList(idCourse: item.id ?? 0);
          int countStar = 0;
          for (var elementComment in item.listComments) {
            countStar += int.tryParse(elementComment.star ?? "") ?? 0;
          }
          if (item.listComments.isNotEmpty) {
            item.numberStart = countStar / item.listComments.length;
            item.numberComment = item.listComments.length;
          }
          listData.add(item);
        }
      }
    } catch (e) {
      print("Loi: $e");
    }
    return listData;
  }

  static Future<List<CourseModel>> getListFostudentFotype(
      {String? name, required int type}) async {
    List<CourseModel> listData = [];
    try {
      var url =
          "$baseUrl/api/course/get/page?${name != null ? "filter=title~'*$name*' and status:1 and type:$type&" : "filter=status:1 and type:$type&"}page=0&size=1000000&sort=createdDate,desc&sort=status";
      var response = await http.get(Uri.parse(url.toString()));
      if (response.statusCode == 200) {
        var bodyConvert = jsonDecode(response.body);
        for (var element in bodyConvert['content']) {
          CourseModel item = CourseModel.fromMap(element);
          item.listComments =
              await CourseCommentProvider.getList(idCourse: item.id ?? 0);
          int countStar = 0;
          for (var elementComment in item.listComments) {
            countStar += int.tryParse(elementComment.star ?? "") ?? 0;
          }
          if (item.listComments.isNotEmpty) {
            item.numberStart = countStar / item.listComments.length;
            item.numberComment = item.listComments.length;
          }
          listData.add(item);
        }
      }
    } catch (e) {
      print("Loi: $e");
    }
    return listData;
  }

  static Future<List<CourseModel>> getListForDN(
      {String? name, required int idDn}) async {
    List<CourseModel> listData = [];
    try {
      var url =
          "$baseUrl/api/course/get/page?${name != null ? "filter=title~'*$name*' and idDn:$idDn&" : "filter=idDn:$idDn&"}page=0&size=1000000&sort=createdDate,desc&sort=status";
      var response = await http.get(Uri.parse(url.toString()));
      if (response.statusCode == 200) {
        var bodyConvert = jsonDecode(response.body);
        for (var element in bodyConvert['content']) {
          CourseModel item = CourseModel.fromMap(element);
          item.listComments =
              await CourseCommentProvider.getList(idCourse: item.id ?? 0);
          int countStar = 0;
          for (var elementComment in item.listComments) {
            countStar += int.tryParse(elementComment.star ?? "") ?? 0;
          }
          if (item.listComments.isNotEmpty) {
            item.numberStart = countStar / item.listComments.length;
            item.numberComment = item.listComments.length;
          }
          listData.add(item);
        }
      }
    } catch (e) {
      print("Loi: $e");
    }
    return listData;
  }
}
