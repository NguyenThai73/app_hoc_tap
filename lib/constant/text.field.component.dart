import 'package:flutter/material.dart';

class TextFielComponent extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final IconData? iconData;
  final bool? isPassword;
  final bool? enabled;
  const TextFielComponent(
      {super.key,
      this.controller,
      this.hintText,
      this.iconData,
      this.enabled,
      this.isPassword});

  @override
  State<TextFielComponent> createState() => _TextFielComponentState();
}

class _TextFielComponentState extends State<TextFielComponent> {
  bool _isObscure = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 45,
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: const Color(0xFF0723B8),
          ),
          borderRadius: BorderRadius.circular(23)),
      child: Row(
        children: [
          Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: widget.iconData != null
                  ? Icon(
                      widget.iconData,
                      color: const Color(0xFF091E8E),
                      size: 30,
                    )
                  : const SizedBox.shrink()),
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              obscureText: widget.isPassword == true ? !_isObscure : false,
              enabled: widget.enabled,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  color: Color(0xFF0723B8),
                ),
                contentPadding: const EdgeInsets.only(top: 7),
                suffixIcon: widget.isPassword == true
                    ? IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                          color: const Color(0xFFabaff3),
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        })
                    : Container(
                        width: 20,
                        // margin: const EdgeInsets.only(left: 10, right: 10),
                      ),
              ),
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
