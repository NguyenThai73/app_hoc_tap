// ignore_for_file: use_build_context_synchronously

import 'package:fe/constant/map.data.dart';
import 'package:fe/constant/map.status.dart';
import 'package:fe/constant/no.focus.scope.dart';
import 'package:fe/constant/textfiel.dart';
import 'package:fe/constant/toast.dart';
import 'package:fe/model/category.model.dart';
import 'package:fe/provider/base.url.dart';
import 'package:fe/provider/category.provider.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:intl/intl.dart';

class EditCategoryAdminPage extends StatefulWidget {
  final CategoryModel categoryModel;
  const EditCategoryAdminPage({super.key, required this.categoryModel});

  @override
  State<EditCategoryAdminPage> createState() => _EditCategoryAdminPageState();
}

class _EditCategoryAdminPageState extends State<EditCategoryAdminPage> {
  CategoryModel categoryModel = CategoryModel();
  TextEditingController namHoc = TextEditingController();
  TextEditingController lyDo = TextEditingController();
  TextEditingController phanHoi = TextEditingController();
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
    phanHoi.text = categoryModel.phanHoi ?? "";
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
                  enabled: false,
                ),
                const SizedBox(height: 25),
                TextFielWidget(
                  title: "Học kỳ",
                  controller: TextEditingController(text: listHocKy[hocKy]),
                  type: TextInputType.number,
                  enabled: false,
                ),
                const SizedBox(height: 25),
                TextFielWidget(
                  title: "Sinh viên",
                  controller: TextEditingController(
                      text: categoryModel.nguoiDung?.fullName ?? ""),
                  type: TextInputType.number,
                  enabled: false,
                ),
                const SizedBox(height: 25),
                TextFielWidget(
                  title: "Email",
                  controller: TextEditingController(
                      text: categoryModel.nguoiDung?.email ?? ""),
                  type: TextInputType.number,
                  enabled: false,
                ),
                const SizedBox(height: 25),
                TextFielWidget(
                  title: "Số điện thoại",
                  controller: TextEditingController(
                      text: categoryModel.nguoiDung?.sdt ?? ""),
                  type: TextInputType.number,
                  enabled: false,
                ),
                const SizedBox(height: 25),
                TextFielWidget(
                  title: "Lớp học",
                  controller: TextEditingController(
                      text: categoryModel.nguoiDung?.lopHoc ?? ""),
                  type: TextInputType.number,
                  enabled: false,
                ),
                const SizedBox(height: 25),
                TextFielWidget(
                  title: "Hệ học",
                  controller: TextEditingController(
                      text: categoryModel.nguoiDung?.heHoc ?? ""),
                  type: TextInputType.number,
                  enabled: false,
                ),
                const SizedBox(height: 25),
                TextFielWidget(
                  title: "Ngành",
                  controller: TextEditingController(
                      text: categoryModel.nguoiDung?.nganhHoc ?? ""),
                  type: TextInputType.number,
                  enabled: false,
                ),
                const SizedBox(height: 25),
                TextFielWidget(
                  title: "Ngày gửi",
                  controller: TextEditingController(
                      text: DateFormat("HH:mm dd/MM/yyyy").format(
                          DateTime.parse(categoryModel.createdDate ?? "")
                              .toLocal())),
                  type: TextInputType.number,
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
                  controller: lyDo,
                  minLines: 5,
                  enabled: false,
                ),
                const SizedBox(height: 25),
                const Text(
                  "Trạng thái",
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
                            items: listStatusCategoryAdd.entries
                                .map((item) => DropdownMenuItem<int>(
                                    value: item.key, child: Text(item.value)))
                                .toList(),
                            value: categoryModel.status,
                            onChanged: (value) {
                              setState(() {
                                categoryModel.status = value;
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
                      Text(categoryModel.attachmenAdmin ?? ""),
                      InkWell(
                          onTap: () async {
                            var fileName = await handleUploadFileAll();
                            setState(() {
                              categoryModel.attachmenAdmin = fileName;
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
                  title: 'Phản hồi',
                  controller: phanHoi,
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
                            categoryModel.phanHoi = phanHoi.text;
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
                            "Cập nhật",
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
