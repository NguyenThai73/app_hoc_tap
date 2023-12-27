import 'package:fe/constant/textfiel.dart';
import 'package:fe/model/document.model.dart';
import 'package:fe/provider/base.url.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ViewDocument extends StatelessWidget {
  final DocumentModel documentModel;
  const ViewDocument({super.key, required this.documentModel});

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
            "Thông tin tài liệu",
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
                controller:
                    TextEditingController(text: documentModel.title ?? ""),
                enabled: false,
              ),
              const SizedBox(height: 25),
              TextFielWidget(
                title: 'Mô tả ',
                controller:
                    TextEditingController(text: documentModel.moTa ?? ""),
                enabled: false,
              ),
              const SizedBox(height: 25),
              TextFielWidget(
                title: 'Ngày tải ',
                controller: TextEditingController(
                    text: DateFormat('dd-MM-yyyy').format(
                        DateTime.parse(documentModel.createdDate ?? ""))),
                enabled: false,
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
                        Clipboard.setData(ClipboardData(
                            text:
                                "$baseUrl/api/files/${documentModel.filename}"));
                      },
                      child: const Center(
                        child: Text(
                          "Sao chép link",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: InkWell(
                      onTap: () async {
                        downloadFile(context, documentModel.filename ?? "");
                      },
                      child: const Center(
                        child: Text(
                          "Tải xuống",
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
