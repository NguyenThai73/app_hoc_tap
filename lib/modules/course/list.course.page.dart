import 'package:fe/model/course.model.dart';
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
                      image: NetworkImage(element.employerPath ?? ""))),
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
                    element.employer ?? "",
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
                        " ${element.numberStart} (${element.numberComment} Reviews)",
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
