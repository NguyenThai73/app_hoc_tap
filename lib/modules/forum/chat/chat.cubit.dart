// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fe/model/message.model.dart';
import 'package:fe/provider/chat.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'chat.cubit.state.dart';

class ChatCubit extends Cubit<ChatCubitState> {
  final FocusNode chatFocus = FocusNode();
  final TextEditingController controllerChat = TextEditingController();

  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  ChatCubit({a}) : super(const ChatCubitState()) {
    chatFocus.addListener(() {
      if (chatFocus.hasFocus) {
        emit(state.copyWith(status: CommentStatus.focusComment));
      } else {
        emit(state.copyWith(status: CommentStatus.initial));
      }
    });
  }

  Future<MessageModel?> sendText() async {
    if (controllerChat.text.isEmpty) {
      chatFocus.unfocus();
      return null;
    }
    String content = controllerChat.text;
    controllerChat.clear();
    chatFocus.unfocus();
    await ChatProvider().sendMessageText(message: content);
    return null;
  }

  Future<void> sendImage(String fileName) async {
    await ChatProvider().sendMessageImage(fileName: fileName);
  }

  Future<void> sendFile(String fileName) async {
    await ChatProvider().sendMessageFile(fileName: fileName);
  }
}
