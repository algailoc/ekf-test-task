import 'package:ekf_test_task/domain/entities/employee.dart';
import 'package:ekf_test_task/presentation/screens/employee_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmployeeCard extends StatelessWidget {
  final Employee employee;
  final TextStyle textStyle = TextStyle(
    fontSize: 16,
    color: Colors.white,
  );

  EmployeeCard({Key key, @required this.employee}) : super(key: key);

  void cardPressHandler(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => EmployeeScreen(
                employee: employee,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => cardPressHandler(context),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.blue.shade200,
        ),
        margin: EdgeInsets.symmetric(vertical: 12),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  employee.surname,
                  style: textStyle,
                ),
                Text(
                  employee.name,
                  style: textStyle,
                ),
                Text(
                  employee.patronym,
                  style: textStyle,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  employee.birthday,
                  style: textStyle,
                ),
                Text(
                  employee.position,
                  style: textStyle,
                ),
                employee.children.length > 0
                    ? Text('Дети: ${employee.children.length}')
                    : Container()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
