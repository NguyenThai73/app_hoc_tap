// ignore_for_file: prefer_const_constructors, use_build_context_synchronously
import 'package:fe/constant/no.focus.scope.dart';
import 'package:fe/constant/radio.select.dart';
import 'package:fe/constant/text.field.component.dart';
import 'package:fe/model/user.model.dart';
import 'package:fe/provider/base.url.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ViewStudentPage extends StatefulWidget {
  final UserModel sinhvien;
  const ViewStudentPage({super.key, required this.sinhvien});

  @override
  State<ViewStudentPage> createState() => _ViewStudentPageState();
}

class _ViewStudentPageState extends State<ViewStudentPage> {
  UserModel singvien = UserModel(status: 0, role: 2, gioiTinh: false);
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController sdt = TextEditingController();
  TextEditingController lopHoc = TextEditingController();
  TextEditingController heHoc = TextEditingController();
  TextEditingController nganhHoc = TextEditingController();
  String? ngaySinh;
  String? ngayTao;
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
        ? DateFormat('dd-MM-yyyy')
            .format(DateTime.parse(singvien.ngaySinh!).toLocal())
        : null;
    ngayTao = (singvien.createdDate != null)
        ? DateFormat('dd-MM-yyyy')
            .format(DateTime.parse(singvien.createdDate!).toLocal())
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
                      const SizedBox(height: 20),
                      TextFielComponent(
                        controller: TextEditingController(text: ngayTao ?? ""),
                        iconData: Icons.calendar_month,
                        enabled: false,
                        hintText: 'Ngày tạo',
                      ),
                      SizedBox(height: 20),
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
                        enabled: false,
                        hintText: "Họ tên",
                      ),
                      const SizedBox(height: 20),
                      TextFielComponent(
                        controller: TextEditingController(text: ngaySinh ?? ""),
                        iconData: Icons.calendar_month,
                        enabled: false,
                        hintText: 'Ngày sinh',
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
                              onTap: () {},
                              isSelected: singvien.gioiTinh == false,
                            ),
                            RadioSelect(
                              title: 'Nữ',
                              onTap: () {},
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
                        enabled: false,
                      ),
                      const SizedBox(height: 20),
                      TextFielComponent(
                        controller: address,
                        iconData: Icons.location_on,
                        hintText: "Địa chỉ",
                        enabled: false,
                      ),
                      const SizedBox(height: 20),
                      TextFielComponent(
                        controller: lopHoc,
                        iconData: Icons.school,
                        enabled: false,
                        hintText: "Lớp học",
                      ),
                      const SizedBox(height: 20),
                      TextFielComponent(
                        controller: nganhHoc,
                        iconData: Icons.history_edu,
                        enabled: false,
                        hintText: "Ngành học",
                      ),
                      const SizedBox(height: 20),
                      TextFielComponent(
                        controller: heHoc,
                        iconData: Icons.square_foot,
                        enabled: false,
                        hintText: "Hệ học",
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
