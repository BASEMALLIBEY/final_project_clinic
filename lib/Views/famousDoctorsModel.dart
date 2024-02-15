import 'package:flutter/material.dart';

class FamousDoctorsModel extends StatelessWidget {
  const FamousDoctorsModel(
      {super.key, required this.img, required this.description});
  final String img;
  final String description;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 190,
      child: Stack(
        children: [
          Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.all(Radius.circular(20)),
            ),
            child: Container(
              width: 220,
              height: 180,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  description,
                  style: TextStyle(color: Colors.grey.shade800, fontSize: 18),
                ),
              ),
            ),
          ),
          Positioned(
              left: 70,
              child: Container(
                height: 84,
                width: 84,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment(1.0, -1.0), //بداية اللون
                    end: Alignment(-1.0, 1.1), //نهاية اللون

                    stops: [
                      .5,
                      .99,
                    ],

                    colors: [
                      Color(0xB81684EB), //1
                      //  Color.fromRGBO(222, 191, 37, 0.604), //2
                      Color.fromRGBO(97, 93, 69, 0.604), //2
                    ],
                  ),
                  borderRadius: BorderRadius.circular(80),
                ),
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage(img),
                ),
              ))
        ],
      ),
    );
  }
}
