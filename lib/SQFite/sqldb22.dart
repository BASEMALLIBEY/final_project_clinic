// // import 'package:clinic_project/JsonModels/Class_Doctor.dart';
// //import 'package:clinic_project/Page_Doctors.dart';
// import 'package:sqflite/sqflite.dart';

// import 'package:path/path.dart';
// import 'dart:async';

// class SqlDb {
//   final Database_Name = 'Clinic.db';
//   static Database? _db;
//   Future<Database?> get db async {
//     //التحقق في حال  تم انشاء قاعدة البانات او لا
//     if (_db == null) {
//       return _db = await intialDb();
//     } else {
//       return _db;
//     }
//   }

//   intialDb() async {
//     // دالة خاصة ب انشاء قاعدة البيانات
//     String databasepath =
//         await getDatabasesPath(); //المسار الخاص بتخزين قاعدة البيانات في الجهاز
//     String path = join(
//         databasepath, Database_Name); //دالة ترجع مسار قاعدة البانات مع اسمها
//     Database mydb = await openDatabase(path,
//         onCreate: _onCreate,
//         version: 3,
//         onUpgrade: _onUpgrade); //  oncreate انشاء قاعدة البابنات بإاستخدام دالة
//     return mydb;
//   }

//   _onUpgrade(Database db, int oldVersion, int newVersion) async {
//     String databasepath =
//         await getDatabasesPath(); //المسار الخاص بتخزين قاعدة البيانات في الجهاز
//     String path = join(
//         databasepath, Database_Name);
//         return path;
//   }
//   _onCreate(Database db, int version) async {
//     Batch batch = db.batch();
      
//    // دالة انشاء الجداول
//     batch.execute('''
//   CREATE TABLE "Users" (
//     "Id_Users" INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
//   "User_Name" TEXT  NOT NULL  ,
//   " Gmail" TEXT  NOT NULL ,
//   "Password" TEXT  NOT NULL )
//  ''');
//       batch.execute(''' CREATE TABLE "Doctores" (
//   "Id_Doctor" INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
//   "Name TEXT"  NOT NULL  
//    "Special" TEXT  NOT NULL ,
//   "Phone" TEXT  NOT NULL,
//   "Gender" TEXT  NOT NULL,
//   "Age" INTEGER  NOT NULL 
//  )
//   ''');
//     print("create data base and table ");
//   }

//   readData(String sql) async {
//     // دالة خاصة بجلب البيانات insert data
//     Database? mydb = await db;
//     List<Map> response =
//         await mydb!.rawQuery(sql); //select data from tableتعليمة خاصة بجملة
//     return response;
//   }

//   insertData(String sql) async //insert data to table
//   {
//     Database? mydb = await db;
//     int response = await mydb!.rawInsert(sql);
//     return response;
//   }

//   updateData(String sql) async // update data from table
//   {
//     Database? mydb = await db;
//     int response = await mydb!.rawUpdate(sql);
//     return response;
//   }

//   deleteData(String sql) async // delete data from table
//   {
//     Database? mydb = await db;
//     int response = await mydb!.rawDelete(sql);
//     return response;
//   }
// }

 
