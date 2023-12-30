// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BorderTextField extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String placeholder;
  final int? minLine;
  final int? maxLines;
  final int? maxlenght;
  final bool? isPassword;
  final Function onChangeText;
  final TextInputType? typeKey;
  final bool? enabled;
  const BorderTextField({
    required this.controller,
    super.key,
    this.maxlenght,
    required this.title,
    required this.placeholder,
    this.minLine,
    this.maxLines,
    this.isPassword,
    required this.onChangeText,
    this.typeKey,
    this.enabled,
  });

  @override
  State<BorderTextField> createState() => _BorderTextFieldState();
}

class _BorderTextFieldState extends State<BorderTextField> {
  bool showpass = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 0),
          padding: const EdgeInsets.all(0),
          // height: 40,
          decoration: BoxDecoration(
            color: Color(0xffF7F8F9),
            border: Border.all(width: 1, color: Color(0xffE8ECF4)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextFormField(
            keyboardType: widget.typeKey ?? TextInputType.text,
            controller: widget.controller,
            obscureText: (widget.isPassword == true) ? showpass : false,
            maxLines: widget.maxLines ?? 1,
            minLines: widget.minLine ?? 1,
            maxLength: widget.maxlenght,
            enabled: widget.enabled,
            decoration: InputDecoration(
              hintText: widget.placeholder,
              hintStyle: TextStyle(
                fontSize: 15,
                color: Color(0xff8391A1),
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(
                  bottom: 5, left: 10, right: 10, top: 10),
              suffixIcon: (widget.isPassword == true)
                  ? IconButton(
                      icon: Icon(
                        showpass ? Icons.visibility : Icons.visibility_off,
                        color: Colors.black,
                        size: 22,
                      ),
                      padding: const EdgeInsets.only(bottom: 1, top: 10),
                      onPressed: () {
                        setState(() {
                          showpass = !showpass;
                        });
                      },
                    )
                  : null,
            ),
            onChanged: (text) {
              widget.onChangeText(text);
            },
          ),
        ),
      ],
    );
  }
}
