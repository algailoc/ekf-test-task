import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:ekf_test_task/domain/employee_usecases.dart';
import 'package:ekf_test_task/domain/entities/employee.dart';
import 'package:meta/meta.dart';

part 'employees_event.dart';
part 'employees_state.dart';

class EmployeesBloc extends Bloc<EmployeesEvent, EmployeesState> {
  final GetEmployeesUsecase getEmployeesUsecase;
  final AddEmployeeUsecase addEmployeeUsecase;
  final AddChildUsecase addChildUsecase;

  List<Employee> employeesList = [];

  EmployeesBloc({
    @required this.getEmployeesUsecase,
    @required this.addEmployeeUsecase,
    @required this.addChildUsecase,
  }) : super(EmployeesInitial([]));

  @override
  Stream<EmployeesState> mapEventToState(
    EmployeesEvent event,
  ) async* {
    if (event is GetEmployeesListEvent) {
      final result = await getEmployeesUsecase();
      employeesList = result;
      yield EmployeesLoadedState(employeesList: employeesList);
    } else if (event is AddEmployeeEvent) {
      final result = await addEmployeeUsecase(Employee(
        surname: event.surname,
        name: event.name,
        patronym: event.patronym,
        birthday: event.birthday,
        position: event.position,
        id: '${Random().nextInt(100)}${event.surname[0]}${event.name[0]}${event.patronym[0]}',
        children: [],
      ));
      employeesList.add(result);
      yield EmployeesLoadedState(employeesList: employeesList);
    } else if (event is AddChildEvent) {
      final result = await addChildUsecase(
        event.employee,
        Child(
          surname: event.surname,
          name: event.name,
          patronym: event.patronym,
          birthday: event.birthday,
        ),
      );
      employeesList.forEach((element) {
        if (element.patronym == event.employee.patronym &&
            element.surname == event.employee.surname &&
            element.name == event.employee.name) {
          element.children.add(result);
        }
      });
      yield EmployeesLoadedState(employeesList: employeesList);
    }
  }
}
