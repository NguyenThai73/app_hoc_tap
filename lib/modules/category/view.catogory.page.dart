// ignore_for_file: use_build_context_synchronously

import 'package:fe/constant/map.data.dart';
import 'package:fe/constant/no.focus.scope.dart';
import 'package:fe/constant/textfiel.dart';
import 'package:fe/model/category.model.dart';
import 'package:fe/provider/base.url.dart';
import 'package:flutter/material.dart';

class ViewCategoryPage extends StatefulWidget {
  final CategoryModel categoryModel;
  const ViewCategoryPage({super.key, required this.categoryModel});

  @override
  State<ViewCategoryPage> createState() => _ViewCategoryPageState();
}

class _ViewCategoryPageState extends State<ViewCategoryPage> {
  Map<int, String> listHocKy = {
    1: "Học kỳ 1",
    2: "Học kỳ 2",
    3: "Học kỳ 3",
  };

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
        title: Center(
          child: Text(
            categoryType[widget.categoryModel.type] ?? "",
            style: const TextStyle(
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
      body: NoFocusScope(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFielWidget(
                  title: 'Năm học',
                  controller: TextEditingController(
                      text: widget.categoryModel.namHoc ?? ""),
                  enabled: false,
                ),
                const SizedBox(height: 25),
                TextFielWidget(
                  title: 'Học kỳ',
                  controller: TextEditingController(
                      text: listHocKy[widget.categoryModel.hocKy ?? 0]),
                  enabled: false,
                ),
                const SizedBox(height: 25),
                const Text(
                  "File đính kèm",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.categoryModel.attachment ?? ""),
                      InkWell(
                          onTap: () async {
                            await downloadFile(
                                context, widget.categoryModel.attachment ?? "");
                          },
                          child: const Icon(
                            Icons.download,
                            color: Colors.blue,
                            size: 30,
                          ))
                    ],
                  )),
                ),
                const SizedBox(height: 25),
                TextFielWidget(
                  title: 'Lý do ',
                  controller: TextEditingController(
                      text: widget.categoryModel.lyDo ?? ""),
                  enabled: false,
                  minLines: 5,
                ),
                const SizedBox(height: 25),
                const Text(
                  "File đính kèm phản hồi",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.categoryModel.attachmenAdmin ?? ""),
                      InkWell(
                          onTap: () async {
                            await downloadFile(context,
                                widget.categoryModel.attachmenAdmin ?? "");
                          },
                          child: const Icon(
                            Icons.download,
                            color: Colors.blue,
                            size: 30,
                          ))
                    ],
                  )),
                ),
                const SizedBox(height: 25),
                TextFielWidget(
                  title: 'Phản hồi ',
                  controller: TextEditingController(
                      text: widget.categoryModel.phanHoi ?? ""),
                  enabled: false,
                  minLines: 5,
                ),
              ],
            ))),
      ),
    );
  }
}
