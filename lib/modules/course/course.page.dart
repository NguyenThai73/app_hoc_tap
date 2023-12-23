// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fe/constant/avatar.dart';
import 'package:fe/constant/no.focus.scope.dart';
import 'package:fe/model/course.model.dart';
import 'package:flutter/material.dart';

import 'list.course.page.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  TextEditingController findCoursePage = TextEditingController();

  
  List<CourseModel> listCourseModelHot = [
    CourseModel(
      id: 1,
      title: "Khóa Developer Foundation",
      moTa: "FPT Software",
      employer: "FPT Software",
      employerPath:
          "https://scontent.fhan5-11.fna.fbcdn.net/v/t39.30808-6/326420594_1274738173384030_7517311469436672342_n.png?_nc_cat=103&ccb=1-7&_nc_sid=efb6e6&_nc_eui2=AeEIGpKOwF4oHqoAepvHJ3Zd2Vc-GgJyYobZVz4aAnJihsdjK5XZBrpyj7TK9dqq6Rst69K4QK6NZP0gTIkGUuSN&_nc_ohc=b3H4YHHiPc4AX8R8MvG&_nc_ht=scontent.fhan5-11.fna&oh=00_AfBDVFYECWM9zSufneRLz_KZ9QVJxOcQMPAn3y6vrASVwg&oe=658BC314",
      url: "https://fptsoftware.com/",
      numberStart: 4.9,
      numberComment: 129,
    ),
    CourseModel(
      id: 2,
      title: "Khóa Business Analyst",
      moTa: "BAC Group ",
      employer: "BAC Group ",
      employerPath:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROBZgtMGBhQyNk-DcMtmQYu7dlV0ZPfd9IsTJOzvyZXHD4QskrKLEmotehEBGN7kLI8Ig&usqp=CAU",
      url: "https://fptsoftware.com/",
      numberStart: 4.5,
      numberComment: 89,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background_home.png"),
                fit: BoxFit.fill)),
        child: NoFocusScope(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  padding: const EdgeInsets.only(left: 30, top: 20, right: 30),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: Image.asset("assets/logo.png",
                                  fit: BoxFit.contain),
                            ),
                            const SizedBox(width: 10),
                            const SizedBox(
                              child: Text(
                                "StulnforPro\nApp",
                                style: TextStyle(
                                  letterSpacing: 1.6,
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        const Avatar()
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: findCoursePage,
                          maxLines: 1,
                          decoration: const InputDecoration(
                              hintText: "Tìm kiếm khóa học",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  bottom: 13, left: 10, right: 10)),
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            if (findCoursePage.text.isNotEmpty) {
                              setState(() {
                                findCoursePage.text = '';
                              });
                            }
                          },
                          child: Icon(findCoursePage.text.isEmpty
                              ? Icons.search
                              : Icons.close)),
                      const SizedBox(width: 5),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          left: 25, right: 25, top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Phân loại",
                            style: TextStyle(
                                color: Color(0xFF0434AF),
                                fontSize: 17,
                                fontWeight: FontWeight.w700),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push<void>(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      const ListCoursePage(
                                    title: 'Khoá học',
                                  ),
                                ),
                              );
                            },
                            child: const Text(
                              "Tất cả",
                              style: TextStyle(
                                  color: Color(0xFF0434AF),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        PhanLoaiItem(
                          path: "assets/kingte.png",
                          name: "Kinh Tế",
                          onTap: () {
                            Navigator.push<void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const ListCoursePage(
                                        title: 'Khoá học kinh tế', type: 1),
                              ),
                            );
                          },
                        ),
                        PhanLoaiItem(
                          path: "assets/congnghe.png",
                          name: "Công Nghệ",
                          onTap: () {
                            Navigator.push<void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const ListCoursePage(
                                        title: 'Khoá học công nghệ', type: 2),
                              ),
                            );
                          },
                        ),
                        PhanLoaiItem(
                          path: "assets/maketting.png",
                          name: "Marketing",
                          onTap: () {
                            Navigator.push<void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const ListCoursePage(
                                        title: 'Khoá học marketing', type: 3),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        PhanLoaiItem(
                          path: "assets/amnhac.png",
                          name: "Âm nhạc",
                          onTap: () {
                            Navigator.push<void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const ListCoursePage(
                                        title: 'Khoá học âm nhạc', type: 4),
                              ),
                            );
                          },
                        ),
                        PhanLoaiItem(
                          path: "assets/thietke.png",
                          name: "Thiết kế",
                          onTap: () {
                            Navigator.push<void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const ListCoursePage(
                                        title: 'Khoá học thiết kế', type: 5),
                              ),
                            );
                          },
                        ),
                        PhanLoaiItem(
                          path: "assets/anh.png",
                          name: "Nhiếp ảnh",
                          onTap: () {
                            Navigator.push<void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const ListCoursePage(
                                        title: 'Khoá học nhiếp ảnh', type: 6),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 25, right: 25, top: 15, bottom: 10),
                      child: const Row(
                        children: [
                          Text(
                            "Khóa Học Hàng Đầu",
                            style: TextStyle(
                                color: Color(0xFF0434AF),
                                fontSize: 17,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    for (var element in listCourseModelHot)
                      CourseItem(
                        element: element,
                      )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

class PhanLoaiItem extends StatelessWidget {
  final String path;
  final String name;
  final Function() onTap;
  const PhanLoaiItem(
      {super.key, required this.path, required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      height: 90,
      decoration: BoxDecoration(
          color: const Color(0xFFe7f5ff),
          borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            const SizedBox(height: 5),
            SizedBox(
              height: 60,
              child: Image.asset(
                path,
                fit: BoxFit.fitHeight,
              ),
            ),
            Text(
              name,
              style: const TextStyle(color: Color(0xFF907E7E)),
            ),
          ],
        ),
      ),
    );
  }
}
