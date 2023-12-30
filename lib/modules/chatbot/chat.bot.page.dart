// ignore_for_file: prefer_const_constructors, avoid_function_literals_in_foreach_calls

import 'package:fe/constant/key.dart';
import 'package:fe/provider/base.url.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatBotPage extends StatefulWidget {
  const ChatBotPage({super.key});

  @override
  State<ChatBotPage> createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  final Map<dynamic, dynamic> listData = {
    QA(
      question: 'Tôi muốn biết cách sử dụng tính năng Cộng Đồng?',
      anser: 'Vui lòng chọn 1',
    ): {
      QA(
        question: "Tôi muốn biết sử dụng Mess Cộng Đồng",
        anser: 'Vui lòng chọn 1',
      ): {
        QA(
          question: "Cách gửi tin nhắn",
          anser:
              "Vâng StuBot rất vui lòng trả lời câu hỏi của bạn. Bạn có thể gửi tin nhắn trong Cộng Đồng Chat theo trình tự sau. Đầu tiên ở giao diện chính bạn chọn tính năng Diễn Đàn --> sau đó bạn sẽ thấy khung Chat hiện lên --> Ở thanh giữa bạn điền văn bản và biểu tượng gửi và thực hiện gửi đi.",
        ): {},
        QA(
          question: "Cách xóa tin nhắn",
          anser:
              "Vâng StuBot rất vui lòng trả lời câu hỏi của bạn! Bạn có thể xóa tin nhắn trong Cộng Đồng chat theo trình tự sau. Đầu tiên ở giao diện chính bạn chọn tính năng Diễn Đàn,Chọn Tin Nhắn ,khi bạn đã tìm thấy tin nhắn bạn muốn xóa, chọn nó. Điều này thường được thực hiện bằng cách nhấn và giữ tin nhắn hoặc sử dụng các tùy chọn hiển thị. Trong một số trường hợp, có thể cần bạn chọn biểu tượng thùng rác hoặc một biểu tượng khác để mở tùy chọn xóa. Xác Nhận Xóa: Xác nhận quyết định của bạn để xóa tin nhắn. Một số ứng dụng yêu cầu xác nhận bước này để ngăn chặn xóa tin nhắn theo ý đồ. ",
        ): {},
      },
      QA(
        question: "Tôi muốn biết cách sử dụng Share Tài Liệu",
        anser: 'Vui lòng chọn 1',
      ): {
        QA(
          question: "Cách Post Tài Liệu",
          anser:
              "Vâng StuBot rất vui lòng trả lời câu hỏi của bạn! Bạn có thể Post Tài Liệu theo trình tự sau. Đầu tiên ở giao diện chính bạn chọn tính năng Diễn Đàn --> tiếp theo bạn chọn Tài Liệu bên góc phải màn hình --> Tiếp chọn Thêm Mới và điền thông tin mô tả Tài Liệu --> Ở phần điền thông tin bạn phải điền thông tin nội dung tài liệu về tác giả và bản quyền nội dung mô tả --> Cuối cùng sau khi điền thông tin xong bạn chọn Thêm Mới Tài Liệu ",
        ): {},
        QA(
          question: "Cách Mở Tài Liệu Tải Về",
          anser:
              "Vâng StuBot rất vui lòng trả lời câu hỏi của bạn! Bạn có thể Mở Tải Liệu Sau Khi Tải Về theo trình tự sau. Đầu Tiên sau khi bạn ấn Nút Tải về thành công --> App sẽ hiện đường dẫn tải về trong máy của bạn --> bạn lưu lại đường dẫn và mở theo trình tự đường dẫn là thành công.",
        ): {},
        QA(
          question: "Điều khoản khi sử dụng Cộng Đồng Share",
          anser:
              "Vâng StuBot rất vui lòng hỗ trợ câu trả lời của bạn! Về Điều Khoản khi đăng tài liệu trên công đồng Share như sau. Tất cả quyền sở hữu trí tuệ của ứng dụng, bao gồm nhưng không giới hạn đến các bản quyền, thương hiệu và bí mật kinh doanh, đều thuộc quyền sở hữu của chúng tôi và các đối tác liên quan. Bạn cam kết không sao chép, sửa đổi, phân phối hoặc tạo ra các tác phẩm phái sinh từ nội dung của chúng tôi mà không có sự cho Phép bằng văn bản từ chúng tôi. APP se có thể chấm dứt hoặc tạm ngừng cung cấp ứng dụng cho bạn nếu bạn vi phạm bất kỳ điều khoản nào trong tài liệu này.",
        ): {},
      },
    },
    QA(
      question: 'Tôi muốn biết cách sử dụng tính năng Danh Mục Hỗ Trợ?',
      anser: 'Vui lòng chọn 1',
    ): {
      QA(
        question: "Cách xem Thời Khóa Biểu",
        anser:
            "Vâng StuBot rất vui lòng hỗ trợ câu trả lời của bạn! Cách Xem Thời Khóa Biểu bạn thực hiện theo trình tự sau. Đầu tiên ở giao diện chính bạn chọn tính năng Danh Mục Hỗ Trợ -->  tiếp theo bạn chọn mục Thời Khóa Biểu --> Trong màn hình thời khóa biểu, người dùng có thể xác định lớp học mà họ muốn xem thông tin chi tiết.",
      ): {},
      QA(
        question: "Cách xem Điểm Học Tập",
        anser:
            "Vâng StuBot rất vui lòng hỗ trợ câu trả lời của bạn! Cách Xem Thời Khóa Biểu bạn thực hiện theo trình tự sau. Đầu tiên ở giao diện chính bạn chọn tính năng Danh Mục Hỗ Trợ -->  tiếp theo bạn chọn mục Điểm Học Tập --> Trong màn hình Điểm Học Tập người dùng có thể xem điểm học tập các môn mà họ muốn.",
      ): {},
      QA(
        question: "Cách xem Điểm Rèn Luyện",
        anser:
            "Vâng StuBot rất vui lòng hỗ trợ câu trả lời của bạn! Cách Xem Thời Khóa Biểu bạn thực hiện theo trình tự sau. Đầu tiên ở giao diện chính bạn chọn tính năng Danh Mục Hỗ Trợ -->  tiếp theo bạn chọn mục Điểm Rèn Luyện --> Trong màn hình Điểm Rèn Luyện, người dùng có thể xác định lớp học mà họ muốn xem thông tin chi tiết.",
      ): {},
    },
    QA(
      question: 'Tôi muốn biết cách sử dụng tính năng Khóa Học Doanh Nghiệp?',
      anser: 'Vui lòng chọn 1',
    ): {
      QA(
        question: "Cách xem khóa học",
        anser:
            'Vâng StuBot rất vui lòng trả lời câu hỏi của bạn! Bạn có thể xem khóa học từ doanh nghiệp bằng cách sau: Đầu tiên bạn vào phần Danh mục khóa học --> Chọn ngành học --> Chọn khóa học bạn muốn xem --> Xem tư vấn khóa học, hệ thống sẽ dẫn người dùng đến đường link khóa học',
      ): {},
      QA(
        question: "Cách đăng ký khóa học",
        anser:
            'Vâng StuBot rất vui lòng trả lời câu hỏi của bạn! Bạn có thể đăng ký khóa học từ doanh nghiệp bằng cách sau: Đầu tiên bạn vào phần Danh mục khóa học --> Chọn ngành học --> Chọn khóa học bạn muốn xem --> Đăng ký khóa học',
      ): {},
      QA(
        question: "Xem phản hồi khóa học",
        anser:
            'Vâng StuBot rất vui lòng trả lời câu hỏi của bạn! Bạn có thể xem phản hồi khóa học từ doanh nghiệp bằng cách sau: Đầu tiên bạn vào phần Danh mục khóa học --> Chọn ngành học --> Chọn khóa học bạn muốn xem --> Đăng ký khóa học',
      ): {},
    },
    QA(
      question: 'Tôi muốn biết cách sử dụng tính năng Quản Lí Tài Khoản?',
      anser: 'Vui lòng chọn 1',
    ): {
      QA(
        question: "Cách Đổi Mật Khẩu",
        anser:
            'Vâng StuBot rất vui lòng hỗ trợ câu hỏi của bạn! Bạn có thể Đổi Mật Khẩu theo trình tự dưới đây. Đầu Tiên bạn chọn tính năng Tài Khoản ở giao diện chính  --> Tiếp theo bạn tìm chọn mục Đổi Mật Khẩu -->Xác nhận mã OTP -->   Sau khi xác minh danh tính, bạn sẽ được yêu cầu nhập mật khẩu mới của mình. Nhập mật khẩu mới và xác nhận nó một lần nữa.',
      ): {},
      QA(
        question: "Cách Chỉnh Sửa Thông Tin Tài Khoản",
        anser:
            'Vâng StuBot rất vui lòng hỗ trợ câu hỏi của bạn! Đầu tiên bạn chọn tính năng Tài Khoản ở giao diện chính  --> Tiếp theo bạn tìm chọn mục Chỉnh Sửa Thông Tin --> Sau đó bạn chọn và cập nhật thông tin tài khoản của bạn',
      ): {},
      QA(
        question: "Cách Đăng Xuất Tài Khoản",
        anser:
            'Vâng StuBot rất vui lòng hỗ trợ câu hỏi của bạn! Đầu tiên bạn chọn tính năng Tài Khoản ở giao diện chính --> Tiếp theo bạn chọn mục Đăng Xuất Tài Khoản',
      ): {},
    },
  };

  bool loadingUi = false;

  bool loading = false;
  Map<dynamic, dynamic> mapSelected = {};

  List<MeesageChatBot> listMessage = [];
  String? avatar;
  getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      avatar = prefs.getString("avatar");
      loadingUi = true;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    mapSelected = listData;
    listMessage.add(MeesageChatBot(
        message:
            'Xin chào! Tôi là trợ lý ảo StuBot, sẵn sàng hỗ trợ bạn.Bạn cần StuBot giúp gì hôm nay cho bạn?',
        sentBy: 'bot'));
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
            "ChatBot Hỗ Trợ",
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
      body: loadingUi
          ? Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(color: Color(0xFFe7f5ff)),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                      child: ListView.separated(
                    reverse: true,
                    addAutomaticKeepAlives: true,
                    padding: const EdgeInsets.only(bottom: 10, top: 10),
                    itemBuilder: (context, index) {
                      var message = listMessage[index];
                      if (message.sentBy == "bot") {
                        return MessageBot(
                          meesageChatBot: message,
                        );
                      } else {
                        return MessageUser(
                            meesageChatBot: message, avatar: avatar);
                      }
                    },
                    itemCount: listMessage.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                  )),
                  if (!loading)
                    Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: (mapSelected.keys.isNotEmpty)
                            ? Column(
                                children: mapSelected.keys
                                    .map((element) => Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding:
                                            EdgeInsets.only(top: 5, bottom: 5),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey))),
                                        child: InkWell(
                                            onTap: () async {
                                              listMessage.insert(
                                                  0,
                                                  MeesageChatBot(
                                                      message: element.question,
                                                      sentBy: 'user'));
                                              setState(() {
                                                loading = true;
                                              });
                                              await Future.delayed(
                                                  Duration(seconds: 2));
                                              listMessage.insert(
                                                  0,
                                                  MeesageChatBot(
                                                      message: element.anser,
                                                      sentBy: 'bot'));
                                              if (mapSelected[element] != {}) {
                                                setState(() {
                                                  mapSelected =
                                                      mapSelected[element];
                                                  loading = false;
                                                });
                                              } else {
                                                setState(() {
                                                  mapSelected = listData;
                                                  loading = false;
                                                });
                                              }
                                            },
                                            child: Center(
                                                child: Text(
                                              "${element.question}",
                                              textAlign: TextAlign.center,
                                            )))))
                                    .toList())
                            : Text(
                                "Bạn cần hỗ trợ thêm xin hãy liên hệ tổng đài viên: $phoneNumber",
                                textAlign: TextAlign.center,
                              ))
                ],
              ),
            )
          : Container(),
    );
  }

  // List<Widget> buildWidgetList(Map<dynamic, dynamic> data) {
  //   List<Widget> widgetList = [];
  //   data.forEach((key, value) {
  //     Widget widgetForKey = ListTile(
  //       title: Text(key.question.toString()),
  //     );

  //     widgetForKey = InkWell(
  //       onTap: () {
  //         setState(() {
  //           mapSelected = value;
  //         });
  //       },
  //       child: widgetForKey,
  //     );
  //     if (value is Map) {
  //       widgetForKey = Column(
  //         children: [
  //           widgetForKey,
  //           ...buildWidgetList(value),
  //         ],
  //       );
  //     }

  //     widgetList.add(widgetForKey);
  //   });
  //   return widgetList;
  // }
}

class MeesageChatBot {
  final String message;
  //uer   bot
  final String sentBy;
  MeesageChatBot({required this.message, required this.sentBy});
}

class QA {
  final String question;
  final String anser;
  QA({required this.question, required this.anser});
}

class MessageBot extends StatelessWidget {
  final MeesageChatBot meesageChatBot;
  const MessageBot({super.key, required this.meesageChatBot});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: 50,
          height: 50,
          child: ClipOval(
            child: Image.asset(
              "assets/iconbot.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )),
          width: MediaQuery.of(context).size.width * 0.65,
          child: Text(meesageChatBot.message),
        )
      ],
    );
  }
}

class MessageUser extends StatelessWidget {
  final MeesageChatBot meesageChatBot;
  final String? avatar;
  const MessageUser({super.key, required this.meesageChatBot, this.avatar});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              )),
          width: MediaQuery.of(context).size.width * 0.65,
          child: Text(meesageChatBot.message),
        ),
        SizedBox(
          width: 50,
          height: 50,
          child: ClipOval(
            child: (avatar != null && avatar != "")
                ? Image.network(
                    "$baseUrl/api/files/$avatar",
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    "assets/no_avatar.jpeg",
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ],
    );
  }
}
