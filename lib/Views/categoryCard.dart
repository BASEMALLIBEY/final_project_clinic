import 'package:fonal_clinic_project/Views/dentalPage.dart';
import 'package:flutter/material.dart';
import 'package:fonal_clinic_project/Views/Page_Doctors.dart';

class CategoryCard extends StatelessWidget {
    CategoryCard({
    super.key,
    required this.img,
    required this.titel,
    this.nav,
  });
  final String img;
  final String titel;
  final String? nav;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 190,
      child: Stack(
        children: [
          Card(
            shape:   RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.all(Radius.circular(20)),
            ),
            child: InkWell(
              onTap: () {
                  Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return   Page_Doctors();
                              }));
              // Navigator.pushNamed(context, '/ '/home'');
              },
              child: Container(
                width: 120,
                height: 147,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                padding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    titel,
                    style: TextStyle(color: Colors.grey.shade800, fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              right: 0,
              child: Container(
                height: 84,
                width: 84,
                decoration: BoxDecoration(
                  gradient:   LinearGradient(
                    begin: Alignment(1.0, -1.0), //بداية اللون
                    end: Alignment(-1.0, 1.1), //نهاية اللون

                    stops: [
                    .7,
                    .99,
                  ],

                  colors: [
                    Color(0xB81684EB), //1
                    //  Color.fromRGBO(222, 191, 37, 0.604), //2
                    Color.fromRGBO(230, 228, 222, 0), //2
                  ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(img),
              ))
        ],
      ),
    );
  }
}
