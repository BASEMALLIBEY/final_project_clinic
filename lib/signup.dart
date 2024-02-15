import 'package:flutter/material.dart';

class SignUP extends StatefulWidget {
  SignUP({super.key});
  @override
  State<SignUP> createState() => _MySignUP();
}

class _MySignUP extends State<SignUP> {
  //textediting controller to control the text when  we enter it
  final password = TextEditingController();
  final gmail = TextEditingController();
  // A bool variable for show and hide password
  bool isvisible = true;
  bool isvisible2 = true;
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

                // colors: [
                //   Color(0xB81684EB), //1
                //   //  Color.fromRGBO(222, 191, 37, 0.604), //2
                //   Color.fromRGBO(97, 93, 69, 0.604), //2
                // ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 50, left: 20),
              child: Text(
                'Sign Up',
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
            padding: const EdgeInsets.only(top: 200, bottom: 30),
            child: Container(
              //margin: const EdgeInsets.only(left: 20, right: 20),
              margin: const EdgeInsets.all(20),
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
               // color: Color.fromRGBO(225, 232, 239, 0.7), //3
                color: Color.fromRGBO(255, 255, 255, 0.419), //3
                border: Border.all(color: Color.fromARGB(184, 97, 102, 106), width: .3),
                borderRadius: BorderRadius.only(
                  // topLeft: Radius.circular(60),
                  // topRight: Radius.circular(60),
                  topLeft: Radius.elliptical(200, 50),
                  topRight: Radius.elliptical(200, 50),
                  bottomLeft: Radius.elliptical(200, 50),
                  bottomRight: Radius.elliptical(200, 50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, ),
                // we put all our textfield to a totm to be controlled and not allow as empty
                child: Form(
                  key: formkey,
                  child: ListView(children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Full Name is rquired";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: Text(
                              'Full Name',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                // color: Color.fromARGB(255, 4, 125, 162),
                                color: Color.fromARGB(255, 148, 157, 160),
                                // color: Color.fromRGBO(135, 113, 1, 1),
                              ),
                            ),
                            //  hintText: "@gmail.com",
                            //  hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            //    (value!.isEmpty)? "Gmail is rquired": null;
                            if (value!.isEmpty) {
                              return "Gmail is rquired";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: Text(
                              'Gmail',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                // color: Color.fromARGB(255, 4, 125, 162),
                                //color: Color.fromRGBO(135, 113, 1, 1),
                                color: Color.fromARGB(255, 148, 157, 160),
                              ),
                            ),
                            //  hintText: "@gmail.com",
                            //  hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password is rquired";
                            }
                            return null;
                          },
                          obscureText: !isvisible,
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
                                fontSize: 21,

                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 148, 157, 160),
                                // color: Color.fromRGBO(135, 113, 1, 1),
                              ),
                            ),

                            //  hintText: "@gmail.com",
                            //  hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Confirm Password is rquired";
                            }
                            return null;
                          },
                          obscureText: !isvisible2,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isvisible2 = !isvisible2;
                                  });
                                },
                                icon: Icon(isvisible2
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                iconSize: 20,
                              ),
                              label: Text(
                                'Confirm Password',
                                style: TextStyle(
                                  fontSize: 21,

                                  fontWeight: FontWeight.bold,
                                  // color: Color.fromRGBO(135, 113, 1, 1),
                                  color: Color.fromARGB(255, 148, 157, 160),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          child: MaterialButton(
                            onPressed: () {
                                
                              if (formkey.currentState!.validate()) {
                                Navigator.pushNamed(context, '/login');
                              }
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  // fontFamily: "MiltonianTattoo",
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          // width: 250,
                          width: MediaQuery.of(context).size.width * .8,
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
                                "You have Accout?",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromARGB(255, 148, 157, 160),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    Navigator.pushNamed(context, '/login');
                                  });
                                },
                                child: Text(
                                  "Log In",
                                  style: TextStyle(
                                    // fontFamily: "MiltonianTattoo",
                                    
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    // color: Color.fromARGB(255, 56, 71, 79),
                                    color: Color.fromRGBO(113, 110, 95, 1),
                                  ),
                                ),
                              ),
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
   //    gradient: LinearGradient(
                //   begin: Alignment(1.0, -1.0), //بداية اللون
                //   end: Alignment(-1.0, 1.1), //نهاية اللون
                //   stops: [
                //     .1,
                //     .2,
                //     .3,
                //     .5,
                //     .8,
                //     .9,
                //   ],
                //   colors: [
                //     Color.fromRGBO(23, 101, 172, 100), //1
                //     Color.fromRGBO(76, 146, 210, 100), //2
                //     Color.fromRGBO(166, 201, 233, 49.69), //3
                //     Color.fromRGBO(255, 255, 255, 0), //4
                //     Color.fromRGBO(144, 189, 231, 0.769), //5
                //     Color.fromRGBO(76, 146, 210, 100), //6
                //   ],
                // ),