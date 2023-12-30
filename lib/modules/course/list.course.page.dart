import 'package:fe/model/course.model.dart';
import 'package:fe/provider/base.url.dart';
import 'package:fe/provider/course.provider.dart';
import 'package:flutter/material.dart';

import 'detail.course.page.dart';

class ListCoursePage extends StatefulWidget {
  final String title;
  final int? type;
  const ListCoursePage({super.key, required this.title, this.type});

  @override
  State<ListCoursePage> createState() => _ListCoursePageState();
}

class _ListCoursePageState extends State<ListCoursePage> {
  List<CourseModel> listCourseModelHot = [];

  getData() async {
    if (widget.type == null) {
      var listDataNew = await CourseProvider.getListFostudent();
      setState(() {
        listCourseModelHot = listDataNew;
      });
    } else {
      var listDataNew =
          await CourseProvider.getListFostudentFotype(type: widget.type ?? 0);
      setState(() {
        listCourseModelHot = listDataNew;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
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
        title: Center(
          child: Text(
            widget.title,
            style: const TextStyle(
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
            const SizedBox(height: 15),
            for (var element in listCourseModelHot)
              CourseItem(
                element: element,
              )
          ],
        ),
      ),
    );
  }
}

class CourseItem extends StatelessWidget {
  final CourseModel element;
  const CourseItem({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: const Color(0xFFe7f5ff),
          borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          Navigator.push<void>(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => DetailCourse(
                courseModel: element,
              ),
            ),
          );
        },
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(
                        (element.nguoiDung?.avatar != null)
                            ? "$baseUrl/api/files/${element.nguoiDung?.avatar}"
                            : "https://firebasestorage.googleapis.com/v0/b/appsinhvien-924e4.appspot.com/o/logoc.jpeg?alt=media",
                      ),
                      fit: BoxFit.cover)),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    element.title ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    element.nguoiDung?.fullName ?? "Doanh nghiệp ẩn danh",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF907E7E)),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 255, 222, 89),
                      ),
                      Text(
                        " ${element.numberStart ?? 0} (${element.numberComment ?? 0} Reviews)",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF907E7E)),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
