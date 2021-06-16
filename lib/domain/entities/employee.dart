import 'package:flutter/cupertino.dart';

class Employee {
  final String surname;
  final String name;
  final String patronym;
  final String birthday;
  final String position;
  final String id;

  List<Child> children;

  Employee(
      {@required this.surname,
      @required this.name,
      @required this.patronym,
      @required this.birthday,
      @required this.position,
      @required this.id,
      this.children});
}

class Child {
  final String surname;
  final String name;
  final String patronym;
  final String birthday;

  Child(
      {@required this.surname,
      @required this.name,
      @required this.patronym,
      @required this.birthday});
}
