import 'package:ekf_test_task/domain/entities/employee.dart';
import 'package:ekf_test_task/presentation/bloc/employees_bloc.dart';
import 'package:ekf_test_task/presentation/screens/components/add_child_dialog.dart';
import 'package:ekf_test_task/presentation/screens/components/child_list_item.dart';
import 'package:ekf_test_task/presentation/screens/components/employee_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeScreen extends StatefulWidget {
  final Employee employee;

  const EmployeeScreen({Key key, @required this.employee}) : super(key: key);

  @override
  _EmployeeScreenState createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  void goBackHandler(BuildContext context) {
    Navigator.pop(context);
  }

  void addChildButtonHandler(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AddChildDialog(
            addChildHandler: addChildHandler,
          );
        });
  }

  void addChildHandler(
      context, String name, String surname, String patronym, String birthday) {
    BlocProvider.of<EmployeesBloc>(context).add(AddChildEvent(
      surname: surname,
      name: name,
      patronym: patronym,
      birthday: birthday,
      employee: widget.employee,
    ));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: BlocBuilder<EmployeesBloc, EmployeesState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 40.0,
                          height: 40.0,
                          child: new RawMaterialButton(
                            elevation: 0.0,
                            onPressed: () => goBackHandler(context),
                            child: Center(
                                child: Icon(
                              Icons.arrow_back_ios,
                            )),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: EmployeeCard(
                        employee: state.employeesList
                            .firstWhere((el) => el.id == widget.employee.id),
                        touchable: false,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Дети:',
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    Expanded(
                      child: state.employeesList
                                  .firstWhere(
                                      (el) => el.id == widget.employee.id)
                                  .children
                                  .length ==
                              0
                          ? Text('Список пуст')
                          : ListView.builder(
                              itemCount: state.employeesList
                                  .firstWhere(
                                      (el) => el.id == widget.employee.id)
                                  .children
                                  .length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: ChildListItem(
                                    child: state.employeesList
                                        .firstWhere(
                                            (el) => el.id == widget.employee.id)
                                        .children[index],
                                  ),
                                );
                              },
                            ),
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.amber,
                      onPressed: () => addChildButtonHandler(context),
                      child: Icon(Icons.add),
                    ),
                  ],
                );
              },
            )),
      ),
    );
  }
}
