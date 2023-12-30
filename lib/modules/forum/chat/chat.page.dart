// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:fe/constant/list.load.state.dart';
import 'package:fe/model/message.model.dart';
import 'package:fe/provider/base.url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chat.cubit.dart';
import 'component/another.message.dart';
import 'component/own.message.dart';
import 'list.chat.cubit.dart';

class ChatPage extends StatelessWidget {
  final int idUser;
  const ChatPage({super.key, required this.idUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         resizeToAvoidBottomInset:false,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*0.8,
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 215, 247, 255)),
                child: BlocBuilder<ListChatCubit, ListLoadState<MessageModel>>(
                    buildWhen: (previous, current) {
                  return previous.status != current.status ||
                      previous.list.length != current.list.length;
                }, builder: (context, state) {
                  var listMess = state.list;
                  return (listMess.isNotEmpty)
                      ? ListView.separated(
                          reverse: true,
                          addAutomaticKeepAlives: true,
                          padding: const EdgeInsets.only(bottom: 10, top: 10),
                          itemBuilder: (context, index) {
                            var message = listMess[index];
                            if (message.createUserId == idUser) {
                              return OwnMessage(
                                bloc: context.read<ListChatCubit>(),
                                index,
                                message,
                                isShowTime: true,
                                key: ValueKey('own${message.id}'),
                              );
                            } else {
                              var isShowAvar = true;
                              return AnotherMessage(
                                message,
                                isShowAvar: isShowAvar,
                                isShowTime: true,
                                key: ValueKey('another${message.id}'),
                              );
                            }
                          },
                          itemCount: listMess.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 25,
                            );
                          },
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: 150,
                                child: Image.asset("assets/no_message.png")),
                          ],
                        );
                }),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 5),
                InkWell(
                    onTap: () async {
                      context.read<ChatCubit>().chatFocus.unfocus();
                      var fileName = await handleUploadFileAll();
                      if (fileName != null) {
                        context.read<ChatCubit>().sendFile(fileName);
                      }
                    },
                    child: Icon(
                      Icons.attach_file,
                      size: 30,
                      color: const Color.fromARGB(255, 21, 123, 207),
                    )),
                SizedBox(width: 5),
                InkWell(
                    onTap: () async {
                      context.read<ChatCubit>().chatFocus.unfocus();
                      var fileName = await handleUploadImage();
                      if (fileName != null) {
                        context.read<ChatCubit>().sendImage(fileName);
                      }
                    },
                    child: Icon(
                      Icons.photo_library,
                      size: 30,
                      color: const Color.fromARGB(255, 21, 123, 207),
                    )),
                SizedBox(width: 5),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.grey, width: 2)),
                    height: 50,
                    child: TextFormField(
                      onChanged: (value) {},
                      enabled: true,
                      controller: context.read<ChatCubit>().controllerChat,
                      style: TextStyle(),
                      onTap: () {},
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: "Aa",
                        hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFBBBBBB)),
                        suffixIconConstraints:
                            const BoxConstraints.expand(width: 30, height: 20),
                        contentPadding: const EdgeInsets.only(
                            left: 10, right: 8, top: 8, bottom: 8),
                        isCollapsed: true,
                        border: InputBorder.none,
                      ),
                      focusNode: context.read<ChatCubit>().chatFocus,
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 81, 168, 238),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: InkWell(
                    onTap: () {
                      context.read<ChatCubit>().sendText();
                    },
                    child: Center(
                      child: Icon(Icons.send, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 5),
              ],
            ),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}