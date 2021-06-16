import 'package:ekf_test_task/data/local_data_source.dart';
import 'package:ekf_test_task/domain/employee_repository.dart';
import 'package:ekf_test_task/domain/entities/employee.dart';

class EmployeesRepositoryImpl extends EmployeesRepository {
  final LocalDataSource localDataSource = LocalDataSource();

  @override
  Future<Child> addChild(Employee employee, Child child) async {
    return await localDataSource.addChild(employee, child);
  }

  @override
  Future<Employee> addEmployee(Employee employee) async {
    return await localDataSource.addEmployee(employee);
  }

  @override
  Future<List<Employee>> getEmployees() async {
    return await localDataSource.getEmployees();
  }
}
