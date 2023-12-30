import 'dart:convert';
import 'package:fe/model/user.model.dart';
import 'package:fe/provider/base.url.dart';
import 'package:http/http.dart' as http;

class NguoiDungProvider {
  NguoiDungProvider._();
  static Future<Map<String, String>> getHeader() async {
    Map<String, String> header = {
      'Content-type': 'application/json',
    };

    return header;
  }

  static Future<List<UserModel>> getList({String? name, int? role}) async {
    "";
    List<UserModel> listData = [];
    try {
      var url =
          "$baseUrl/api/nguoi-dung/get/page?filter=role:$role${(name != null) ? " and fullName~'*$name*'" : ""}&page=0&size:10000&sort=createdDate,desc";
      var response = await http.get(Uri.parse(url.toString()));
      if (response.statusCode == 200) {
        var bodyConvert = jsonDecode(response.body);
        if (bodyConvert['success'] == true) {
          for (var element in bodyConvert['result']['content']) {
            UserModel item = UserModel.fromMap(element);
            listData.add(item);
          }
        }
      }
    } catch (e) {
      print("Loi $e");
    }
    return listData;
  }

  //Theem moi
  static Future<int?> themMoi(UserModel userModel) async {
    try {
      var url = "$baseUrl/api/nguoi-dung/create";
      var header = await getHeader();
      var response = await http.post(Uri.parse(url.toString()),
          body: userModel.toJson(), headers: header);
      if (response.statusCode == 200) {
        var bodyConvert = jsonDecode(response.body);
        print(bodyConvert);
        return bodyConvert['result'];
      }
    } catch (e) {
      print("Loi $e");
    }
    return null;
  }

  //Sua
  static Future<bool> sua(UserModel nguoiDungModel) async {
    try {
      var url = "$baseUrl/api/nguoi-dung/put/${nguoiDungModel.id}";
      var header = await getHeader();
      var response = await http.put(Uri.parse(url.toString()),
          body: nguoiDungModel.toJson(), headers: header);
      if (response.statusCode == 200) {
        var bodyConvert = jsonDecode(response.body);
        return bodyConvert['success'];
      }
    } catch (e) {
      print("Loi $e");
    }
    return false;
  }

  // <<<< Login >>>>
  static Future<UserModel?> login(
      {required String email, required String password}) async {
    UserModel? nguoiDungModel;
    try {
      var url = "$baseUrl/api/nguoi-dung/login";
      print(url);
      Map<String, String> header = await getHeader();
      var responseBody = {'username': email, 'password': password};
      var body = json.encode(responseBody);
      var response = await http.post(Uri.parse(url.toString()),
          headers: header, body: body);
      if (response.statusCode == 200) {
        var bodyConvert = jsonDecode(response.body);
        if (bodyConvert['success'] == true) {
          return nguoiDungModel = UserModel.fromMap(bodyConvert['result']);
        }
      }
    } catch (e) {}
    return nguoiDungModel;
  }

  static Future<UserModel> getUserById({required String id}) async {
    "";
    UserModel nguoiDungModel = UserModel();
    try {
      var url = "$baseUrl/api/nguoi-dung/get/$id";
      var response = await http.get(Uri.parse(url.toString()));
      print(response.statusCode);
      if (response.statusCode == 200) {
        var bodyConvert = jsonDecode(response.body);
        if (bodyConvert['success'] == true) {
          nguoiDungModel = UserModel.fromMap(bodyConvert['result']);
        }
      }
    } catch (e) {
      print("Loi $e");
    }
    return nguoiDungModel;
  }

  static Future<UserModel> getAdmin() async {
    UserModel? admin;
    try {
      var url = "$baseUrl/api/nguoi-dung/get/page?filter=role:0";
      var response = await http.get(Uri.parse(url.toString()));
      if (response.statusCode == 200) {
        var bodyConvert = jsonDecode(response.body);
        if (bodyConvert['success'] == true) {
          if (bodyConvert['result']['content'].isNotEmpty) {
            admin = UserModel.fromMap(bodyConvert['result']['content'].first);
          }
        }
      }
    } catch (e) {
      print("Loi $e");
    }
    return admin ?? UserModel();
  }

  static Future<bool> changePassword(
      {required int idUSer, required String newpass}) async {
    try {
      var userLogin = {"userName": "", "password": newpass};
      var url = "$baseUrl/api/nguoi-dung/change-pass/$idUSer";
      Map<String, String> header = await getHeader();
      await http.post(Uri.parse(url.toString()),
          headers: header, body: json.encode(userLogin));
      return true;
    } catch (e) {}
    return false;
  }

  static Future<bool> xoa({required int idUSer}) async {
    try {
      var url = "$baseUrl/api/nguoi-dung/del/$idUSer";
      Map<String, String> header = await getHeader();
      await http.delete(Uri.parse(url.toString()), headers: header);
      return true;
    } catch (e) {}
    return false;
  }

  static Future<UserModel?> getUserByEmail(String email) async {
    try {
      var url = "$baseUrl/api/nguoi-dung/get/page?filter=email~'*$email*'";
      var response = await http.get(Uri.parse(url.toString()));
      print(url);
      if (response.statusCode == 200) {
        var bodyConvert = jsonDecode(response.body);
        if (bodyConvert['success'] == true) {
          if (bodyConvert['result']['content'].isNotEmpty) {
            for (var element in bodyConvert['result']['content']) {
              var user = UserModel.fromMap(element);
              if (user.email == email) {
                return user;
              }
            }
          }
        }
      }
    } catch (e) {
      print("Loi $e");
    }
    return null;
  }
}
