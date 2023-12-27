import 'package:fe/constant/map.data.dart';
import 'package:fe/model/category.model.dart';
import 'package:fe/modules/category/view.catogory.page.dart';
import 'package:flutter/material.dart';
import 'package:animation_list/animation_list.dart';
import 'package:intl/intl.dart';

Map<int, String> listHocKy = {
  1: "Học kỳ 1",
  2: "Học kỳ 2",
  3: "Học kỳ 3",
};

class ListCatogoryPage extends StatelessWidget {
  final List<CategoryModel> listCategoryModel;
  final String title;
  const ListCatogoryPage(
      {super.key, required this.listCategoryModel, required this.title});

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
            title,
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
          children: listCategoryModel
              .map((element) => InkWell(
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
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
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
                            color: const Color.fromARGB(255, 0, 0, 0)
                                .withOpacity(0.25),
                            spreadRadius: 5,
                            blurRadius: 8,
                            offset: const Offset(
                                3, 3), // changes position of shadow
                          ),
                        ],
                      ),
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
                              Text("Học kỳ: ${listHocKy[element.hocKy ?? 1]}"),
                            ],
                          ),
                          Text(
                            "Ngày gửi: ${DateFormat("HH:mm  dd/MM/yyyy").format(DateTime.parse(element.createdDate ?? "").toLocal())}",
                            style: const TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
