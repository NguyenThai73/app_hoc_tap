// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, must_be_immutable

import 'package:animation_list/animation_list.dart';
import 'package:fe/constant/my.dialog.dart';
import 'package:fe/constant/no.focus.scope.dart';
import 'package:fe/model/user.model.dart';
import 'package:fe/provider/base.url.dart';
import 'package:fe/provider/nguoi.dung.provider.dart';
import 'package:flutter/material.dart';

import 'create.student.dart';
import 'edit.student.dart';
import 'view.student.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  List<UserModel> listData = [];
  TextEditingController find = TextEditingController();
  String? name;
  getData() async {
    var listDataNew = await NguoiDungProvider.getList(role: 2, name: name);
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
        resizeToAvoidBottomInset:false,
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
                        "Quản lý sinh viên",
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
          decoration: BoxDecoration(
          ),
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            onChanged: (value) async {
                              setState(() {
                                name = value;
                              });
                              getData();
                            },
                            controller: find,
                            maxLines: 1,
                            decoration: const InputDecoration(
                                hintText: "Tìm kiếm",
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
                                    name = null;
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
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: const <Color>[
                            Color(0xFF5adce4),
                            Color(0xFF014dae)
                          ]),
                    ),
                    child: InkWell(
                      onTap: () async {
                        var data = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const CreateStudentPage(),
                          ),
                        );
                        if (data != null && data == true) {
                          getData();
                        }
                      },
                      child: Center(
                        child: Text(
                          "Thêm mới",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                  child: AnimationList(
                children: listData
                    .map((element) => EmploerItem(
                        element: element,
                        callback: (value) {
                          if (value != null) {
                            getData();
                          }
                        }))
                    .toList(),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class EmploerItem extends StatefulWidget {
  UserModel element;
  Function callback;
  EmploerItem({super.key, required this.element, required this.callback});

  @override
  State<EmploerItem> createState() => _EmploerItemState();
}

class _EmploerItemState extends State<EmploerItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: const Color(0xFFe7f5ff),
          borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          Navigator.push<void>(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => ViewStudentPage(
                sinhvien: widget.element,
              ),
            ),
          );
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
                        (widget.element.avatar != null &&
                                widget.element.avatar != "")
                            ? "$baseUrl/api/files/${widget.element.avatar!}"
                            : "https://firebasestorage.googleapis.com/v0/b/appsinhvien-924e4.appspot.com/o/no_avatar.jpeg?alt=media",
                      ),
                      fit: BoxFit.cover)),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.element.fullName ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    widget.element.email ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF907E7E)),
                  ),
                  Text(
                    widget.element.sdt ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF907E7E)),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Column(
              children: [
                InkWell(
                  onTap: () async {
                    var data = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => EditStudentPage(
                          sinhvien: widget.element,
                        ),
                      ),
                    );
                    if (data != null && data is UserModel) {
                      setState(() {
                        widget.element = data;
                      });
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Center(
                                        child: Text(
                                          "Huỷ",
                                          style: TextStyle(color: Colors.white),
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
                                            BorderRadius.circular(20)),
                                    child: InkWell(
                                      onTap: () async {
                                        var dataA = await NguoiDungProvider.xoa(
                                            idUSer: widget.element.id ?? 0);
                                        Navigator.pop(context, dataA);
                                      },
                                      child: Center(
                                        child: Text(
                                          "Xoá",
                                          style: TextStyle(color: Colors.white),
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
                      widget.callback(true);
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
    );
  }
}
