// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fe/model/course.model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailCourse extends StatefulWidget {
  final CourseModel courseModel;
  const DetailCourse({super.key, required this.courseModel});

  @override
  State<DetailCourse> createState() => _DetailCourseState();
}

class _DetailCourseState extends State<DetailCourse> {
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
                    imageUrl: widget.courseModel.employerPath ?? ""),
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
                    onTap: () {},
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
                child: Text("Chưa có nhận xết nào"),
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
                  Uri urlconvert = Uri.parse(widget.courseModel.url ?? "");
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
