// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:fe/constant/map.data.dart';
import 'package:fe/constant/my.dialog.dart';
import 'package:fe/model/category.model.dart';
import 'package:fe/modules/category/view.catogory.page.dart';
import 'package:fe/provider/category.provider.dart';
import 'package:flutter/material.dart';
import "package:animation_list/animation_list.dart";
import 'package:intl/intl.dart';

import 'edit.category.page.dart';

Map<int, String> listHocKy = {
  1: "Học kỳ 1",
  2: "Học kỳ 2",
  3: "Học kỳ 3",
};

class ListCatogoryPage extends StatefulWidget {
   List<CategoryModel> listCategoryModel;
  final String title;
   ListCatogoryPage(
      {super.key, required this.listCategoryModel, required this.title});

  @override
  State<ListCatogoryPage> createState() => _ListCatogoryPageState();
}

class _ListCatogoryPageState extends State<ListCatogoryPage> {
  getData() async {
    if (widget.listCategoryModel.isNotEmpty) {
      var lisData = await CategoryProvider.getListForStatus(
          widget.listCategoryModel.first.status ?? 0);
      setState(() {
        widget.listCategoryModel = lisData;
      });
    }
  }

  @override
  void initState() {
    super.initState();

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
            widget.title,
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(10),
        child: AnimationList(
          children: [
            for (var element in widget.listCategoryModel)
              Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.only(
                    left: 20, right: 10, top: 5, bottom: 5),
                width: MediaQuery.of(context).size.width,
                // height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      width: 2,
                      color: const Color.fromARGB(255, 136, 136, 136)),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color:
                          const Color.fromARGB(255, 0, 0, 0).withOpacity(0.25),
                      spreadRadius: 5,
                      blurRadius: 8,
                      offset: const Offset(3, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    //
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => ViewCategoryPage(
                          categoryModel: element,
                        ),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              categoryType[element.type] ?? "",
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Năm học: ${element.namHoc}"),
                                Text(
                                    "Học kỳ: ${listHocKy[element.hocKy ?? 1]}"),
                              ],
                            ),
                            Text(
                              "Ngày gửi: ${DateFormat("HH:mm  dd/MM/yyyy").format(DateTime.parse(element.createdDate ?? "").toLocal())}",
                              style: const TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      if (element.status == 0)
                        Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                var data = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        EditCategoryPage(
                                      categoryModel: element,
                                    ),
                                  ),
                                );
                                if (data != null && data is CategoryModel) {
                                  getData();
                                }
                              },
                              child: Icon(
                                Icons.edit,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(height: 15),
                            InkWell(
                              onTap: () async {
                                var data = await showDialog(
                                  context: context,
                                  builder: (context) => MyDialog(
                                    onClickOutSide: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            "Xác nhận xoá",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(height: 20),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 40,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    color: Colors.orange,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Center(
                                                    child: Text(
                                                      "Huỷ",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 15),
                                              Container(
                                                height: 40,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    color: Colors.blue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: InkWell(
                                                  onTap: () async {
                                                    var dataA =
                                                        await CategoryProvider
                                                            .delete(element);
                                                    Navigator.pop(
                                                        context, dataA);
                                                  },
                                                  child: Center(
                                                    child: Text(
                                                      "Xoá",
                                                      style: TextStyle(
                                                          color: Colors.white),
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
                                if (data != null && data == true) {
                                  getData();
                                }
                              },
                              child: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        )
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
