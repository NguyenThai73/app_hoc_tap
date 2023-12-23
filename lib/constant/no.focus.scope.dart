import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NoFocusScope extends StatelessWidget {
  final Widget child;
  const NoFocusScope({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: child,
    );
  }
}
