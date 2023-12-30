// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, must_be_immutable

import 'package:animation_list/animation_list.dart';
import 'package:fe/constant/drop.down.dart';
import 'package:fe/constant/map.status.dart';
import 'package:fe/constant/no.focus.scope.dart';
import 'package:fe/model/category.model.dart';
import 'package:fe/provider/base.url.dart';
import 'package:fe/provider/category.provider.dart';
import 'package:flutter/material.dart';

import 'edit.category.admin.page.dart';

class CategoryAdminPage extends StatefulWidget {
  const CategoryAdminPage({super.key});

  @override
  State<CategoryAdminPage> createState() => _CategoryAdminPageState();
}

class _CategoryAdminPageState extends State<CategoryAdminPage> {
  List<CategoryModel> listData = [];
  TextEditingController find = TextEditingController();
  String? nam;
  int? type;
  int? status;
  bool openFilter = true;

  getData() async {
    var listDataNew =
        await CategoryProvider.getList(namHoc: nam, type: type, status: status);
    setState(() {
      listData = listDataNew;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return NoFocusScope(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: Container(),
          title: Container(
            padding:
                const EdgeInsets.only(left: 0, top: 20, right: 30, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child:
                          Image.asset("assets/logo.png", fit: BoxFit.contain),
                    ),
                    const SizedBox(width: 10),
                    const SizedBox(
                      child: Text(
                        "Hòm thư",
                        style: TextStyle(
                          letterSpacing: 1.6,
                          fontSize: 19,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
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
          decoration: BoxDecoration(),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 222, 240, 255),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: openFilter
                    ? Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 50,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 2),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    onChanged: (value) async {
                                      setState(() {
                                        nam = value;
                                      });
                                      getData();
                                    },
                                    controller: find,
                                    maxLines: 1,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                        hintText: "Tìm kiếm theo năm học",
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.only(
                                            bottom: 13, left: 10, right: 10)),
                                  ),
                                ),
                                InkWell(
                                    onTap: () {
                                      if (find.text.isNotEmpty) {
                                        setState(() {
                                          find.text = '';
                                          setState(() {
                                            nam = null;
                                          });
                                          getData();
                                        });
                                      }
                                    },
                                    child: Icon(find.text.isEmpty
                                        ? Icons.search
                                        : Icons.close)),
                                const SizedBox(width: 5),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: DropDownWidget(
                              listSelecet: listTypeCategory,
                              title: 'Danh mục',
                              noTitle: true,
                              selectedIndex: type,
                              onSelect: (value) {
                                setState(() {
                                  type = value;
                                });
                                getData();
                              },
                            ),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: DropDownWidget(
                              listSelecet: listStatusCategory,
                              title: 'Trạng thái',
                              noTitle: true,
                              selectedIndex: status,
                              onSelect: (value) {
                                setState(() {
                                  status = value;
                                });
                                getData();
                              },
                            ),
                          ),
                          SizedBox(height: 5),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  openFilter = false;
                                });
                              },
                              child: Icon(Icons.expand_less))
                        ],
                      )
                    : InkWell(
                        onTap: () {
                          setState(() {
                            openFilter = true;
                          });
                        },
                        child: Icon(Icons.keyboard_arrow_down)),
              ),
              Expanded(
                  child: AnimationList(
                children: listData
                    .map((element) => CategoryItemAdmin(
                          element: element,
                          callback: (value) {},
                        ))
                    .toList(),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryItemAdmin extends StatefulWidget {
  CategoryModel element;
  Function callback;
  CategoryItemAdmin({super.key, required this.element, required this.callback});

  @override
  State<CategoryItemAdmin> createState() => _CategoryItemAdminState();
}

class _CategoryItemAdminState extends State<CategoryItemAdmin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: (widget.element.status == 1)
              ? const Color(0xFFe7f5ff)
              : (widget.element.status == 0)
                  ? Color.fromARGB(255, 255, 219, 176)
                  : (widget.element.status == 2)
                      ? Color.fromARGB(255, 178, 255, 157)
                      : Color.fromARGB(255, 255, 194, 194),
          borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () async {
          var data = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => EditCategoryAdminPage(
                categoryModel: widget.element,
              ),
            ),
          );
          if (data != null && data is CategoryModel) {
            setState(() {
              widget.element = data;
            });
          }
        },
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(
                        (widget.element.nguoiDung?.avatar != null &&
                                widget.element.nguoiDung?.avatar != "")
                            ? "$baseUrl/api/files/${widget.element.nguoiDung?.avatar}"
                            : "https://firebasestorage.googleapis.com/v0/b/appsinhvien-924e4.appspot.com/o/no_avatar.jpeg?alt=media",
                      ),
                      fit: BoxFit.cover)),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    listTypeCategory[widget.element.type] ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    "${widget.element.nguoiDung?.fullName ?? ""} - ${widget.element.nguoiDung?.lopHoc ?? ""}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF907E7E)),
                  ),
                  Text(
                    "${listHocKy[widget.element.hocKy] ?? ""}   Năm học: ${widget.element.namHoc ?? ""}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF907E7E)),
                  ),
                ],
              ),
            ),
            // SizedBox(width: 10),
            // Column(
            //   children: [
            //     InkWell(
            //       onTap: () async {
            //         var data = await Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (BuildContext context) =>
            //                 EditCategoryAdminPage(
            //               categoryModel: widget.element,
            //             ),
            //           ),
            //         );
            //         if (data != null && data is CategoryModel) {
            //           setState(() {
            //             widget.element = data;
            //           });
            //         }
            //       },
            //       child: Icon(
            //         Icons.edit,
            //         color: Colors.blue,
            //       ),
            //     ),
            //     SizedBox(height: 15),
            //     InkWell(
            //       onTap: () async {
            //         // var data = await showDialog(
            //         //   context: context,
            //         //   builder: (context) => MyDialog(
            //         //     onClickOutSide: () {
            //         //       Navigator.pop(context);
            //         //     },
            //         //     child: Container(
            //         //       child: Column(
            //         //         children: [
            //         //           Text(
            //         //             "Xác nhận xoá",
            //         //             style: TextStyle(
            //         //                 color: Colors.black,
            //         //                 fontSize: 20,
            //         //                 fontWeight: FontWeight.w500),
            //         //           ),
            //         //           SizedBox(height: 20),
            //         //           Row(
            //         //             mainAxisAlignment: MainAxisAlignment.center,
            //         //             children: [
            //         //               Container(
            //         //                 height: 40,
            //         //                 width: 100,
            //         //                 decoration: BoxDecoration(
            //         //                     color: Colors.orange,
            //         //                     borderRadius:
            //         //                         BorderRadius.circular(20)),
            //         //                 child: InkWell(
            //         //                   onTap: () {
            //         //                     Navigator.pop(context);
            //         //                   },
            //         //                   child: Center(
            //         //                     child: Text(
            //         //                       "Huỷ",
            //         //                       style: TextStyle(color: Colors.white),
            //         //                     ),
            //         //                   ),
            //         //                 ),
            //         //               ),
            //         //               SizedBox(width: 15),
            //         //               Container(
            //         //                 height: 40,
            //         //                 width: 100,
            //         //                 decoration: BoxDecoration(
            //         //                     color: Colors.blue,
            //         //                     borderRadius:
            //         //                         BorderRadius.circular(20)),
            //         //                 child: InkWell(
            //         //                   onTap: () async {
            //         //                     var dataA = await CourseProvider.delete(
            //         //                         widget.element);
            //         //                     Navigator.pop(context, dataA);
            //         //                   },
            //         //                   child: Center(
            //         //                     child: Text(
            //         //                       "Xoá",
            //         //                       style: TextStyle(color: Colors.white),
            //         //                     ),
            //         //                   ),
            //         //                 ),
            //         //               ),
            //         //             ],
            //         //           )
            //         //         ],
            //         //       ),
            //         //     ),
            //         //   ),
            //         // );
            //         // if (data != null && data == true) {
            //         //   widget.callback(true);
            //         // }
            //       },
            //       child: Icon(
            //         Icons.delete,
            //         color: Colors.red,
            //       ),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
