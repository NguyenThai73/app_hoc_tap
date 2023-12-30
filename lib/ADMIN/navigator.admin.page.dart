// ignore_for_file: prefer_const_constructors

import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:fe/ADMIN/category/category.admin.page.dart';
import 'package:fe/ADMIN/course/course.admin.page.dart';
import 'package:fe/constant/shared.preferences.dart';
import 'package:fe/constant/will.pop.scope.dart';
import 'package:fe/modules/profile/profile.page.dart';
import 'package:flutter/material.dart';

import 'employer/employer.page.dart';
import 'student/student.page.dart';

class NavigatorAdminPage extends StatefulWidget {
  const NavigatorAdminPage({super.key});

  @override
  State<NavigatorAdminPage> createState() => _NavigatorAdminPageState();
}

class _NavigatorAdminPageState extends State<NavigatorAdminPage> {
  int idSv = 0;
  getData() async {
    var idSV = await MySP.getIdSV();
    setState(() {
      idSv = idSV;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  int visit = 0;
  @override
  Widget build(BuildContext context) {
    return WillPS(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: (visit == 4)
            ? ProfilePage()
            : (visit == 3)
                ? EmployerPage()
                : (visit == 2)
                    ? StudentPage()
                    : (visit == 1)
                        ? CourseAdminPage()
                        : CategoryAdminPage(),
        bottomNavigationBar: SizedBox(
          height: 90,
          child: BottomBarFloating(
            items: items,
            iconSize: 30,
            backgroundColor: const Color(0xFFE1EDFF),
            color: const Color.fromARGB(255, 79, 79, 79),
            colorSelected: Colors.blue,
            indexSelected: visit,
            paddingVertical: 10,
            onTap: (int index) => setState(() {
              visit = index;
            }),
          ),
        ),
      ),
    );
  }
}

const List<TabItem> items = [
  TabItem(
    icon: Icons.mail,
    title: 'Hòm thư',
  ),
  TabItem(
    icon: Icons.design_services,
    title: 'Khoá học',
  ),
  TabItem(
    icon: Icons.school,
    title: 'Sinh viên',
  ),
  TabItem(
    icon: Icons.apartment,
    title: 'Doanh nghiệp',
  ),
  TabItem(
    icon: Icons.person,
    title: 'Tài khoản',
  ),
];
