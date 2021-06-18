import 'package:ekf_test_task/data/database.dart';
import 'package:ekf_test_task/domain/entities/employee.dart';
import 'package:ekf_test_task/domain/models/employee_model.dart';
import 'package:sembast/sembast.dart';
import 'package:uuid/uuid.dart';

class LocalDataSource {
  static const String EKF_EMPLYEES_STORE_NAME = 'ekfEmployees';
  Uuid uuid = Uuid();

  final _ekf_employees_database = intMapStoreFactory.store();

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future<Employee> addEmployee(Employee employee) async {
    final model = new EmployeeModel(
      surname: employee.surname,
      name: employee.name,
      patronym: employee.patronym,
      birthday: employee.birthday,
      position: employee.position,
      children: employee.children,
      id: employee.id,
    );

    print(employee.id);

    await _ekf_employees_database.add(await _db, model.toJson());

    return employee;
  }

  Future<Child> addChild(Employee employee, Child child) async {
    final newChildren = [...employee.children, child];
    final model = new EmployeeModel(
      surname: employee.surname,
      name: employee.name,
      patronym: employee.patronym,
      birthday: employee.birthday,
      position: employee.position,
      children: newChildren,
      id: employee.id,
    );

    final Finder finder = Finder(filter: Filter.equals('id', employee.id));

    print('${model.name} ${model.surname}');
    print(newChildren);
    print(employee.id);

    await _ekf_employees_database.update(await _db, model.toJson(),
        finder: finder);

    return child;
  }

  Future<List<Employee>> getEmployees() async {
    final result = await _ekf_employees_database.find(await _db);
    List<Employee> list = [];
    result.forEach((element) {
      list.add(EmployeeModel.fromJson(element.value));
    });
    return list;
  }
}
