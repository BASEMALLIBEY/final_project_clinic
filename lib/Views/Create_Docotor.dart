import 'package:flutter/material.dart';
import 'package:fonal_clinic_project/JsonModels/Class_Doctor.dart';
import 'package:fonal_clinic_project/SQFite/sqldb.dart';

class Create_Doctor extends StatefulWidget {
  const Create_Doctor({super.key});

  @override
  State<Create_Doctor> createState() => _Create_DoctorState();
}

class _Create_DoctorState extends State<Create_Doctor> {
  final name = TextEditingController();
  final special = TextEditingController();
  final phone = TextEditingController();

  // final gender = TextEditingController();
  final age = TextEditingController();
  final formkey = GlobalKey<FormState>();

  String? genderr;

  final db = SqlDb();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton.outlined(
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  db.CreateDoctor(Doctors(
                          name: name.text,
                          special: special.text,
                          phone: phone.text,
                          gender: genderr!,
                          age: age.text))
                      .whenComplete(() {
                    // Navigator.pushNamed(context,'/Page_Doctors');
                    Navigator.of(context).pop(true);
                  });
                }
              },
              icon: Icon(Icons.check))
        ],

         
        backgroundColor:  Color.fromARGB(215, 22, 132, 235), 
        title: const Text(
          'Setting Doctores',
          style: TextStyle(
                  fontFamily: "MiltonianTattoo",

            color: Colors.white,
            fontSize: 23
          ),
        ),
      ),
      body: Form(
        key: formkey,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 50),
          //  padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              
              color: Color.fromRGBO(36, 69, 203, 0.286), //3

              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(60),
                // topLeft: Radius.elliptical(200, 50),
                // topRight: Radius.elliptical(200, 50),
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),

              //خاصية التعامل مع الالوان داخل الشاشة عن طريق اضافة مجموعة الوان مع بعض
              gradient: LinearGradient(
                begin: Alignment(1.0, -1.0), //بداية اللون
                end: Alignment(-1.0, 1.1), //نهاية اللون

                stops: [
                  .1,
                  .99,
                ],

                colors: [
                  Color.fromARGB(255, 0, 132, 255), //1
                  //  Color.fromRGBO(222, 191, 37, 0.604), //2
                  Color.fromRGBO(230, 228, 222, 0.814), //2
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(
                children: [
                  TextFormField(
                    /// NAME FIELD
                    controller: name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Entet Full Name";
                      }
                      return null;
                    },

                    decoration: InputDecoration(
                      label: Text('Nama',
                      style: TextStyle(
                        fontSize: 20
                      ),),
                    ),
                  ),

                  TextFormField(
                    /// SPESIFICATION FIELD
                    controller: special,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Rquired special";
                      }
                      return null;
                    },

                    decoration: InputDecoration(
                      label: Text('special'
                      
                      ,
                      style: TextStyle(
                        fontSize: 20
                      ),
                      ),
                    ),
                  ),

                  TextFormField(
                    /// phone FIELD
                    controller: phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Entet  phone";
                      }
                      return null;
                    },

                    decoration: InputDecoration(
                      label: Text('phone'  ,
                      style: TextStyle(
                        fontSize: 20
                      ),),
                    ),
                  ), ////END PHONE FIELD

                  TextFormField(
                    /// TextFormField  age
                    controller: age,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Entet age";
                      }
                      return null;
                    },

                    decoration: InputDecoration(
                      label: Text('age'  ,
                      style: TextStyle(
                        fontSize: 20
                      ),),
                    ),
                  ),

                  /// End TextFormField  age
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15, bottom: 5, left: 2),
                        alignment: Alignment.centerLeft,
                        child: Text("Chosse Your Gender " ,
                      style: TextStyle(
                        fontSize: 20
                      ),),
                      ),
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: RadioListTile(
                                title: Text('Male'  ,
                      style: TextStyle(
                        fontSize: 20
                      ),),
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
                                title: Text('FMale'  ,
                      style: TextStyle(
                        fontSize: 20
                      ),),
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
 
                      Container(
                        alignment: Alignment.bottomRight,
                        padding: const EdgeInsets.only(
                            top: 120, right: 10, bottom: 10),
                        child: FloatingActionButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(60))),
                          backgroundColor: Color.fromARGB(0, 160, 159, 186),
                          child: Icon(
                            Icons.delete,
                            size: 30,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Warning (Delet DataBase!!! )'  ,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                                content: Text('are you sure delete DataBase ??'  ,
                      style: TextStyle(
                        fontSize: 20
                      ),),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Close'  ,
                      style: TextStyle(
                        fontSize: 20
                      ),),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      await db.mydeletedatabase();
                                      Navigator.pop(context);
                                    },
                                    child: Text('Agreed'  ,
                      style: TextStyle(
                        fontSize: 20
                      ),),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      // Container(
                      //   padding: const EdgeInsets.only(
                      //       top: 150, left: 10, right: 10, bottom: 10),
                      //   child: MaterialButton(
                      //     onPressed: () async {
                      //       await db.mydeletedatabase();
                      //     },
                      //     child: Text(
                      //       'delete data base',
                      //       style: TextStyle(
                      //         fontWeight: FontWeight.bold,
                      //         fontSize: 30,
                      //         // color: Color.fromARGB(255, 4, 125, 162),
                      //         color: Color.fromARGB(255, 148, 157, 160),
                      //         //color: Color.fromRGBO(135, 113, 1, 1),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
