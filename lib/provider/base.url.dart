// ignore_for_file: depend_on_referenced_packages, empty_catches

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';

String baseUrl = "http://192.168.1.106:8080";

Future<String?> handleUploadFile() async {
  String? fileName;
  FilePickerResult? result = await FilePicker.platform
      .pickFiles(type: FileType.image, allowMultiple: true);
  if (result != null) {
    try {
      for (var element in result.files) {
        String path = element.path ?? "";
        var fileNameUpload = await uploadFile(File(path));
        if (fileNameUpload != null) {
          if (fileName == null) {
            fileName = fileNameUpload;
          } else {
            fileName += ",$fileNameUpload";
          }
        }
      }
    } catch (e) {}
  } else {}

  return fileName;
}

Future<String?> handleUploadAvater() async {
  String? fileName;
  FilePickerResult? result =
      await FilePicker.platform.pickFiles(type: FileType.image);
  if (result != null) {
    try {
      for (var element in result.files) {
        String path = element.path ?? "";
        var fileNameUpload = await uploadFile(File(path));
        fileName = fileNameUpload;
      }
    } catch (e) {
      print("Loi: $e");
    }
  } else {}

  return fileName;
}

Future<String?> uploadFile(File file) async {
  try {
    Map<String, String> headers = {'content-type': 'multipart/form-data'};
    final request = http.MultipartRequest(
      "POST",
      Uri.parse("$baseUrl/api/upload"),
    );
    request.headers.addAll(headers);
    request.files.add(
      http.MultipartFile(
        'file', // Field name in the form-data
        http.ByteStream(file.openRead()),
        await file.length(),
        filename: 'file.jpg',
      ),
    );
    var response = await request.send();
    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      var body = json.decode(responseBody);
      return body["1"];
    } else {
      return null;
    }
  } catch (e) {
    print("Loi up danh: $e");
    return null;
  }
}

Future<String?> handleUploadFileAll() async {
  String? fileName;
  FilePickerResult? result =
      await FilePicker.platform.pickFiles(type: FileType.any);
  if (result != null) {
    try {
      for (var element in result.files) {
        String path = element.path ?? "";
        var fileNameUpload = await uploadFile(File(path));
        fileName = fileNameUpload;
      }
    } catch (e) {
      print("Loi1: $e");
    }
  }

  return fileName;
}

Future<String?> handleUploadImage() async {
  String? fileName;
  FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
  if (result != null) {
    try {
      for (var element in result.files) {
        String path = element.path ?? "";
        var fileNameUpload = await uploadFile(File(path));
        fileName = fileNameUpload;
      }
    } catch (e) {}
  } else {}

  return fileName;
}

Future<void> downloadFile(BuildContext context, String fileName) async {
  try {
    final response = await http.get(Uri.parse("$baseUrl/api/files/$fileName"));

    if (response.statusCode == 200) {
      final documentsDirectory = await getExternalStorageDirectory();
      final filePath = '${documentsDirectory?.path}/$fileName';
      final file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Đã tải file về: $filePath'),
          duration: const Duration(seconds: 2), // Adjust the duration as needed
        ),
      );
    }
  } catch (e) {
    print("error: $e");
  }
}
