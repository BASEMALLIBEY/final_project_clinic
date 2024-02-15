 
class Users {
    final int? idUsers;
    final String userName;
    final String gmail;
    final String password;

    Users({
          this.idUsers,
        required this.userName,
        required this.gmail,
        required this.password,
    });

    factory Users.fromMap(Map<String, dynamic> json) => Users(
        idUsers: json["Id_Users"],
        userName: json["User_Name"],
        gmail: json["Gmail"],
        password: json["Password"],
    );

    Map<String, dynamic> toMap() => {
        "Id_Users": idUsers,
        "User_Name": userName,
        "Gmail": gmail,
        "Password": password,
    };
}
