import 'package:flutter/material.dart';

class WlcomeBack extends StatefulWidget {
  const WlcomeBack({super.key});

  @override
  State<WlcomeBack> createState() => _MyWlcomeBack();
}

class _MyWlcomeBack extends State<WlcomeBack> {
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
                  .1,
                  .99,
                ],

                colors: [
                  Color(0xB81684EB), //1
                //  Color.fromRGBO(222, 191, 37, 0.604), //2
                   Color.fromRGBO(230, 228, 222, 0), //2
                ],
              ),
            ),
          ),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 100, left: 50, right: 50),
                    child: Container(
                      child: Text(
                        'Clinic',
                        style: TextStyle(
                          fontSize: 60,
                          color: Color.fromRGBO(26, 3, 3, 0.769), //5
                          fontWeight: FontWeight.w500,
                          fontFamily: "MiltonianTattoo",
                        ),
                      ),
                      padding: EdgeInsets.all(20),
                      // color: Colors.red,
                    ),
                  ),
                  // SizedBox(
                  //   height: 50,
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50, bottom: 20),
                    child: Container(
                      padding: const EdgeInsets.only(top: 40, bottom: 20),
                       
                      height: 250,
                      width: 300,
                      //      height: double.infinity,
                      // width: double.infinity,
                      decoration: BoxDecoration(
                      
                        color: Color.fromRGBO(245, 245, 245, 0.288), //3

                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60),
                          // topLeft: Radius.elliptical(200, 50),
                          // topRight: Radius.elliptical(200, 50),
                          bottomLeft: Radius.elliptical(200, 50),
                          bottomRight: Radius.elliptical(200, 50),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Welcom Back',

                            // textAlign: TextAlign.center,
                            style: TextStyle(
                              // fontFamily: "MiltonianTattoo",
                              fontWeight: FontWeight.w500,

                              fontSize: 30,
                              color: Color.fromARGB(255, 14, 2, 2),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          MaterialButton(
                            child: Text(
                              'Sign Up',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/signup');
                            },
                            minWidth: 200,
                            color: Color.fromRGBO(144, 189, 231, 0.769), //5

                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          MaterialButton(
                            child: Text(
                              'Log In',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            onPressed: () {
                              setState(() {
                                Navigator.pushNamed(context, '/login');
                              });
                            },
                            minWidth: 200,
                            color: Color.fromRGBO(144, 189, 231, 0.769), //5

                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Spacer(),
                  Text(
                    'Log In With Athore Account ',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    // color: const Color.fromARGB(255, 255, 255, 255),
                    padding: EdgeInsets.only(top: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.facebook),
                          iconSize: 32,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.mail),
                          iconSize: 32,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          
        ],
      ),
    );
  }
}
    // stops: [
                //   .1,
                //   .2,
                //   .3,
                //   .5,
                //   .8,
                //   .9,
                // ],
                // colors: [
                //   Color.fromRGBO(23, 101, 172, 100), //1
                //   Color.fromRGBO(76, 146, 210, 100), //2
                //   Color.fromRGBO(166, 201, 233, 49.69), //3
                //   Color.fromRGBO(255, 255, 255, 0), //4
                //   Color.fromRGBO(144, 189, 231, 0.769), //5
                //   Color.fromRGBO(76, 146, 210, 100), //6
                // ],