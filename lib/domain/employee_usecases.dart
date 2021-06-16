import 'package:ekf_test_task/domain/employee_repository.dart';
import 'package:ekf_test_task/domain/entities/employee.dart';
import 'package:flutter/cupertino.dart';

class AddEmployeeUsecase {
  final EmployeesRepository repository;

  AddEmployeeUsecase({@required this.repository});

  Future<Employee> call(Employee employee) async {
    return await repository.addEmployee(employee);
  }
}

class AddChildUsecase {
  final EmployeesRepository repository;

  AddChildUsecase({@required this.repository});

  Future<Child> call(Employee employee, Child child) async {
    return await repository.addChild(employee, child);
  }
}

class GetEmployeesUsecase {
  final EmployeesRepository repository;

  GetEmployeesUsecase({@required this.repository});

  Future<List<Employee>> call() async {
    return await repository.getEmployees();
  }
}
