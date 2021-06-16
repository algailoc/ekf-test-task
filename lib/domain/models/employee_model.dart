import 'package:ekf_test_task/domain/entities/employee.dart';
import 'package:flutter/cupertino.dart';

class EmployeeModel extends Employee {
  final String surname;
  final String name;
  final String patronym;
  final String birthday;
  final String position;
  final String id;

  List<Child> children;

  EmployeeModel({
    @required this.surname,
    @required this.name,
    @required this.patronym,
    @required this.birthday,
    @required this.position,
    @required this.id,
    this.children,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    List<Child> children = [];
    json['children'].forEach((el) {
      children.add(Child(
          surname: json['surname'],
          name: json['name'],
          patronym: json['patronym'],
          birthday: json['birthday']));
    });

    return EmployeeModel(
      surname: json['surname'],
      name: json['name'],
      patronym: json['patronym'],
      birthday: json['birthday'],
      position: json['position'],
      id: json['id'],
      children: children,
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, String>> childrenJson = [];

    children.forEach((element) {
      childrenJson.add({
        "surname": surname,
        "name": name,
        "patronym": patronym,
        "birthday": birthday,
      });
    });

    return {
      "surname": surname,
      "name": name,
      "patronym": patronym,
      "birthday": birthday,
      "position": position,
      'children': childrenJson
    };
  }
}
