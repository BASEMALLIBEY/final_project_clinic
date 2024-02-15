import 'package:fonal_clinic_project/home.dart';
//import 'package:clinic_project/widgets/cardDoctor.dart';

import 'package:flutter/material.dart';

class DentalPage extends StatelessWidget {
  const DentalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SingleChildScrollView(
            // scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
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
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                  height: MediaQuery.of(context).size.height / 5,
                  child: Stack(
                    children: [
                      Positioned(
                          top: 50,
                          left: 12,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return const HomePage();
                              }));
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          )),
                      Positioned(
                          top: 50,
                          right: 12,
                          child: InkWell(
                            onTap: () {
                              //  Navigator.pushNamed(context, '/Page_Doctors');
                             },
                            child: const Icon(
                              Icons.add,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          )),
                      const Positioned(
                          top: 40,
                          right: 85,
                          child: Text(
                            "DENTAL DOCTORS",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 26,
                            ),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // builCardDoctor(),
              ],
            ),
          ),
        ));
  }
}

// builCardDoctor() {
//   return const SingleChildScrollView(
//     scrollDirection: Axis.horizontal,
//     child: Column(
//       children: [
//         CardDoctor(
//             name: "Ekram Alordawi",
//             spesification: "Children",
//             phone: "091000000",
//             gender: "femal",
//             age: 23)
//       ],
//     ),
//   );
// }
