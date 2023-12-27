// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fe/constant/avatar.dart';
import 'package:fe/constant/no.focus.scope.dart';
import 'package:fe/modules/forum/document/document.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chat/chat.cubit.dart';
import 'chat/chat.page.dart';
import 'chat/list.chat.cubit.dart';

class ForumPage extends StatefulWidget {
  final int idSv;
  const ForumPage({super.key, required this.idSv});

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  var tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background_home.png"),
                fit: BoxFit.fill)),
        child: NoFocusScope(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
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
                SizedBox(height: 5),
                Expanded(
                    child: DefaultTabController(
                        initialIndex: 0,
                        length: 2,
                        child: Builder(builder: (context) {
                          return Column(
                            children: [
                              TabBar(
                                onTap: (index) {
                                  setState(() {
                                    tabIndex = index;
                                  });
                                },
                                controller: DefaultTabController.of(context),
                                labelColor: Colors.black,
                                labelStyle: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500),
                                dividerHeight: 0,
                                indicatorColor: Color(0xFF014dae),
                                tabs: [
                                  Tab(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [Text('Trò chuyện')],
                                  )),
                                  Tab(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [Text('Tài liệu')],
                                  )),
                                ],
                              ),
                              Expanded(
                                  child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(
                                    color: Color(0xFFe7f5ff)),
                                child: tabIndex == 0
                                    ? MultiBlocProvider(
                                        providers: [
                                            BlocProvider(
                                              create: (context) =>
                                                  ListChatCubit(),
                                            ),
                                            BlocProvider(
                                              create: (context) => ChatCubit(),
                                            ),
                                          ],
                                        child:
                                            ChatPage(idUser:widget.idSv))
                                    : DocumentPage(),
                              ))
                            ],
                          );
                        })))
              ],
            ),
          ),
        ));
  }
}
