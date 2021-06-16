part of 'employees_bloc.dart';

@immutable
abstract class EmployeesEvent {}

class GetEmployeesListEvent extends EmployeesEvent {}

class AddEmployeeEvent extends EmployeesEvent {
  final String surname;
  final String name;
  final String patronym;
  final String birthday;
  final String position;

  AddEmployeeEvent({
    @required this.surname,
    @required this.name,
    @required this.patronym,
    @required this.birthday,
    @required this.position,
  });
}

class AddChildEvent extends EmployeesEvent {
  final Employee employee;
  final String surname;
  final String name;
  final String patronym;
  final String birthday;

  AddChildEvent({
    @required this.surname,
    @required this.name,
    @required this.patronym,
    @required this.birthday,
    @required this.employee,
  });
}
