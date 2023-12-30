// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fe/constant/avatar.dart';
import 'package:fe/constant/shared.preferences.dart';
import 'package:fe/model/user.model.dart';
import 'package:fe/modules/profile/change.password.dart';
import 'package:fe/modules/profile/infor.app.dart';
import 'package:fe/modules/profile/policy.page.dart';
import 'package:fe/modules/splash/splash.page.dart';
import 'package:fe/provider/base.url.dart';
import 'package:fe/provider/nguoi.dung.provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'edit.profile.employer.dart';
import 'edit.profile.student.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserModel user = UserModel();
  getData() async {
    var idSV = await MySP.getIdSV();
    var userGet = await NguoiDungProvider.getUserById(id: idSV.toString());
    setState(() {
      user = userGet;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF5adce4), Color(0xFF014dae)],
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 80,
            child: Container(
              margin: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: Image.asset("assets/logo.png", fit: BoxFit.contain),
                  ),
                  const SizedBox(width: 10),
                  const SizedBox(
                    child: Text(
                      "Tài khoản",
                      style: TextStyle(
                        letterSpacing: 1.6,
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(color: Colors.white),
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: ClipOval(
                        child: (user.avatar != null && user.avatar != "")
                            ? CachedNetworkImage(
                                imageUrl: "$baseUrl/api/files/${user.avatar!}",
                                fit: BoxFit.cover,
                              )
                            : Image.asset("assets/no_avatar.jpeg",
                                fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      user.fullName ?? "",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      user.email ?? "",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: Color(0xFFededed)),
                      padding: EdgeInsets.only(left: 20),
                      child: Center(
                          child: Row(
                        children: [
                          Text(
                            "Cài đặt chung",
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        ],
                      )),
                    ),
                    if (user.role != 0)
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        child: InkWell(
                          onTap: () async {
                            if (user.role == 2) {
                              //
                              var data = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      EditProfileStudentPage(
                                    sinhvien: user,
                                  ),
                                ),
                              );
                              if (data != null && data is UserModel) {
                                setState(() {
                                  user = data;
                                });
                              }
                            }
                            if (user.role == 1) {
                              //
                              var data = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      EditProfileEmployerPage(
                                    employer: user,
                                  ),
                                ),
                              );
                              if (data != null && data is UserModel) {
                                setState(() {
                                  user = data;
                                });
                              }
                            }
                          },
                          child: Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.manage_accounts, size: 40),
                                SizedBox(width: 10),
                                Container(
                                  padding: EdgeInsets.only(top: 7),
                                  child: Text(
                                    "Chỉnh Sửa Thông Tin",
                                    style: TextStyle(
                                        fontSize: 18, color: Color(0xFF907E7E)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push<void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const ChangePasswordPage(),
                            ),
                          );
                        },
                        child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.key, size: 40),
                              SizedBox(width: 10),
                              Container(
                                padding: EdgeInsets.only(top: 7),
                                child: Text(
                                  "Đổi Mật Khẩu",
                                  style: TextStyle(
                                      fontSize: 18, color: Color(0xFF907E7E)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push<void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const InforApp(),
                            ),
                          );
                        },
                        child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.info, size: 40),
                              SizedBox(width: 10),
                              Container(
                                padding: EdgeInsets.only(top: 7),
                                child: Text(
                                  "Thông tin ứng dụng",
                                  style: TextStyle(
                                      fontSize: 18, color: Color(0xFF907E7E)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: Color(0xFFededed)),
                      padding: EdgeInsets.only(left: 20),
                      child: Center(
                          child: Row(
                        children: [
                          Text(
                            "Thông Tin",
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        ],
                      )),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push<void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const PolicyPage(),
                            ),
                          );
                        },
                        child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.description, size: 40),
                              SizedBox(width: 10),
                              Container(
                                padding: EdgeInsets.only(top: 7),
                                child: Text(
                                  "Điều Khoản Và Điều Kiện",
                                  style: TextStyle(
                                      fontSize: 18, color: Color(0xFF907E7E)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      child: InkWell(
                        onTap: () {},
                        child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.share, size: 40),
                              SizedBox(width: 10),
                              Container(
                                padding: EdgeInsets.only(top: 7),
                                child: Text(
                                  "Chia Sẻ Ứng Dụng",
                                  style: TextStyle(
                                      fontSize: 18, color: Color(0xFF907E7E)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      child: InkWell(
                        onTap: () async {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.clear();
                          // ignore: use_build_context_synchronously
                          Navigator.push<void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => SplashPage(),
                            ),
                          );
                        },
                        child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.logout, size: 40),
                              SizedBox(width: 10),
                              Container(
                                padding: EdgeInsets.only(top: 7),
                                child: Text(
                                  "Đăng Xuất ",
                                  style: TextStyle(
                                      fontSize: 18, color: Color(0xFF907E7E)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
