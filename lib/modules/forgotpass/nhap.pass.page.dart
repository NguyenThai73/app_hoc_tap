// ignore_for_file: use_build_context_synchronously

import 'package:fe/constant/border_textfield.dart';
import 'package:fe/constant/toast.dart';
import 'package:fe/model/user.model.dart';
import 'package:fe/modules/navigator/navigator.page.dart';
import 'package:fe/provider/nguoi.dung.provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PasswordForgotPage extends StatefulWidget {
  final UserModel userModel;
  const PasswordForgotPage({super.key, required this.userModel});

  @override
  State<PasswordForgotPage> createState() => _PasswordForgotPageState();
}

class _PasswordForgotPageState extends State<PasswordForgotPage> {
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
            "Nhập mật khẩu",
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
                    width: 120,
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
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setInt("role", 2);
                          prefs.setInt("id", widget.userModel.id ?? 0);
                          prefs.setString(
                              "avatar", widget.userModel.avatar ?? "");
                          prefs.setString(
                              "name", widget.userModel.fullName ?? "");
                          await NguoiDungProvider.changePassword(
                              idUSer: widget.userModel.id ?? 0,
                              newpass: passwordNewController.text);
                          Navigator.push<void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const NavigatorPage(),
                            ),
                          );
                        }
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Đổi mật khẩu",
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
