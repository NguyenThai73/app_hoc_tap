// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:fe/constant/border_textfield.dart';
import 'package:fe/constant/no.focus.scope.dart';
import 'package:fe/model/user.model.dart';
import 'package:fe/provider/base.url.dart';
import 'package:flutter/material.dart';

class ViewEmployerPage extends StatefulWidget {
  final UserModel employer;
  const ViewEmployerPage({super.key, required this.employer});

  @override
  State<ViewEmployerPage> createState() => _ViewEmployerPageState();
}

class _ViewEmployerPageState extends State<ViewEmployerPage> {
  UserModel employer = UserModel(status: 1, role: 1);
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController sdt = TextEditingController();
  TextEditingController diachi = TextEditingController();
  String? avatar;
  @override
  void initState() {
    super.initState();
    employer = widget.employer.copyWith();
    name.text = employer.fullName ?? "";
    email.text = employer.email ?? "";
    sdt.text = employer.sdt ?? "";
    diachi.text = employer.address ?? "";
    avatar = employer.avatar;
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
            "Thông tin doanh nghiệp",
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
      body: NoFocusScope(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(15),
          decoration: const BoxDecoration(color: Color(0xFFe7f5ff)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30),
                SizedBox(
                  width: 130,
                  height: 130,
                  child: ClipOval(
                    child: (avatar != null)
                        ? Image.network(
                            "$baseUrl/api/files/${avatar ?? ""}",
                            fit: BoxFit.cover,
                          )
                        : Image.asset("assets/logoc.jpeg", fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(height: 10),
                BorderTextField(
                  controller: name,
                  title: "Tên công ty",
                  placeholder: '',
                  enabled: false,
                  onChangeText: (value) {},
                ),
                const SizedBox(height: 10),
                BorderTextField(
                  controller: email,
                  title: "Email",
                  placeholder: '',
                  enabled: false,
                  onChangeText: (value) {},
                ),
                const SizedBox(height: 10),
                BorderTextField(
                  controller: sdt,
                  title: "Số điện thoại",
                  placeholder: '',
                  enabled: false,
                  typeKey: TextInputType.phone,
                  onChangeText: (value) {},
                  maxLines: 1,
                ),
                const SizedBox(height: 10),
                BorderTextField(
                  controller: diachi,
                  title: "Địa chỉ",
                  placeholder: '',
                  onChangeText: (value) {},
                  minLine: 2,
                  maxLines: 10,
                  enabled: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
