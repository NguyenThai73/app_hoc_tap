// ignore_for_file: prefer_const_constructors

import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:fe/constant/shared.preferences.dart';
import 'package:fe/constant/will.pop.scope.dart';
import 'package:fe/modules/course/course.page.dart';
import 'package:fe/modules/forum/forum.page.dart';
import 'package:fe/modules/home/home.page.dart';
import 'package:fe/modules/profile/profile.page.dart';
import 'package:flutter/material.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({super.key});

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
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
        body: (visit == 0)
            ? HomePage(
                callBack: (valueNew) {
                  setState(() {
                    visit = valueNew;
                  });
                },
              )
            : (visit == 1)
                ? CoursePage()
                : (visit == 2)
                    ? ForumPage(idSv:idSv)
                    : ProfilePage(),
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
    icon: Icons.home,
    title: 'Trang chủ',
  ),
  TabItem(
    icon: Icons.design_services,
    title: 'Khoá học',
  ),
  TabItem(
    icon: Icons.chat,
    title: 'Diễn đàn',
  ),
  TabItem(
    icon: Icons.person,
    title: 'Tài khoản',
  ),
];
