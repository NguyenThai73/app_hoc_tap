import 'package:flutter/material.dart';

class DisciplineGradePage extends StatelessWidget {
  const DisciplineGradePage({super.key});

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
              "Điểm rèn luyện",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
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
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(color: Color(0xFFe7f5ff)),
          child: const Column(
            children: [
              SizedBox(height: 35),
              Text("Tổng điểm", style: TextStyle(fontSize: 17),),
              Text("90", style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),)
            ],
          ),
        ));
  }
}
