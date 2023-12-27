// ignore_for_file: prefer_const_constructors

import 'package:fe/constant/toast.dart';
import 'package:fe/model/category.model.dart';
import 'package:fe/modules/academic_score/academic.score.page.dart';
import 'package:fe/modules/category/add.category.page.dart';
import 'package:fe/modules/category/list.category.dart';
import 'package:fe/modules/discipline_grade/discipline.grade.page.dart';
import 'package:fe/modules/timetable/timetable.page.dart';
import 'package:fe/provider/category.provider.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<CategoryModel> listChoXacNhan = [];
  List<CategoryModel> listDaTiepNhan = [];
  List<CategoryModel> listDaXuLy = [];
  getData() async {
    var listCXN = await CategoryProvider.getListForStatus(0);
    var listDTN = await CategoryProvider.getListForStatus(1);
    var listDXL = await CategoryProvider.getListForStatus(2);

    setState(() {
      listChoXacNhan = listCXN;
      listDaTiepNhan = listDTN;
      listDaXuLy = listDXL;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
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
        title: const Center(
          child: Text(
            "Danh Mục Hỗ Trợ",
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
        decoration: const BoxDecoration(color: Color(0xFFe7f5ff)),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 5, left: 20, right: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => ListCatogoryPage(
                              listCategoryModel: listChoXacNhan,
                              title: "Chờ Xác Nhận",
                            ),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            width: 50,
                            height: 40,
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  width: 50,
                                  height: 50,
                                  child: Image.asset(
                                    "assets/tn.png",
                                  ),
                                ),
                                listChoXacNhan.isNotEmpty
                                    ? Container(
                                        width: 17,
                                        height: 17,
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                          child: FittedBox(
                                              child: Text(
                                            "${listChoXacNhan.length}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          )),
                                        ),
                                      )
                                    : Container()
                              ],
                            ),
                          ),
                          const Text(
                            "Chờ Xác Nhận",
                            style: TextStyle(
                                color: Color(0xFF091E8E),
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 25),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => ListCatogoryPage(
                              listCategoryModel: listDaTiepNhan,
                              title: "Đã tiếp nhận",
                            ),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            width: 50,
                            height: 40,
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  width: 50,
                                  height: 50,
                                  child: Image.asset(
                                    "assets/tnn.png",
                                  ),
                                ),
                                listDaTiepNhan.isNotEmpty
                                    ? Container(
                                        width: 17,
                                        height: 17,
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                          child: FittedBox(
                                              child: Text(
                                            "${listDaTiepNhan.length}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          )),
                                        ),
                                      )
                                    : Container()
                              ],
                            ),
                          ),
                          const Text(
                            "Đã tiếp nhận",
                            style: TextStyle(
                                color: Color(0xFF091E8E),
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => ListCatogoryPage(
                              listCategoryModel: listDaXuLy,
                              title: "Đã xử lý",
                            ),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            width: 50,
                            height: 40,
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  width: 50,
                                  height: 50,
                                  child: Image.asset(
                                    "assets/xn.png",
                                  ),
                                ),
                                listDaXuLy.isNotEmpty
                                    ? Container(
                                        width: 17,
                                        height: 17,
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                          child: FittedBox(
                                              child: Text(
                                            "${listDaXuLy.length}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          )),
                                        ),
                                      )
                                    : Container()
                              ],
                            ),
                          ),
                          const Text(
                            "Đã xử lý",
                            style: TextStyle(
                                color: Color(0xFF091E8E),
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 25, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                showToast(
                                  context: context,
                                  msg: "Phát triển sau",
                                  color: Color.fromARGB(255, 221, 221, 221),
                                  icon: const Icon(Icons.info),
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 120,
                                    width: 135,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: EdgeInsets.all(15),
                                    child: Center(
                                        child: Image.asset(
                                      "assets/chatbot.png",
                                      fit: BoxFit.fill,
                                    )),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "ChatBot Hỗ Trợ",
                                    style: TextStyle(
                                        color: Color(0xFF1E3684),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push<void>(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        const TimeTablePage(),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 120,
                                    width: 135,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: EdgeInsets.all(15),
                                    child: Center(
                                        child: Image.asset(
                                      "assets/tkb.png",
                                      fit: BoxFit.fill,
                                    )),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Thời khóa biểu",
                                    style: TextStyle(
                                        color: Color(0xFF1E3684),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 15, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push<void>(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        const AcademicScorePage(),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 120,
                                    width: 135,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: EdgeInsets.all(15),
                                    child: Center(
                                        child: Image.asset(
                                      "assets/dht.png",
                                      fit: BoxFit.fill,
                                    )),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Điểm Học Tập",
                                    style: TextStyle(
                                        color: Color(0xFF1E3684),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                //
                                Navigator.push<void>(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        const DisciplineGradePage(),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 120,
                                    width: 135,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: EdgeInsets.all(15),
                                    child: Center(
                                        child: Image.asset(
                                      "assets/drl.png",
                                      fit: BoxFit.fill,
                                    )),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Điểm rèn Luyện",
                                    style: TextStyle(
                                        color: Color(0xFF1E3684),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 15, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () async {
                                var data = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const AddCategoryPage(
                                      type: 1,
                                    ),
                                  ),
                                );
                                if (data != null) {
                                  setState(() {
                                    listChoXacNhan.add(data);
                                  });
                                }
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 120,
                                    width: 135,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: EdgeInsets.all(15),
                                    child: Center(
                                        child: Image.asset(
                                      "assets/vayvon.png",
                                      fit: BoxFit.fill,
                                    )),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Vay vốn sinh viên",
                                    style: TextStyle(
                                        color: Color(0xFF1E3684),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                var data = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const AddCategoryPage(
                                      type: 2,
                                    ),
                                  ),
                                );
                                if (data != null) {
                                  setState(() {
                                    listChoXacNhan.add(data);
                                  });
                                }
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 120,
                                    width: 135,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: EdgeInsets.all(15),
                                    child: Center(
                                        child: Image.asset(
                                      "assets/dxclt.png",
                                      fit: BoxFit.fill,
                                    )),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Đơn xin cấp lại thẻ",
                                    style: TextStyle(
                                        color: Color(0xFF1E3684),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 15, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () async {
                                var data = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const AddCategoryPage(
                                      type: 3,
                                    ),
                                  ),
                                );
                                if (data != null) {
                                  setState(() {
                                    listChoXacNhan.add(data);
                                  });
                                }
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 120,
                                    width: 135,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: EdgeInsets.all(15),
                                    child: Center(
                                        child: Image.asset(
                                      "assets/file.png",
                                      fit: BoxFit.fill,
                                    )),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Đơn Xin Bảo Lưu",
                                    style: TextStyle(
                                        color: Color(0xFF1E3684),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                var data = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const AddCategoryPage(
                                      type: 4,
                                    ),
                                  ),
                                );
                                if (data != null) {
                                  setState(() {
                                    listChoXacNhan.add(data);
                                  });
                                }
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 120,
                                    width: 135,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: EdgeInsets.all(15),
                                    child: Center(
                                        child: Image.asset(
                                      "assets/gtt.png",
                                      fit: BoxFit.fill,
                                    )),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Giấy Giới Thiệu",
                                    style: TextStyle(
                                        color: Color(0xFF1E3684),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 15, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () async {
                                var data = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const AddCategoryPage(
                                      type: 5,
                                    ),
                                  ),
                                );
                                if (data != null) {
                                  setState(() {
                                    listChoXacNhan.add(data);
                                  });
                                }
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 120,
                                    width: 135,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: EdgeInsets.all(15),
                                    child: Center(
                                        child: Image.asset(
                                      "assets/phuckhao.png",
                                      fit: BoxFit.fill,
                                    )),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Đăng Ký Phúc Khảo",
                                    style: TextStyle(
                                        color: Color(0xFF1E3684),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                var data = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const AddCategoryPage(
                                      type: 6,
                                    ),
                                  ),
                                );
                                if (data != null) {
                                  setState(() {
                                    listChoXacNhan.add(data);
                                  });
                                }
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 120,
                                    width: 135,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: EdgeInsets.all(15),
                                    child: Center(
                                        child: Image.asset(
                                      "assets/lvb.png",
                                      fit: BoxFit.fill,
                                    )),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Giấy xác nhận",
                                    style: TextStyle(
                                        color: Color(0xFF1E3684),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
