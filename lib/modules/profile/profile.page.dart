import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF5adce4), Color(0xFF014dae)],
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 80,
            child: Container(
              margin: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: Image.asset("assets/logo.png", fit: BoxFit.contain),
                  ),
                  const SizedBox(width: 10),
                  const SizedBox(
                    child: Text(
                      "Tài khoản",
                      style: TextStyle(
                        letterSpacing: 1.6,
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(color: Colors.white),
          ))
        ],
      ),
    );
  }
}
