import 'package:flutter/material.dart';
import 'package:fonal_clinic_project/JsonModels/Class_Doctor.dart';
import 'package:fonal_clinic_project/SQFite/sqldb.dart';
import 'package:fonal_clinic_project/Views/Create_Docotor.dart';
import 'package:fonal_clinic_project/home.dart';

class Page_Doctors extends StatefulWidget {
  Page_Doctors({super.key});
  @override
  State<Page_Doctors> createState() => _MyPage_Doctors();
}

class _MyPage_Doctors extends State<Page_Doctors> {
  final name = TextEditingController();
  final special = TextEditingController();
  final phone = TextEditingController();
  final age = TextEditingController();
  final formkey = GlobalKey<FormState>();

  String? genderr;
  late SqlDb sqlDb;
  late Future<List<Doctors>> doctor;
  final db = SqlDb();
  @override
  void initState() {
    sqlDb = SqlDb();
    doctor = sqlDb.GetDoctores();

    sqlDb.initialDb().whenComplete(() {
      doctor = getAllDoctors();
      print('On whenComplete sadasdfasdfasdfasdfasd');
    });
    super.initState();
  }

  Future<List<Doctors>> getAllDoctors() {
    return sqlDb.GetDoctores();
  }

  //refresh method
  Future<void> _refresh() async {
    setState(() {
      doctor = getAllDoctors();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      //       return Create_Doctor();
      //     })).then((value) {
      //       if (value != null) {
      //         _refresh();
      //       }
      //     });

      //     // Navigator.pushNamed(context, '/Create_Docotor').then((value) {
      //     //   if (value != null) {
      //     //     _refresh();
      //     //   }
      //     // });
      //   },
      //   child: Icon(Icons.add),
      // ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
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
                        Navigator.of(context).pop(true);
                        // Navigator.of(context)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return const HomePage();
                        // }));
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Color.fromARGB(255, 7, 140, 234),
                      ),
                    )),
                Positioned(
                    top: 50,
                    right: 12,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return Create_Doctor();
                        })).then((value) {
                          if (value != null) {
                            _refresh();
                          }
                        });
                        ;
                      },
                      child: const Icon(
                        Icons.add,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    )),
                const Positioned(
                    top: 40,
                    right: 60,
                    child: Text(
                      "Information Doctors",
                      style: TextStyle(
                  fontFamily: "MiltonianTattoo",

                      //  fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 124, 121, 121),
                        fontSize: 26,
                      ),
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // builCardDoctor(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255).withOpacity(.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Search",
                icon: Icon(Icons.search),
                border: InputBorder.none,
              ),
            ),
          ),

          Expanded(
            child: FutureBuilder<List<Doctors>>(
                future: doctor,
                builder: (BuildContext context,
                    AsyncSnapshot<List<Doctors>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasData && snapshot.data!.isEmpty) {
                    return Center(
                        child:
                            const Text('No Find Data The Table Is Free Area'));
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString(),
                        style: TextStyle(fontSize: 30));
                  } else {
                    final items = snapshot.data ?? <Doctors>[];
                    return ListView.builder(
                        //   physics: NeverScrollableScrollPhysics(),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Expanded(
                            child: Container(
                              //   color: Color.fromARGB(81, 134, 181, 228),

                              margin: EdgeInsets.all(10),
                              child: Container(
                                margin: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment(1.0, -1.0), //بداية اللون
                                    end: Alignment(-1.0, 1.1), //نهاية اللون

                                    stops: [
                                      .3,
                                      .99,
                                    ],
                                    colors: [
                                      Color.fromARGB(115, 22, 132, 235), //1
                                      //  Color.fromRGBO(222, 191, 37, 0.604), //2
                                      Color.fromRGBO(230, 228, 222, 0), //2
                                    ],
                                  ),
                                  border: Border.all(
                                      color: Color.fromARGB(184, 97, 102, 106),
                                      width: .3),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(60),
                                    bottomRight: Radius.circular(60),
                                    topLeft: Radius.circular(60),
                                    topRight: Radius.circular(60),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        subtitle: Text(
                                          items[index].name,
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        title: Text(
                                          'Name',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      ListTile(
                                        title: Text('specialization' ,
                      style: TextStyle(
                        fontSize: 20
                      ),),
                                        subtitle: Text(
                                          items[index].special,
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ),
                                      ListTile(
                                        title: Text('Phone Number' ,
                      style: TextStyle(
                        fontSize: 20
                      ),),
                                        subtitle: Text(
                                          items[index].phone,
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ),
                                      ListTile(
                                        title: Text('Gender' ,
                      style: TextStyle(
                        fontSize: 20
                      ),),
                                        subtitle: Text(
                                          items[index].gender,
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ),
                                      ListTile(
                                        title: Text('Age' ,
                      style: TextStyle(
                        fontSize: 20
                      ),),
                                        subtitle: Text(
                                          items[index].age,
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 0),
                                          child: Container(
                                            height: 70,
                                            decoration: BoxDecoration(
                                              // gradient: LinearGradient(
                                              //               begin: Alignment(1.0, -1.0), //بداية اللون
                                              //               end: Alignment(-1.0, 1.1), //نهاية اللون

                                              //               stops: [
                                              //                 .6,
                                              //                 .99,
                                              //               ],
                                              //               colors: [
                                              //                 Color(0xB81684EB), //1
                                              //                 //  Color.fromRGBO(222, 191, 37, 0.604), //2
                                              //                 Color.fromRGBO(159, 122, 12, 0), //2
                                              //               ],

                                              //               // colors: [
                                              //               //   Color(0xB81684EB), //1
                                              //               //   //  Color.fromRGBO(222, 191, 37, 0.604), //2
                                              //               //   Color.fromRGBO(97, 93, 69, 0.604), //2
                                              //               // ],
                                              //             ),

                                              color: Color.fromRGBO(
                                                  5, 27, 106, 0.537), //3
                                              border: Border.all(
                                                  color: Color.fromARGB(
                                                      237, 5, 97, 171),
                                                  width: .3),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(60),
                                                bottomRight:
                                                    Radius.circular(60),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  FloatingActionButton(
                                                    // button edit
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    60))),
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            218, 255, 255, 255),
                                                    child: Icon(
                                                      Icons.edit,
                                                      size: 30,
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        name.text =
                                                            items[index].name;
                                                        special.text =
                                                            items[index]
                                                                .special;
                                                        phone.text =
                                                            items[index].phone;
                                                        genderr =
                                                            items[index].gender;
                                                        age.text =
                                                            items[index].age;
                                                      });

                                                      showDialog(
                                                        context: context,
                                                        builder: (context) =>
                                                            AlertDialog(
                                                          title: Text(
                                                              'Update Data'),
                                                          content:
                                                              SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            child: Container(
                                                              //  height: 400,
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  // Padding(
                                                                  //   padding:
                                                                  //       const EdgeInsets
                                                                  //           .all(15.0),
                                                                  // child: ListView(
                                                                  //   children: [
                                                                  TextFormField(
                                                                    /// NAME FIELD
                                                                    controller:
                                                                        name,
                                                                    validator:
                                                                        (value) {
                                                                      if (value!
                                                                          .isEmpty) {
                                                                        return "Entet Full Name";
                                                                      }
                                                                      return null;
                                                                    },

                                                                    decoration:
                                                                        InputDecoration(
                                                                      label: Text(
                                                                          'Nama'),
                                                                    ),
                                                                  ),

                                                                  TextFormField(
                                                                    /// SPESIFICATION FIELD
                                                                    controller:
                                                                        special,
                                                                    validator:
                                                                        (value) {
                                                                      if (value!
                                                                          .isEmpty) {
                                                                        return "Rquired special";
                                                                      }
                                                                      return null;
                                                                    },

                                                                    decoration:
                                                                        InputDecoration(
                                                                      label: Text(
                                                                          'special'),
                                                                    ),
                                                                  ),

                                                                  TextFormField(
                                                                    /// phone FIELD
                                                                    controller:
                                                                        phone,
                                                                    validator:
                                                                        (value) {
                                                                      if (value!
                                                                          .isEmpty) {
                                                                        return "Entet  phone";
                                                                      }
                                                                      return null;
                                                                    },

                                                                    decoration:
                                                                        InputDecoration(
                                                                      label: Text(
                                                                          'phone'),
                                                                    ),
                                                                  ), ////END PHONE FIELD

                                                                  TextFormField(
                                                                    /// TextFormField  age
                                                                    controller:
                                                                        age,
                                                                    validator:
                                                                        (value) {
                                                                      if (value!
                                                                          .isEmpty) {
                                                                        return "Entet age";
                                                                      }
                                                                      return null;
                                                                    },

                                                                    decoration:
                                                                        InputDecoration(
                                                                      label: Text(
                                                                          'age'),
                                                                    ),
                                                                  ),

                                                                  /// End TextFormField  age
                                                                  Column(
                                                                    children: [
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                15,
                                                                            bottom:
                                                                                5,
                                                                            left:
                                                                                2),
                                                                        alignment:
                                                                            Alignment.centerLeft,
                                                                        child: Text(
                                                                            "Chosse Your Gender "),
                                                                      ),
                                                                      Row(
                                                                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                        children: [
                                                                          Expanded(
                                                                            child: RadioListTile(
                                                                                title: Text('Male'),
                                                                                value: "Male",
                                                                                groupValue: genderr,
                                                                                onChanged: (value) {
                                                                                  setState(() {
                                                                                    genderr = value;
                                                                                  });
                                                                                }),
                                                                          ),
                                                                          Expanded(
                                                                            child: RadioListTile(
                                                                                title: Text('FMale'),
                                                                                value: "fmale",
                                                                                groupValue: genderr,
                                                                                onChanged: (valu) {
                                                                                  setState(() {
                                                                                    genderr = valu;
                                                                                  });
                                                                                }),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  //   ],
                                                                  // ),
                                                                  // ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child:
                                                                  Text('Close'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () {
                                                                db
                                                                    .updateData(
                                                                        name
                                                                            .text,
                                                                        special
                                                                            .text,
                                                                        phone
                                                                            .text,
                                                                        genderr,
                                                                        age
                                                                            .text,
                                                                        items[index]
                                                                            .idDoctor)
                                                                    .whenComplete(
                                                                        () {
                                                                  _refresh();
                                                                });
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Text(
                                                                  'Update'),
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  FloatingActionButton(
                                                    ///FloatingActionButton
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    60))),
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            218, 255, 255, 255),

                                                    child: Icon(
                                                      Icons.delete,
                                                      size: 30,
                                                    ),
                                                    onPressed: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) =>
                                                            AlertDialog(
                                                          title: Text('Delete'),
                                                          content: Text(
                                                              'are you shore delete this dactor'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child:
                                                                  Text('Close'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () {
                                                                db
                                                                    .deleteData(
                                                                        items[index]
                                                                            .idDoctor!)
                                                                    .whenComplete(
                                                                        () {
                                                                  _refresh();
                                                                });
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Text(
                                                                  'Agreed'),
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  }
                }),
          ),
        ],
      ),
    );
  }
}
                 //    context: context,
                              //    type: AlertType.error,
                                 
                              //    desc:
                              //        "Flutter is more awesome with RFlutter Alert.",
                              //    buttons: [
                              //      DialogButton(
                              //        child: Text(
                              //          "Delete",
                              //          style: TextStyle(
                              //              color: Colors.white,
                              //              fontSize: 20),
                              //        ),
                              //        onPressed: () {
                              //         Navigator.pop(context);
                                      
                              //        } ,
                              //        width: 120,
                              //      )
                              //    ],
                              //  ).show();