// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:fe/constant/border_textfield.dart';
import 'package:fe/constant/my.dialog.dart';
import 'package:fe/constant/shared.preferences.dart';
import 'package:fe/model/course.comment.model.dart';
import 'package:fe/model/course.model.dart';
import 'package:fe/provider/course.comment.provider.dart';
import 'package:flutter/material.dart';

class CommentDialog extends StatefulWidget {
  final CourseModel courseModel;
  const CommentDialog({super.key, required this.courseModel});

  @override
  State<CommentDialog> createState() => _CommentDialogState();
}

class _CommentDialogState extends State<CommentDialog> {
  TextEditingController comment = TextEditingController();
  int point = 0;
  @override
  Widget build(BuildContext context) {
    return MyDialog(
      onClickOutSide: () {
        Navigator.pop(context);
      },
      child: Container(
        child: Column(
          children: [
            BorderTextField(
              controller: comment,
              title: "Bình luận",
              placeholder: '',
              maxLines: 2,
              onChangeText: (value) {},
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      point = 1;
                    });
                  },
                  icon: Icon(
                    Icons.star,
                    size: 40,
                    color: (point > 0) ? Colors.yellow : Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      point = 2;
                    });
                  },
                  icon: Icon(
                    Icons.star,
                    size: 40,
                    color: (point > 1) ? Colors.yellow : Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      point = 3;
                    });
                  },
                  icon: Icon(
                    Icons.star,
                    size: 40,
                    color: (point > 2) ? Colors.yellow : Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      point = 4;
                    });
                  },
                  icon: Icon(
                    Icons.star,
                    size: 40,
                    color: (point > 3) ? Colors.yellow : Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      point = 5;
                    });
                  },
                  icon: Icon(
                    Icons.star,
                    size: 40,
                    color: (point > 4) ? Colors.yellow : Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20)),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Center(
                      child: Text(
                        "Huỷ",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: InkWell(
                    onTap: () async {
                      if (comment.text.isEmpty || point == 0) {
                      } else {
                        var idNd = await MySP.getIdSV();
                        CourseCommentModel courseCommentModel =
                            CourseCommentModel();
                        courseCommentModel.idNd = idNd;
                        courseCommentModel.comment = comment.text;
                        courseCommentModel.star = point.toString();
                        courseCommentModel.idCourse = widget.courseModel.id;
                        var dataA = await CourseCommentProvider.post(
                            courseCommentModel);
                        Navigator.pop(context, dataA);
                      }
                    },
                    child: Center(
                      child: Text(
                        "Đăng",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
