part of 'employees_bloc.dart';

@immutable
abstract class EmployeesState {
  final List<Employee> employeesList;

  EmployeesState({this.employeesList});
}

class EmployeesInitial extends EmployeesState {
  final List<Employee> employeesList;

  EmployeesInitial(this.employeesList);
}

class EmployeesLoadedState extends EmployeesState {
  final List<Employee> employeesList;

  EmployeesLoadedState({@required this.employeesList});
}
