import 'package:ekf_test_task/data/employees_repository_impl.dart';
import 'package:ekf_test_task/domain/employee_usecases.dart';
import 'package:ekf_test_task/presentation/bloc/employees_bloc.dart';
import 'package:ekf_test_task/presentation/screens/employees_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  EmployeesBloc employeesBloc;

  @override
  void initState() {
    employeesBloc = EmployeesBloc(
        getEmployeesUsecase:
            GetEmployeesUsecase(repository: EmployeesRepositoryImpl()),
        addEmployeeUsecase:
            AddEmployeeUsecase(repository: EmployeesRepositoryImpl()),
        addChildUsecase:
            AddChildUsecase(repository: EmployeesRepositoryImpl()));

    employeesBloc.add(GetEmployeesListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => employeesBloc,
        child: MaterialApp(
            theme: ThemeData(
              primaryColor: Colors.amber,
            ),
            title: 'Test employees app',
            home: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text('Test employees app'),
              ),
              body: EmployeesList(),
            )));
  }
}
