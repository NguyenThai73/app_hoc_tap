// ignore_for_file: prefer_const_constructors

import 'package:animation_list/animation_list.dart';
import 'package:fe/model/document.model.dart';
import 'package:fe/modules/forum/document/view.document.dart';
import 'package:fe/provider/base.url.dart';
import 'package:fe/provider/document.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'add.document.dart';

class DocumentPage extends StatefulWidget {
  const DocumentPage({super.key});

  @override
  State<DocumentPage> createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
  List<DocumentModel> listData = [];

  TextEditingController findDocument = TextEditingController();
  getData() async {
    var listDataGet = await DocumentProvider.getList("");
    setState(() {
      listData = listDataGet;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width * 0.75,
              height: 40,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) async {
                        var listDataGetFind =
                            await DocumentProvider.getList(value);
                        setState(() {
                          listData = listDataGetFind;
                        });
                      },
                      controller: findDocument,
                      maxLines: 1,
                      decoration: const InputDecoration(
                          hintText: "Tìm kiếm tài liệu",
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.only(bottom: 13, left: 10, right: 10)),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        if (findDocument.text.isNotEmpty) {
                          setState(() {
                            findDocument.text = '';
                          });
                        }
                      },
                      child: Icon(findDocument.text.isEmpty
                          ? Icons.search
                          : Icons.close)),
                  const SizedBox(width: 5),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 10, bottom: 0),
              height: 40,
              width: 70,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: InkWell(
                onTap: () async {
                  var data = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const AddDocumentPage(),
                    ),
                  );
                  if (data != null && data is DocumentModel) {
                    setState(() {
                      listData.insert(0, data);
                    });
                  }
                },
                child: const Center(
                  child: Text(
                    "Thêm",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: AnimationList(
            children: listData
                .map(
                  (element) => Container(
                    margin: EdgeInsets.only(
                        left: 10, right: 10, top: 0, bottom: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: InkWell(
                      onTap: () {
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => ViewDocument(
                              documentModel: element,
                            ),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              element.title ?? "",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(width: 10),
                          IconButton(
                              onPressed: () {
                                Clipboard.setData(ClipboardData(
                                    text:
                                        "$baseUrl/api/files/${element.filename}"));
                              },
                              icon: Icon(
                                Icons.copy,
                                color: Colors.grey,
                              )),
                          IconButton(
                              onPressed: () {
                                downloadFile(context, element.filename ?? "");
                              },
                              icon: Icon(
                                Icons.download,
                                color: Colors.blue,
                              )),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        )
      ],
    );
  }
}
