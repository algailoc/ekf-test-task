import 'package:ekf_test_task/domain/entities/employee.dart';

abstract class EmployeesRepository {
  Future<Employee> addEmployee(Employee employee);
  Future<Child> addChild(Employee employee, Child child);
  Future<List<Employee>> getEmployees();
}
