part of 'employees_bloc.dart';

@immutable
abstract class EmployeesState {}

class EmployeesInitial extends EmployeesState {
  final List<Employee> employeesList;

  EmployeesInitial(this.employeesList);
}

class EmployeesLoadedState extends EmployeesState {
  final List<Employee> employeesList;

  EmployeesLoadedState({@required this.employeesList});
}
