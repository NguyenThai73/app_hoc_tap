// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fe/constant/avatar.dart';
import 'package:fe/constant/key.dart';
import 'package:fe/modules/category/category.page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  final Function(int) callBack;
  const HomePage({super.key, required this.callBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background_home.png"),
              fit: BoxFit.fill)),
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
            Container(
              margin: const EdgeInsets.only(
                  top: 30, left: 20, bottom: 20, right: 20),
              // height: 60,
              child: Row(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () async {
                      Uri urlconvert = Uri.parse(linkTinTuc);
                      if (!await launchUrl(urlconvert)) {
                        throw Exception('Could not launch $linkTinTuc');
                      }
                    },
                    child: const Column(
                      children: [
                        Icon(
                          Icons.check_circle,
                          size: 35,
                          color: Color(0xFF32cc99),
                        ),
                        Text(
                          "Thành Viên",
                          style: TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: InkWell(
                    onTap: () async {
                      Uri urlconvert = Uri.parse(linkTinTuc);
                      if (!await launchUrl(urlconvert)) {
                        throw Exception('Could not launch $linkTinTuc');
                      }
                    },
                    child: const Column(
                      children: [
                        Icon(
                          Icons.keyboard,
                          size: 35,
                        ),
                        Text(
                          "Tin Tức",
                          style: TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: InkWell(
                    onTap: () async {
                      Uri urlconvert = Uri.parse(linkTinTuc);
                      if (!await launchUrl(urlconvert)) {
                        throw Exception('Could not launch $linkTinTuc');
                      }
                    },
                    child: const Column(
                      children: [
                        Icon(
                          Icons.thumb_up,
                          size: 35,
                        ),
                        Text(
                          "Feedback",
                          style: TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: InkWell(
                    onTap: () async {
                      final Uri launchUri = Uri(
                        scheme: 'tel',
                        path: phoneNumber,
                      );
                      await launchUrl(launchUri);
                    },
                    child: const Column(
                      children: [
                        Icon(
                          Icons.support_agent,
                          size: 35,
                        ),
                        Text(
                          "Hỗ trợ",
                          style: TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 120.0,
                viewportFraction: 0.85,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                // onPageChanged: callbackFunction,
                scrollDirection: Axis.horizontal,
              ),
              items: [
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/slide.png"),
                          fit: BoxFit.cover)),
                ),
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/4.png"),
                          fit: BoxFit.cover)),
                ),
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/1.png"),
                          fit: BoxFit.cover)),
                ),
              ],
            ),
            Container(
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 35, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      callBack(2);
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 120,
                          width: 135,
                          decoration: BoxDecoration(
                              color: Color(0xFFE7F5FF),
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.all(15),
                          child: Center(
                              child: Image.asset(
                            "assets/home1.png",
                            fit: BoxFit.fill,
                          )),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Diễn Đàn Tài Liệu",
                          style: TextStyle(
                              color: Color(0xFF1E3684),
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      //
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const CategoryPage(),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 120,
                          width: 135,
                          decoration: BoxDecoration(
                              color: Color(0xFFE7F5FF),
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.all(15),
                          child: Center(
                              child: Image.asset(
                            "assets/home2.png",
                            fit: BoxFit.fill,
                          )),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Danh Mục Hỗ Trợ",
                          style: TextStyle(
                              color: Color(0xFF1E3684),
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 25, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      callBack(1);
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 120,
                          width: 135,
                          decoration: BoxDecoration(
                              color: Color(0xFFE7F5FF),
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.all(15),
                          child: Center(
                              child: Image.asset(
                            "assets/home3.png",
                            fit: BoxFit.fill,
                          )),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Danh Mục Khóa Học",
                          style: TextStyle(
                              color: Color(0xFF1E3684),
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      callBack(3);
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 120,
                          width: 135,
                          decoration: BoxDecoration(
                              color: Color(0xFFE7F5FF),
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.all(15),
                          child: Center(
                              child: Image.asset(
                            "assets/home4.png",
                            fit: BoxFit.fill,
                          )),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Tài Khoản",
                          style: TextStyle(
                              color: Color(0xFF1E3684),
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
