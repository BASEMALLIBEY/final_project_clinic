//import 'package:clinic_project/models/departModel.dart';
import 'package:fonal_clinic_project/Views/categoryCard.dart';
import 'package:fonal_clinic_project/Views/famousDoctorsModel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: scaffoldKey,
        drawer: Drawer(
        
          child: Container(
            padding: const EdgeInsets.all(30),
            child: ListView(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(
                          "images/logo2.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Expanded(
                        child: ListTile(
                      title: Text("Basem And Ekram "),
                      subtitle: Text("ekramalrdawi@gmail \n bbm.allibyy@gmail "),
                    ))
                  ],
                ),
                ListTile(
                  title: const Text("Home Page"),
                  leading: const Icon(Icons.home),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("Account"),
                  leading: const Icon(Icons.account_balance_rounded),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("Order"),
                  leading: const Icon(Icons.check_box),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("About Us "),
                  leading: const Icon(Icons.help),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("Contact Us"),
                  leading: const Icon(Icons.phone),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("Sign Out "),
                  leading: const Icon(Icons.exit_to_app),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
        // appBar: AppBar(
        //   backgroundColor: Colors.blue.shade900,
        //   centerTitle: true,
        //   title: const Text(
        //     'Clinic',
        //     style: TextStyle(),
        //   ),
        //   leading: IconButton(
        //       onPressed: () {
        //         scaffoldKey.currentState?.openDrawer();
        //       },
        //       icon: Icon(
        //         Icons.menu,
        //         color: Colors.blue.shade900,
        //       )),

        //   // shadowColor: Colors.grey.shade200,
        //   // shape: const RoundedRectangleBorder(
        //   //   borderRadius: BorderRadius.only(
        //   //       bottomLeft: Radius.circular(200),
        //   //       bottomRight: Radius.circular(300)),
        //   // ),
        //   // bottom: PreferredSize(
        //   //   preferredSize: const Size.fromHeight(90),
        //   //   child: Image.asset(
        //   //     "images/logo.png",
        //   //     height: 120,
        //   //     width: 120,
        //   //   ),
        //   // ),
        // ),
        backgroundColor: Colors.grey.shade200,
        body: ListView(
          children: [
            Stack(
              children: [
                Positioned(
                    child: Container(
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
                        Color.fromRGBO(230, 228, 222, 0), //2
                      ],
                      ),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                  height: MediaQuery.of(context).size.height / 5,
                  child: Stack(
                    children: [
                      const Positioned(
                          top: 40,
                          left: 12,
                          child: Icon(
                            Icons.menu,
                            color: Colors.white,
                          )),
                      const Positioned(
                          top: 40,
                          right: 12,
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          )),
                      Positioned(
                          top: -42,
                          right: 59,
                          child: Image.asset(
                            "images/logo.png",
                            height: 260,
                            width: 260,
                          ))
                    ],
                  ),
                )),
                Positioned(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 150,
                        ),
                        Text(
                          "Departement",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        buildCategoryList(),
                        Text(
                          "The most famous doctors",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        buildFamousDoctors(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

buildCategoryList() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        InkWell(
          onTap: () {},
          child:   CategoryCard(
            img: 'images/dental_surgeon.png',
            titel: 'Dental\nSection',
            // nav: 'DentalPage'
          ),
        ),
          CategoryCard(
          img: 'images/eye_specialist.png',
          titel: 'eyes\nSection',
          // nav: '/DentalPage'
        ),
          CategoryCard(
          img: 'images/heart_surgeon.png',
          titel: 'heart\nSection',
          // nav: '/DentalPage'
        ),
          CategoryCard(
          img: 'images/baby.png',
          titel: 'Children\nSection',
          // nav: '/DentalPage'
        ),
      ],
    ),
  );
}

buildFamousDoctors() {
  return const SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        FamousDoctorsModel(
          img: 'images/women.png',
          description: 'Dr.Mani Jeason\n Consultant in Neurosurgery',
        ),
        FamousDoctorsModel(
            img: 'images/mandoctor.jpg',
            description: 'Dr.Nohni Taseiry\n Internal Medicine Consultant'),
        FamousDoctorsModel(
            img: 'images/women2.jpg',
            description: 'Dr.Nahid Bajara\n Internal Medicine Consultant'),
        FamousDoctorsModel(
            img: 'images/man2.jpg',
            description: 'Dr.Mousa Altahafi\n Internal Medicine Consultant'),
      ],
    ),
  );
}
