// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:fe/constant/border_textfield.dart';
import 'package:fe/constant/drop.down.dart';
import 'package:fe/constant/map.status.dart';
import 'package:fe/constant/no.focus.scope.dart';
import 'package:fe/constant/toast.dart';
import 'package:fe/model/course.model.dart';
import 'package:fe/provider/course.provider.dart';
import 'package:flutter/material.dart';

class EditCourseEmployerPage extends StatefulWidget {
  final CourseModel courseModel;
  const EditCourseEmployerPage({super.key, required this.courseModel});

  @override
  State<EditCourseEmployerPage> createState() => _EditCourseEmployerPageState();
}

class _EditCourseEmployerPageState extends State<EditCourseEmployerPage> {
  CourseModel courseModel = CourseModel();
  TextEditingController title = TextEditingController();
  TextEditingController moTa = TextEditingController();
  TextEditingController url = TextEditingController();
  TextEditingController urlKhaiGiang = TextEditingController();

  @override
  void initState() {
    super.initState();
    courseModel = widget.courseModel.copyWith();
    title.text = courseModel.title ?? "";
    moTa.text = courseModel.moTa ?? "";
    url.text = courseModel.url ?? "";
    urlKhaiGiang.text = courseModel.urlKhaiGiang??"";
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
            "Cập nhật khoá học",
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
      body: NoFocusScope(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(15),
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 213, 226, 236)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),
                DropDownWidget(
                  listSelecet: listTypeCourse,
                  title: 'Danh mục',
                  selectedIndex: courseModel.type,
                  onSelect: (value) {
                    setState(() {
                      courseModel.type = value as int;
                    });
                  },
                ),
                SizedBox(height: 10),
                BorderTextField(
                  controller: title,
                  title: "Tiêu đề",
                  placeholder: '',
                  onChangeText: (value) {},
                ),
                const SizedBox(height: 10),
                BorderTextField(
                  controller: moTa,
                  title: "Mô tả",
                  placeholder: '',
                  maxLines: 5,
                  onChangeText: (value) {},
                ),
                const SizedBox(height: 10),
                BorderTextField(
                  controller: url,
                  title: "Đường dẫn khoá học",
                  placeholder: '',
                  onChangeText: (value) {},
                  maxLines: 3,
                ),
                const SizedBox(height: 20),
                BorderTextField(
                  controller: urlKhaiGiang,
                  title: "Đường dẫn lịch khai giảng",
                  placeholder: '',
                  onChangeText: (value) {},
                  maxLines: 3,
                ),
                const SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(10),
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: const <Color>[
                          Color(0xFF5adce4),
                          Color(0xFF014dae)
                        ]),
                  ),
                  child: InkWell(
                    onTap: () async {
                      if (title.text.isEmpty ||
                          url.text.isEmpty ||
                          urlKhaiGiang.text.isEmpty ||
                          courseModel.type == null) {
                        showToast(
                          context: context,
                          msg: "Cần điền đầy đủ thông tin",
                          color: const Color.fromARGB(255, 255, 179, 86),
                          icon: const Icon(Icons.info),
                        );
                      } else {
                        courseModel.title = title.text;
                        courseModel.url = url.text;
                        courseModel.moTa = moTa.text;
                        courseModel.urlKhaiGiang = urlKhaiGiang.text;
                        var checkRegister =
                            await CourseProvider.put(courseModel);
                        if (checkRegister) {
                          showToast(
                            context: context,
                            msg: "Cập nhật thành công",
                            color: Color.fromARGB(255, 94, 255, 86),
                            icon: const Icon(Icons.done),
                          );
                          Navigator.pop(context, courseModel);
                        } else {
                          showToast(
                            context: context,
                            msg: "Cập nhật không thành công",
                            color: const Color.fromARGB(255, 255, 179, 86),
                            icon: const Icon(Icons.info),
                          );
                        }
                      }
                    },
                    child: Center(
                      child: Text(
                        "Cập nhật",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
