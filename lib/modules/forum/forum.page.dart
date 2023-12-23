// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fe/constant/avatar.dart';
import 'package:fe/constant/no.focus.scope.dart';
import 'package:flutter/material.dart';

class ForumPage extends StatefulWidget {
  const ForumPage({super.key});

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background_home.png"),
                fit: BoxFit.fill)),
        child: NoFocusScope(
          child: SingleChildScrollView(
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
              ],
            ),
          ),
        ));
  }
}
