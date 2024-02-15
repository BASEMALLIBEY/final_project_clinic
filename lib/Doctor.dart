//  import 'package:flutter/material.dart';
// import 'package:clinic_project/SQLite/sqldb.dart';

// class Doctor extends StatefulWidget {
//   Doctor({super.key});
//   @override
//   State<Doctor> createState() => _MyDoctors();

// }

// class _MyDoctors extends State<Doctor> {
//  SqlDb sqlDb = SqlDb();
// Future<List<Map>> readData( ) async{

//   List<Map> result = await sqlDb.readData("select * from Doctores");
//   return result;
// }

//    @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: const Text(
//           'Doctores',
//         ),
//       ),
//         body: Stack(
//         children: [
//           Container(
//             width: double.infinity,
//             height: double.infinity,
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               //خاصية التعامل مع الالوان داخل الشاشة عن طريق اضافة مجموعة الوان مع بعض
//               gradient: LinearGradient(
//                 begin: Alignment(1.0, -1.0), //بداية اللون
//                 end: Alignment(-1.0, 1.1), //نهاية اللون
//                 // stops: [
//                 //   .1,
//                 //   .2,
//                 //   .3,
//                 //   .5,
//                 //   .8,
//                 //   .9,
//                 // ],
//                 // colors: [
//                 //   Color.fromRGBO(23, 101, 172, 100), //1
//                 //   Color.fromRGBO(76, 146, 210, 100), //2
//                 //   Color.fromRGBO(166, 201, 233, 49.69), //3
//                 //   Color.fromRGBO(255, 255, 255, 0), //4
//                 //   Color.fromRGBO(144, 189, 231, 0.769), //5
//                 //   Color.fromRGBO(76, 146, 210, 100), //6
//                 // ],

//                 stops: [
//                   .1,
//                   .99,
//                 ],

//                 colors: [
//                   Color(0xB81684EB), //1
//                 //  Color.fromRGBO(222, 191, 37, 0.604), //2
//                    Color.fromRGBO(230, 228, 222, 0), //2
//                 ],
//               ),
//             ),
//           ),

//           ListView(
//             children: [
//               FutureBuilder(
//                 future: readData(),
//                  builder: (BuildContext context, AsyncSnapshot <List<Map>> snapshot)
//                  {
                
//                   if(snapshot.connectionState == ConnectionState.waiting)
//                   {
//                     return CircularProgressIndicator();
//                   }else if(snapshot.hasData && snapshot.data!.isEmpty)
//                   {
//                     return Text("No Data");
//                   }
//                   else if(snapshot.hasError)
//                   {
//                     return Text(snapshot.error.toString());
//                   }
//                   else{
//                     return ListView.builder(
//                       physics: NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       itemCount: snapshot.data!.length,
//                       itemBuilder: (context , index){
                   
//                       return Container(child: Text("${snapshot.data![index] }"),);
//                     } 
//                     );
//                     }
                 
//                     //    if(snapshot.hasData)
//                     //    { return ListView.builder(
//                     //   physics: NeverScrollableScrollPhysics(),
//                     //   shrinkWrap: true,
//                     //   itemCount: snapshot.data!.length,
//                     //   itemBuilder: (context , index){
                   
//                     //   return Container(child: Text("${snapshot.data![index] }"),);
//                     // } 
                    
//                     // }
//                     // else{
//                     // return CircularProgressIndicator();
//                     // }
                      

//                   }
//                  ),
//             ],
//           ),
//         ],
//      ),
//     );
//   }
  
//   }

