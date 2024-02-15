 
class Doctors {
    final int? idDoctor;
    final String name;
    final String special;
    final String phone;
    final String gender;
    final String  age;

    Doctors({
        this.idDoctor,
        required this.name,
        required this.special,
        required this.phone,
        required this.gender,
         required this.age,
    });

    factory Doctors.fromMap(Map<String, dynamic> json) => Doctors(
        idDoctor: json["Id_Doctor"],
        name: json["Name"],
        special: json["Special"],
        phone: json["Phone"],
        gender: json["Gender"],
        age: json["Age"],
    );

    Map<String, dynamic> toMap() => {
        "Id_Doctor": idDoctor,
        "Name": name,
        "Special": special,
        "Phone": phone,
        "Gender": gender,
        "Age": age,
    };
}
