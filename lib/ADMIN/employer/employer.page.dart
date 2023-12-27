// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, must_be_immutable

import 'package:animation_list/animation_list.dart';
import 'package:fe/model/user.model.dart';
import 'package:fe/provider/base.url.dart';
import 'package:fe/provider/nguoi.dung.provider.dart';
import 'package:flutter/material.dart';

import 'create.employer.dart';
import 'edit.employer.dart';

class EmployerPage extends StatefulWidget {
  const EmployerPage({super.key});

  @override
  State<EmployerPage> createState() => _EmployerPageState();
}

class _EmployerPageState extends State<EmployerPage> {
  List<UserModel> listData = [];
  TextEditingController find = TextEditingController();
  getData() async {
    var listDataNew = await NguoiDungProvider.getList(role: 1);
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
    return Scaffold(
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
                    child: Image.asset("assets/logo.png", fit: BoxFit.contain),
                  ),
                  const SizedBox(width: 10),
                  const SizedBox(
                    child: Text(
                      "Quản lý doanh nghiệp",
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
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
                            // var listDataGetFind =
                            //     await DocumentProvider.getList(value);
                            // setState(() {
                            //   listData = listDataGetFind;
                            // });
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
                              });
                            }
                          },
                          child: Icon(
                              find.text.isEmpty ? Icons.search : Icons.close)),
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
                              const CreateEmployerPage(),
                        ),
                      );
                      if (data != null && data is UserModel) {
                        setState(() {
                          listData.insert(0, data);
                        });
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
                      ))
                  .toList(),
            ))
          ],
        ),
      ),
    );
  }
}

class EmploerItem extends StatefulWidget {
  UserModel element;
  EmploerItem({super.key, required this.element});

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
          // Navigator.push<void>(
          //   context,
          //   MaterialPageRoute<void>(
          //     builder: (BuildContext context) => DetailCourse(
          //       courseModel: element,
          //     ),
          //   ),
          // );
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
                        (widget.element.avatar != null)
                            ? "$baseUrl/api/files/${widget.element.avatar!}"
                            : "https://firebasestorage.googleapis.com/v0/b/appsinhvien-924e4.appspot.com/o/logoc.jpeg?alt=media",
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
                  onTap: () {},
                  child: Icon(
                    Icons.visibility,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: () async {
                    var data = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => EditEmployerPage(
                          employer: widget.element,
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
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
