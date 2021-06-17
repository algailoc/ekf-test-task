import 'package:ekf_test_task/domain/entities/employee.dart';
import 'package:ekf_test_task/presentation/bloc/employees_bloc.dart';
import 'package:ekf_test_task/presentation/screens/components/add_employee_dialog.dart';
import 'package:ekf_test_task/presentation/screens/components/employee_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeesList extends StatefulWidget {
  const EmployeesList({Key key}) : super(key: key);

  @override
  _EmployeesListState createState() => _EmployeesListState();
}

class _EmployeesListState extends State<EmployeesList> {
  void addEmployeeButtonHandler() {
    showDialog(
        context: context,
        builder: (context) {
          return AddEmployeeDialog(
            addEmployeePressHandler: addEmployeeHandler,
          );
        });
  }

  void addEmployeeHandler(context, String name, String surname, String patronym,
      String birthday, String position) {
    BlocProvider.of<EmployeesBloc>(context).add(AddEmployeeEvent(
      surname: surname,
      name: name,
      patronym: patronym,
      birthday: birthday,
      position: position,
    ));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeesBloc, EmployeesState>(
        builder: (context, state) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Список сотрудников',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: state.employeesList.length,
                  itemBuilder: (context, index) {
                    return EmployeeCard(employee: state.employeesList[index]);
                  }),
            ),
            FloatingActionButton(
              backgroundColor: Colors.amber,
              onPressed: addEmployeeButtonHandler,
              child: Icon(Icons.add),
            ),
          ],
        ),
      );
    });
  }
}
