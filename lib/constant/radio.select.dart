import 'package:flutter/material.dart';

class RadioSelect extends StatelessWidget {
  final String title;
  final Function() onTap;
  final bool isSelected;
  const RadioSelect(
      {super.key,
      required this.title,
      required this.onTap,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipOval(
          child: InkWell(
            onTap: onTap,
            child: Container(
              width: 27,
              height: 27,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 54, 77, 206),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 0),
                        blurRadius: 4,
                        color: const Color(0xff000000).withOpacity(0.25),
                        spreadRadius: 0)
                  ]),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            // gradient: const LinearGradient(
                            //   begin: Alignment.topCenter,
                            //   end: Alignment.bottomCenter,
                            //   colors: <Color>[
                            //     Color(0xffA139EF),
                            //     Color(0xffDB73B9)
                            //   ],
                            // ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    )
                  : Container(),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
              fontSize: 18,
              color: Color(0xFF0723B8),
              fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
