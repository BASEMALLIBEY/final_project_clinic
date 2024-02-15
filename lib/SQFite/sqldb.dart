  import 'package:fonal_clinic_project/JsonModels/Class_Doctor.dart';
import 'package:sqflite/sqflite.dart';
  import 'package:fonal_clinic_project/JsonModels/Class_Users.dart';

  

import 'package:path/path.dart';
import 'dart:async';

class SqlDb {
  final Database_Name = 'Clinic.db';
   static Database? _db;
  Future<Database?> get db async {
    //  التحقق في حال  تم انشاء قاعدة البانات او لا
    if (_db == null) {
      return _db = await initialDb();
    } else {
      return _db;
    }
  }

  Future<Database> initialDb() async {
    print('On Create sadasdfasdfasdfasdfasd');

    // String Doctores_Table = '''
    //     CREATE TABLE "Doctores" (
    //     Id_Doctor INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
    //     Name TEXT  NOT NULL  ,
    //     Special TEXT  NOT NULL ,
    //     Phone TEXT  NOT NULL,
    //     Gender TEXT  NOT NULL,
    //     Age INTEGER  NOT NULL )
    //     ''';

    // String Users_Table = '''
    //     CREATE TABLE "Users" ("Id_Users" INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
    //     "User_Name" TEXT  NOT NULL  ,
    //     " Gmail" TEXT  NOT NULL ,
    //     "Password" TEXT  NOT NULL )
    //     ''';

    String databasepath = await getDatabasesPath();
    String path = join(databasepath, Database_Name);
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 2, onUpgrade: _onUpgrade);
    return mydb;
    // return openDatabase(path, version: 4, onCreate: (db, version) async {
    //  await db.execute(Doctores_Table);
      
    //    print('On Create sadasdfasdfasdfasdfasd');
    // }, onUpgrade: _onUpgrade);
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
  print('_onUpgrade executeed');


  }
  _onCreate(Database db, int version) async {
     
   Batch batch = db.batch();
     batch.execute('''
   CREATE TABLE "Doctores" (
  "Id_Doctor" INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
  "Name" TEXT  NOT NULL  ,
  "Special" TEXT  NOT NULL ,
  "Phone" TEXT  NOT NULL,
  "Gender" TEXT  NOT NULL,
  "Age" TEXT NOT NULL )
  ''');
     batch.execute('''
  CREATE TABLE "Users" ("Id_Users" INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
  "User_Name" TEXT  NOT NULL  ,
  " Gmail" TEXT  NOT NULL ,
  "Password" TEXT  NOT NULL )
 ''');
  batch.commit();

  print('batch executeed');
  }





  Future<bool> login(Users users ) async {
    // دالة خاصة بجلب البيانات insert data
   final Database mydb = await initialDb() ;
    var response =
        await mydb.rawQuery( "select * from Users where User_Name = '${users.userName}' AND '${users.password}' " ); //select data from tableتعليمة خاصة بجملة
  if(response.isNotEmpty)
  {
    return true;
  }
  else{
    return false;
  }
  }


  Future<int> signup(Users users ) async {
  final Database mydb = await initialDb() ;
  return mydb.insert('Users', users.toMap());
  }



  //get Data from tabel doctores
  Future<List<Doctors>> GetDoctores() async {
    final Database mydb = await initialDb() ;
    List<Map<String, Object?>> result = await mydb.query("Doctores");

     return result.map((e) => Doctors.fromMap(e)).toList();
    // return List.generate(result.length, (index) => Doctors.fromMap(result[index]));
  }

//create doctor
  Future<int> CreateDoctor(Doctors doctors) async //insert data to table
  {
    final Database? mydb = await db;
    return mydb!.insert("Doctores", doctors.toMap());
  }

  Future<int> updateData(
      Name, Special, Phone, Gender, Age ,Id_Doctor) async // update data from table
  {
    Database? mydb = await db;
    return mydb!.rawUpdate(
        'UPDATE Doctores SET Name = ? , Special = ? , Phone = ? , Gender = ? ,  Age= ? where Id_Doctor = ?',
        [Name, Special, Phone, Gender, Age , Id_Doctor ]);
  }

  Future<int> deleteData(int id) async // delete data from table
  {
    final Database? mydb = await db;
    return mydb!.delete('Doctores', where: 'Id_Doctor = ?', whereArgs: [id]);
  }

  mydeletedatabase() async
  {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, Database_Name);
    await deleteDatabase(path);
    print("Delete Database seccssfully");
  }
}

