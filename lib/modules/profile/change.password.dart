// ignore_for_file: use_build_context_synchronously

import 'package:fe/constant/border_textfield.dart';
import 'package:fe/constant/shared.preferences.dart';
import 'package:fe/constant/toast.dart';
import 'package:fe/provider/nguoi.dung.provider.dart';
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController passwordNewController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    passwordNewController.dispose();
    confirmPassController.dispose();

    super.dispose();
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
            "Đổi mật khẩu",
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
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BorderTextField(
                controller: passwordNewController,
                title: "Mật khẩu mới",
                placeholder: '',
                isPassword: true,
                onChangeText: (value) {},
                maxLines: 1,
              ),
              const SizedBox(height: 30),
              BorderTextField(
                controller: confirmPassController,
                title: "Nhập lại mật khẩu",
                placeholder: '',
                isPassword: true,
                 maxLines: 1,
                onChangeText: (value) {},
              ),
              const SizedBox(height: 45),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5)),
                    child: InkWell(
                      onTap: () async {
                        FocusScope.of(context).requestFocus(FocusNode());
                        if (passwordNewController.text.isEmpty ||
                            confirmPassController.text.isEmpty) {
                          showToast(
                            context: context,
                            msg: "Không được để trống",
                            color: Colors.orange,
                            icon: const Icon(Icons.warning),
                          );
                        } else if (passwordNewController.text !=
                            confirmPassController.text) {
                          showToast(
                            context: context,
                            msg: "Xác nhận mật khẩu không khớp",
                            color: Colors.orange,
                            icon: const Icon(Icons.warning),
                          );
                        } else {
                          var isUser = await MySP.getIdSV();
                          var response = await NguoiDungProvider.changePassword(
                              idUSer: isUser,
                              newpass: passwordNewController.text);
                          if (response) {
                            showToast(
                              context: context,
                              msg: "Thay đổi mật khẩu thành công",
                              color: const Color.fromARGB(255, 212, 255, 214),
                              icon: const Icon(Icons.done),
                            );
                            setState(() {
                              passwordNewController.text = "";
                              confirmPassController.text = "";
                            });
                          } else {
                            showToast(
                              context: context,
                              msg: "Có lỗi xảy ra",
                              color: Colors.orange,
                              icon: const Icon(Icons.warning),
                            );
                          }
                        }
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Cập nhật",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
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
  }
}
