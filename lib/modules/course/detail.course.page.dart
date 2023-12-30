// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fe/ADMIN/course/comment.dialog.dart';
import 'package:fe/model/course.model.dart';
import 'package:fe/provider/base.url.dart';
import 'package:fe/provider/course.comment.provider.dart';
import 'package:fe/provider/course.provider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class DetailCourse extends StatefulWidget {
  final CourseModel courseModel;
  const DetailCourse({super.key, required this.courseModel});

  @override
  State<DetailCourse> createState() => _DetailCourseState();
}

class _DetailCourseState extends State<DetailCourse> {
  void changeDataAddView() async {
    setState(() {
      int viewNNow = widget.courseModel.views ?? 0;
      widget.courseModel.views = viewNNow + 1;
    });
    await CourseProvider.put(widget.courseModel);
  }

  @override
  void initState() {
    super.initState();
    changeDataAddView();
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
            "Thông tin khoá học",
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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: Color(0xFFe7f5ff)),
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      "Ngày đăng: ${DateFormat('dd-MM-yyyy').format(DateTime.parse(widget.courseModel.createdDate ?? "").toLocal())}"),
                  Text("${widget.courseModel.views ?? 0} lượt xem")
                ],
              ),
              SizedBox(height: 10),
              Text(
                widget.courseModel.title ?? "",
                style:
                    const TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 150,
                height: 150,
                child: CachedNetworkImage(
                  imageUrl: "$baseUrl/api/files/${widget.courseModel.nguoiDung?.avatar}",
                  errorWidget: (context, url, error) {
                    return Image.asset(
                      "assets/logoc.jpeg",
                      fit: BoxFit.cover,
                    );
                  },
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Text(
                    "Mô tả:",
                    style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(widget.courseModel.moTa ?? ""),
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Text(
                    "Bình luận",
                    style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(width: 30),
                  InkWell(
                    onTap: () async {
                      var response = await showDialog(
                          context: context,
                          builder: (context) =>
                              CommentDialog(courseModel: widget.courseModel));
                      if (response != null && response) {
                        var listNew = await CourseCommentProvider.getList(
                            idCourse: widget.courseModel.id ?? 0);
                        setState(() {
                          widget.courseModel.listComments = listNew;
                        });
                      }
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.edit_note,
                          color: Color(0xFF46567a),
                          size: 25,
                        ),
                        Text(
                          " Viết nhận xét",
                          style: TextStyle(
                            color: Color(0xFF46567a),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    for (var element in widget.courseModel.listComments)
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 70,
                              height: 70,
                              child: ClipOval(
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "$baseUrl/api/files/${element.nguoiDung?.avatar}",
                                  errorWidget: (context, url, error) {
                                    return Image.asset(
                                      "assets/logoc.jpeg",
                                      fit: BoxFit.cover,
                                    );
                                  },
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    element.nguoiDung?.fullName ?? "",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(height: 5),
                                  Text(element.comment ?? ""),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: (int.parse(element.star!) > 0)
                                            ? Colors.yellow
                                            : Colors.grey,
                                      ),
                                      SizedBox(width: 10),
                                      Icon(
                                        Icons.star,
                                        color: (int.parse(element.star!) > 1)
                                            ? Colors.yellow
                                            : Colors.grey,
                                      ),
                                      SizedBox(width: 10),
                                      Icon(
                                        Icons.star,
                                        color: (int.parse(element.star!) > 2)
                                            ? Colors.yellow
                                            : Colors.grey,
                                      ),
                                      SizedBox(width: 10),
                                      Icon(
                                        Icons.star,
                                        color: (int.parse(element.star!) > 3)
                                            ? Colors.yellow
                                            : Colors.grey,
                                      ),
                                      SizedBox(width: 10),
                                      Icon(
                                        Icons.star,
                                        color: (int.parse(element.star!) > 4)
                                            ? Colors.yellow
                                            : Colors.grey,
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: FittedBox(
                                          child: Text(
                                            DateFormat('HH:mm dd/MM/yyyy')
                                                .format(DateTime.parse(
                                                        element.createdDate ??
                                                            "")
                                                    .toLocal()),
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF04691f)),
              child: InkWell(
                onTap: () async {
                  Uri urlconvert = Uri.parse(widget.courseModel.url ?? "");
                  if (!await launchUrl(urlconvert)) {
                    throw Exception('Could not launch ');
                  }
                },
                child: const Center(
                  child: Text(
                    "NHẬN TƯ VẤN",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 13),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 50),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFffcd2b)),
              child: InkWell(
                onTap: () async {
                  Uri urlconvert = Uri.parse(widget.courseModel.urlKhaiGiang ?? "");
                  if (!await launchUrl(urlconvert)) {
                    throw Exception('Could not launch ');
                  }
                },
                child: const Center(
                  child: Text(
                    "LỊCH KHAI GIẢNG",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 13),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