// class SqlDb {
//   final Database_Name = 'Clinic.db';
//   static Database? _db;
//   // Future<Database?> get db async {
//   // //  التحقق في حال  تم انشاء قاعدة البانات او لا
//   //   if (_db == null) {
//   //     return _db = await initialDb();
//   //   } else {
//   //     return _db;
//   //   }

//   // }

//   Future<Database> initialDb() async {
//     String Doctores_Table = '''
// CREATE TABLE Doctores (
// Id_Doctor INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
// Name TEXT  NOT NULL  ,
// Special TEXT  NOT NULL ,
// Phone TEXT  NOT NULL,
// Gender TEXT  NOT NULL,
// Age INTEGER  NOT NULL )
// ''';

//     String Users_Table = '''
// CREATE TABLE "Users" ("Id_Users" INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
// "User_Name" TEXT  NOT NULL  ,
// " Gmail" TEXT  NOT NULL ,
// "Password" TEXT  NOT NULL )
// ''';
//     String databasepath = await getDatabasesPath();
//     String path = join(databasepath, Database_Name);
//     Database mydb = await openDatabase(path,
//         onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
//     return mydb;
//     return openDatabase(path, version: 2,
//         onCreate: (Database db, int version) async {
//       Batch batch = db.batch();
//       batch.execute('''
// CREATE TABLE Doctores (
// Id_Doctor INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
// Name TEXT  NOT NULL  ,
// Special TEXT  NOT NULL ,
// Phone TEXT  NOT NULL,
// Gender TEXT  NOT NULL,
// Age INTEGER  NOT NULL )
// ''');
//       // batch.execute(Users_Table);
//       print('On Create sadasdfasdfasdfasdfasd');
//     }, onUpgrade: _onUpgrade);
//   }

//   _onUpgrade(Database db, int oldVersion, int newVersion) async {}
//   _onCreate(Database db, int version) async {
//   //  Batch batch = db.batch();

// //     batch.execute('''
// //    CREATE TABLE "Doctores" (
// //   "Id_Doctor" INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
// //   "Name TEXT"  NOT NULL  ,
// //   "Special" TEXT  NOT NULL ,
// //   "Phone" TEXT  NOT NULL,
// //   "Gender" TEXT  NOT NULL,
// //   "Age" INTEGER  NOT NULL )
// //   ''');
// //     batch.execute('''
// //   CREATE TABLE "Users" ("Id_Users" INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
// //   "User_Name" TEXT  NOT NULL  ,
// //   " Gmail" TEXT  NOT NULL ,
// //   "Password" TEXT  NOT NULL )
// //  ''');
// //   }

//   //get Data from tabel doctores
//   Future<List<Doctors>> GetDoctores() async {
//     // دالة خاصة بجلب البيانات insert data
//     final Database? mydb = await db;
//     // final Database mydb = await initialDb();
//     // List<Map> response =
//     //     await mydb!.rawQuery(sql); //select data from tableتعليمة خاصة بجملة
//     // return response;
//     List<Map<String, Object?>> result = await mydb!.query('Doctores');
//     return result.map((e) => Doctors.fromMap(e)).toList();
//   }

// //create doctor
//   Future<int> CreateDoctor(Doctors doctors) async //insert data to table
//   {
//     final Database? mydb = await initialDb();
//     return mydb!.insert('Doctores', doctors.toMap());
//     // int response = await mydb!.rawInsert(sql);
//     // return response;
//   }

//   Future<int> updateData(
//       Name, Special, Phone, Gender, Age) async // update data from table
//   {
//     Database? mydb = await initialDb();
//     return mydb.rawUpdate(
//         'UPDATE Doctores SET Name = ? , Special = ? , Phone = ? , Gender = ? ,  Age= ?  ',
//         [Name, Special, Phone, Gender, Age]);
//     // int response = await mydb!.rawUpdate(sql);
//     // return response;
//   }

//   Future<int> deleteData(int id) async // delete data from table
//   {
//     final Database? mydb = await initialDb();
//     return mydb!.delete('Doctores', where: 'Id_Doctor = ?', whereArgs: [id]);
//     // int response = await mydb!.rawDelete(sql);
//     // return response;
//   }
// }
