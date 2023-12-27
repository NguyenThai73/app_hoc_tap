// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:fe/constant/border_textfield.dart';
import 'package:fe/constant/no.focus.scope.dart';
import 'package:fe/constant/toast.dart';
import 'package:fe/model/user.model.dart';
import 'package:fe/provider/base.url.dart';
import 'package:fe/provider/nguoi.dung.provider.dart';
import 'package:flutter/material.dart';

class EditEmployerPage extends StatefulWidget {
  final UserModel employer;
  const EditEmployerPage({super.key, required this.employer});

  @override
  State<EditEmployerPage> createState() => _EditEmployerPageState();
}

class _EditEmployerPageState extends State<EditEmployerPage> {
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
            "Cập nhật doanh nghiệp",
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
                IconButton(
                    onPressed: () async {
                      var imagePath = await handleUploadAvater();
                      if (imagePath != null && imagePath != "") {
                        setState(() {
                          avatar = imagePath;
                        });
                      }
                    },
                    icon: const Icon(
                      Icons.photo_camera,
                      color: Color(0xFF0723B8),
                      size: 30,
                    )),
                BorderTextField(
                  controller: name,
                  title: "Tên công ty",
                  placeholder: '',
                  onChangeText: (value) {},
                ),
                const SizedBox(height: 10),
                BorderTextField(
                  controller: email,
                  title: "Email",
                  placeholder: '',
                  onChangeText: (value) {},
                ),
                const SizedBox(height: 10),
                BorderTextField(
                  controller: sdt,
                  title: "Số điện thoại",
                  placeholder: '',
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
                ),
                const SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(10),
                  height: 40,
                  width: 150,
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
                      employer.fullName = name.text;
                      employer.email = email.text;
                      employer.sdt = sdt.text;
                      employer.address = diachi.text;
                      employer.avatar = avatar;
                      if (email.text.isEmpty ||
                          sdt.text.isEmpty ||
                          diachi.text.isEmpty ||
                          name.text.isEmpty) {
                        showToast(
                          context: context,
                          msg: "Cần điền đầy đủ thông tin",
                          color: const Color.fromARGB(255, 255, 179, 86),
                          icon: const Icon(Icons.info),
                        );
                      } else {
                        var checkRegister =
                            await NguoiDungProvider.sua(employer);
                        if (checkRegister) {
                          showToast(
                            context: context,
                            msg: "Cập nhật doanh nghiệp thành công",
                            color: Color.fromARGB(255, 94, 255, 86),
                            icon: const Icon(Icons.done),
                          );
                          Navigator.pop(context, employer);
                        } else {
                          showToast(
                            context: context,
                            msg: "Cập nhật không thành công",
                            color: const Color.fromARGB(255, 255, 179, 86),
                            icon: const Icon(Icons.info),
                          );
                        }
                      }
                    },
                    child: Center(
                      child: Text(
                        "Cập nhật",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
