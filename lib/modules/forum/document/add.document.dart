// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:fe/constant/shared.preferences.dart';
import 'package:fe/constant/textfiel.dart';
import 'package:fe/constant/toast.dart';
import 'package:fe/model/document.model.dart';
import 'package:fe/provider/base.url.dart';
import 'package:fe/provider/document.provider.dart';
import 'package:flutter/material.dart';

class AddDocumentPage extends StatefulWidget {
  const AddDocumentPage({super.key});

  @override
  State<AddDocumentPage> createState() => _AddDocumentPageState();
}

class _AddDocumentPageState extends State<AddDocumentPage> {
  TextEditingController title = TextEditingController();
  TextEditingController moTa = TextEditingController();
  DocumentModel documentModel = DocumentModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 25,
          ),
        ),
        title: const Center(
          child: Text(
            "Thêm tài liệu",
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        actions: const [SizedBox(width: 44)],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[Color(0xFF5adce4), Color(0xFF014dae)]),
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFielWidget(
                title: 'Tiêu đề ',
                controller: title,
              ),
              const SizedBox(height: 25),
              TextFielWidget(
                title: 'Mô tả ',
                controller: moTa,
                minLines: 5,
              ),
              const SizedBox(height: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "File",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 2, color: Colors.grey)),
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                (documentModel.filename != null)
                                    ? "File uploaded"
                                    : "Upload file",
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: 10),
                            InkWell(
                                onTap: () async {
                                  var fileName = await handleUploadFileAll();
                                  setState(() {
                                    documentModel.filename = fileName;
                                  });
                                },
                                child: Icon(
                                  Icons.upload,
                                  color: Colors.blue,
                                )),
                            SizedBox(width: 10),
                          ],
                        ),
                      ))
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: InkWell(
                      onTap: () async {
                        if (title.text.isEmpty ||
                            documentModel.filename == null ||
                            documentModel.filename == "") {
                          showToast(
                            context: context,
                            msg: "Nhập đủ thông tin",
                            color: const Color.fromARGB(255, 255, 179, 86),
                            icon: const Icon(Icons.info),
                          );
                        } else {
                          var idSV = await MySP.getIdSV();
                          documentModel.idSv = idSV;
                          documentModel.title = title.text;
                          documentModel.moTa = moTa.text;
                          print(documentModel.toMap());
                          var idNew =
                              await DocumentProvider.post(documentModel);
                          if (idNew != null) {
                            showToast(
                              context: context,
                              msg: "Thêm mới thành công",
                              color: Color.fromARGB(255, 75, 254, 30),
                              icon: const Icon(Icons.done),
                            );
                            Navigator.pop(context, documentModel);
                          } else {
                            showToast(
                              context: context,
                              msg: "Có lỗi xảy ra",
                              color: const Color.fromARGB(255, 255, 179, 86),
                              icon: const Icon(Icons.info),
                            );
                          }
                        }
                      },
                      child: const Center(
                        child: Text(
                          "Gửi",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
