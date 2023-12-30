// ignore_for_file: use_build_context_synchronously

import 'package:fe/constant/map.data.dart';
import 'package:fe/constant/no.focus.scope.dart';
import 'package:fe/constant/textfiel.dart';
import 'package:fe/constant/toast.dart';
import 'package:fe/model/category.model.dart';
import 'package:fe/provider/base.url.dart';
import 'package:fe/provider/category.provider.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class EditCategoryPage extends StatefulWidget {
  final CategoryModel categoryModel;
  const EditCategoryPage({super.key, required this.categoryModel});

  @override
  State<EditCategoryPage> createState() => _EditCategoryPageState();
}

class _EditCategoryPageState extends State<EditCategoryPage> {
  CategoryModel categoryModel = CategoryModel();
  TextEditingController namHoc = TextEditingController();
  TextEditingController lyDo = TextEditingController();
  int? hocKy;
  Map<int, String> listHocKy = {
    1: "Học kỳ 1",
    2: "Học kỳ 2",
    3: "Học kỳ 3",
  };
  @override
  void initState() {
    super.initState();
    categoryModel = widget.categoryModel.copyWith();
    namHoc.text = categoryModel.namHoc ?? "";
    lyDo.text = categoryModel.lyDo ?? "";
    hocKy = categoryModel.hocKy;
  }

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
            categoryType[categoryModel.type] ?? "",
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
                  controller: namHoc,
                  type: TextInputType.number,
                ),
                const SizedBox(height: 25),
                const Text(
                  "Học kỳ",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1.5, color: Colors.grey),
                        ),
                        height: 50,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            items: listHocKy.entries
                                .map((item) => DropdownMenuItem<int>(
                                    value: item.key, child: Text(item.value)))
                                .toList(),
                            value: hocKy,
                            onChanged: (value) {
                              setState(() {
                                hocKy = value as int;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
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
                      Text(categoryModel.attachment ?? ""),
                      InkWell(
                          onTap: () async {
                            var fileName = await handleUploadFileAll();
                            setState(() {
                              categoryModel.attachment = fileName;
                            });
                          },
                          child: const Icon(
                            Icons.upload,
                            color: Colors.blue,
                            size: 30,
                          ))
                    ],
                  )),
                ),
                const SizedBox(height: 25),
                TextFielWidget(
                  title: 'Lý do ',
                  controller: lyDo,
                  minLines: 5,
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
                          if (namHoc.text.isEmpty ||
                              hocKy == null ||
                              lyDo.text.isEmpty) {
                            showToast(
                              context: context,
                              msg: "Nhập đủ thông tin",
                              color: const Color.fromARGB(255, 255, 179, 86),
                              icon: const Icon(Icons.info),
                            );
                          } else {
                            categoryModel.hocKy = hocKy;
                            categoryModel.namHoc = namHoc.text;
                            categoryModel.lyDo = lyDo.text;
                            var idNew =
                                await CategoryProvider.put(categoryModel);
                            if (idNew) {
                              showToast(
                                context: context,
                                msg: "Cập nhật thành công",
                                color: const Color.fromARGB(255, 75, 254, 30),
                                icon: const Icon(Icons.done),
                              );
                              Navigator.pop(context, categoryModel);
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
            ))),
      ),
    );
  }
}
