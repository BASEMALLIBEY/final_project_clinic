import 'package:flutter/material.dart';
import 'package:fonal_clinic_project/SQFite/sqldb.dart';

class LogIn extends StatefulWidget {
  LogIn({super.key});
  @override
  State<LogIn> createState() => _MyLogIn();
}

class _MyLogIn extends State<LogIn> {
  //textediting controller to control the text when  we enter it
  final password = TextEditingController();
  final gmail = TextEditingController();
  bool isvisible = false;
final db = SqlDb();

  // we have to create global key for our form
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              //خاصية التعامل مع الالوان داخل الشاشة عن طريق اضافة مجموعة الوان مع بعض
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
                  Color.fromRGBO(230, 228, 222, 0), //2
                ],
                // stops: [
                //   .5,
                //   .99,
                // ],

                // colors: [
                //   Color(0xB81684EB), //1
                //   Color.fromRGBO(97, 93, 69, 0.604),
                //   // Color.fromRGBO(222, 191, 37, 0.604), //2
                // ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 60, left: 20),
              child: Text(
                'Log In',
                style: TextStyle(
                  fontFamily: "MiltonianTattoo",
                  fontSize: 60,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(225, 232, 239, 0.7),
                  // color: Color.fromRGBO(108, 92, 12, 0.873),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200, bottom: 20),
            child: Container(
              //margin: const EdgeInsets.only(left: 20, right: 20),
              margin: const EdgeInsets.all(20),
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromARGB(184, 97, 102, 106), width: .3),
            color: Color.fromRGBO(255, 255, 255, 0.419), //3
                borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(200, 50),
                  topRight: Radius.elliptical(200, 50),
                  bottomLeft: Radius.elliptical(200, 50),
                  bottomRight: Radius.elliptical(200, 50),
                ),
              ),

              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
                child: Form(
                  key: formkey,
                  child: ListView(children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: password,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Gmail is rquired";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: Text(
                              'Gmail',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                // color: Color.fromARGB(255, 4, 125, 162),
                                color: Color.fromARGB(255, 148, 157, 160),
                                //color: Color.fromRGBO(135, 113, 1, 1),
                              ),
                            ),
                            //  hintText: "@gmail.com",
                            //  hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Passowrd is rquired";
                            }
                            return null;
                          },
                          obscureText:
                              !isvisible, //اخفاء كلمة المرور عند  ادخالها
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isvisible = !isvisible;
                                  });
                                },
                                icon: Icon(isvisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                iconSize: 20,
                              ),
                              label: Text(
                                'Password',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 148, 157, 160),
                                  //color: Color.fromRGBO(135, 113, 1, 1),
                                ),
                              )),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromARGB(255, 26, 66, 78)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: MaterialButton(
                            onPressed: () {
                             
                              setState(() {
                                // Navigator.pushNamed(context, '/signin');
                                if (formkey.currentState!.validate()) {
                                   Navigator.pushNamed(context,'/home');
                                }
                              });
                            },
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                  // fontFamily: "MiltonianTattoo",
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          // width: 250,
                          width: MediaQuery.of(context).size.width * 8,
                          height: 39,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: .2,
                              color: Color(0xB81684EB),
                              // color: Color.fromARGB(255, 148, 157, 160),
                            ),
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                              begin: Alignment(1.0, -1.0), //بداية اللون
                              end: Alignment(-1.0, 1.0), //نهاية اللون

                              stops: [
                                .6,
                                .999,
                              ],
                              colors: [
                                Color(0xB81684EB), //1
                                //  Color.fromRGBO(222, 191, 37, 0.604), //2
                                Color.fromRGBO(230, 228, 222, 0), //2
                              ],

                              // stops: [
                              //   .2,
                              //   .8,
                              // ],

                              // colors: [
                              //   Color(0xB81684EB), //1
                              //   Color.fromRGBO(117, 108, 73, 0.725), //2
                       
                              // ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Column(
                            children: [
                              Text(
                                "Don't have Accout?",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromARGB(255, 148, 157, 160),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/signup');
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    // fontFamily: "MiltonianTattoo",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    // color: Color.fromARGB(255, 56, 71, 79),
                                    color: Color.fromRGBO(113, 110, 95, 1),
                                    //color: Color.fromRGBO(135, 113, 1, 1),
                                  ),
                                ),
                              ),
                          //  Text(
                          //         "Username or passowrd ois incorrect",
                          //         style: TextStyle(
                          //           // fontFamily: "MiltonianTattoo",
                          //           fontSize: 20,
                          //           fontWeight: FontWeight.w500,
                          //           // color: Color.fromARGB(255, 56, 71, 79),
                          //           color: Color.fromRGBO(63, 61, 78, 1),
                          //           //color: Color.fromRGBO(135, 113, 1, 1),
                          //         ),
                          //       ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// child: Container(
//   child: Column(
//     children: [
//       Padding(
//         padding: const EdgeInsets.only(top: 200, left: 50, right: 50),
//         child: Container(
//           // child: Text(
//           //   'Clinic',
//           //   style: TextStyle(
//           //     fontSize: 60,
//           //     color: Color.fromRGBO(26, 3, 3, 0.769), //5
//           //     fontWeight: FontWeight.w500,
//           //     fontFamily: "MiltonianTattoo",
//           //   ),
//           // ),
//           padding: EdgeInsets.all(20),
//           // color: Colors.red,
//         ),
//       ),
//       SizedBox(
//         height: 50,
//       ),
//       Text(
//         ' log In',
//         // textAlign: TextAlign.center,
//         style: TextStyle(
//           // fontFamily: "MiltonianTattoo",
//           fontWeight: FontWeight.w500,
//           fontSize: 30,
//           color: Color.fromARGB(255, 14, 2, 2),
//         ),
//       ),
//       SizedBox(
//         height: 20,
//       ),
//       MaterialButton(
//         child: Text(
//           'Log In',
//           style: TextStyle(fontSize: 20, color: Colors.white),
//         ),
//         onPressed: () {},
//         minWidth: 200,
//         color: Color.fromRGBO(144, 189, 231, 0.769), //5
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30)),
//       ),
//       Spacer(),
//       Text(
//         'Log In With Athore Account ',
//         style: TextStyle(
//           fontSize: 17, color: Colors.black,
//           fontWeight: FontWeight.w500),
//       ),
//       Container(
//         // color: const Color.fromARGB(255, 255, 255, 255),
//         padding: EdgeInsets.only(top: 3),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             IconButton(
//               onPressed: () {},
//               icon: Icon(Icons.facebook),
//               iconSize: 32,
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: Icon(Icons.mail),
//               iconSize: 32,
//             )
//           ],
//         ),
//       ),
//     ],
//   ),
// ),
