// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:fe/constant/date-pick-time.dart';
import 'package:fe/constant/no.focus.scope.dart';
import 'package:fe/constant/radio.select.dart';
import 'package:fe/constant/text.field.component.dart';
import 'package:fe/constant/toast.dart';
import 'package:fe/model/user.model.dart';
import 'package:fe/provider/base.url.dart';
import 'package:fe/provider/nguoi.dung.provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditStudentPage extends StatefulWidget {
  final UserModel sinhvien;
  const EditStudentPage({super.key, required this.sinhvien});

  @override
  State<EditStudentPage> createState() => _EditStudentPageState();
}

class _EditStudentPageState extends State<EditStudentPage> {
  UserModel singvien = UserModel(status: 0, role: 2, gioiTinh: false);
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController sdt = TextEditingController();
  TextEditingController lopHoc = TextEditingController();
  TextEditingController heHoc = TextEditingController();
  TextEditingController nganhHoc = TextEditingController();
  String? ngaySinh;
  String? avatar;
  @override
  void initState() {
    super.initState();
    singvien = widget.sinhvien.copyWith();
    avatar = singvien.avatar;
    email.text = singvien.email ?? "";
    name.text = singvien.fullName ?? "";
    address.text = singvien.address ?? "";
    sdt.text = singvien.sdt ?? "";
    lopHoc.text = singvien.lopHoc ?? "";
    heHoc.text = singvien.heHoc ?? "";
    nganhHoc.text = singvien.nganhHoc ?? "";
    ngaySinh = (singvien.ngaySinh != null)
        ? DateFormat('dd-MM-yyyy').format(DateTime.parse(singvien.ngaySinh!).toLocal())
        : null;
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
            "Cập nhật sinh viên",
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            NoFocusScope(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      SizedBox(
                        width: 130,
                        height: 130,
                        child: ClipOval(
                          child: (avatar != null && avatar != "")
                              ? Image.network(
                                  "$baseUrl/api/files/${avatar ?? ""}",
                                  fit: BoxFit.cover,
                                )
                              : Image.asset("assets/no_avatar.jpeg"),
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
                          icon: Icon(
                            Icons.photo_camera,
                            color: const Color(0xFF0723B8),
                            size: 30,
                          )),
                      SizedBox(height: 10),
                      TextFielComponent(
                        controller: email,
                        iconData: Icons.email,
                        enabled: false,
                        hintText: "Email",
                      ),
                      const SizedBox(height: 20),
                      TextFielComponent(
                        controller: name,
                        iconData: Icons.person,
                        hintText: "Họ tên",
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: DatePickerBox1(
                            isTime: false,
                            label: 'Ngày sinh',
                            dateDisplay: ngaySinh,
                            selectedDateFunction: (day) {
                              ngaySinh = day;
                            }),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Giới tính",
                              style: TextStyle(
                                  color: Color(0xFF0723B8),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            RadioSelect(
                              title: 'Nam',
                              onTap: () {
                                setState(() {
                                  singvien.gioiTinh = false;
                                });
                              },
                              isSelected: singvien.gioiTinh == false,
                            ),
                            RadioSelect(
                              title: 'Nữ',
                              onTap: () {
                                setState(() {
                                  singvien.gioiTinh = true;
                                });
                              },
                              isSelected: singvien.gioiTinh == true,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFielComponent(
                        controller: sdt,
                        iconData: Icons.phone,
                        hintText: "Số điện thoại",
                      ),
                      const SizedBox(height: 20),
                      TextFielComponent(
                        controller: address,
                        iconData: Icons.location_on,
                        hintText: "Địa chỉ",
                      ),
                      const SizedBox(height: 20),
                      TextFielComponent(
                        controller: lopHoc,
                        iconData: Icons.school,
                        hintText: "Lớp học",
                      ),
                      const SizedBox(height: 20),
                      TextFielComponent(
                        controller: nganhHoc,
                        iconData: Icons.history_edu,
                        hintText: "Ngành học",
                      ),
                      const SizedBox(height: 20),
                      TextFielComponent(
                        controller: heHoc,
                        iconData: Icons.square_foot,
                        hintText: "Hệ học",
                      ),
                      InkWell(
                        onTap: () async {
                          if (email.text.isEmpty ||
                              name.text.isEmpty ||
                              sdt.text.isEmpty ||
                              address.text.isEmpty ||
                              lopHoc.text.isEmpty ||
                              heHoc.text.isEmpty ||
                              nganhHoc.text.isEmpty ||
                              ngaySinh == null) {
                            showToast(
                              context: context,
                              msg: "Nhập đủ thông tin",
                              color: const Color.fromARGB(255, 255, 179, 86),
                              icon: const Icon(Icons.info),
                            );
                          } else {
                            singvien.email = email.text;
                            singvien.fullName = name.text;
                            singvien.sdt = sdt.text;
                            singvien.address = address.text;
                            singvien.lopHoc = lopHoc.text;
                            singvien.heHoc = heHoc.text;
                            singvien.nganhHoc = nganhHoc.text;
                            singvien.ngaySinh =
                                convertTimeStamp(ngaySinh!, "00:00:00");
                            singvien.avatar = avatar;
                            var checkRegister =
                                await NguoiDungProvider.sua(singvien);
                            if (checkRegister) {
                              showToast(
                                context: context,
                                msg: "Cập nhật thành công",
                                color: Color.fromARGB(255, 94, 255, 86),
                                icon: const Icon(Icons.done),
                              );
                              Navigator.pop(context, singvien);
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
                        child: Container(
                          margin: const EdgeInsets.only(top: 30, bottom: 10),
                          height: 40,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xFF5266D4),
                          ),
                          child: const Center(
                            child: Text(
                              "Cập nhật",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ),
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
