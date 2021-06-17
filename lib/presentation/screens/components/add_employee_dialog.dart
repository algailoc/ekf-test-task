import 'dart:math';

import 'package:ekf_test_task/domain/entities/employee.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddEmployeeDialog extends StatefulWidget {
  final Function addEmployeePressHandler;
  const AddEmployeeDialog({Key key, @required this.addEmployeePressHandler})
      : super(key: key);

  @override
  _AddEmployeeDialogState createState() => _AddEmployeeDialogState();
}

class _AddEmployeeDialogState extends State<AddEmployeeDialog> {
  String name = '';
  String surname = '';
  String patronym = '';
  String birthday = '';
  String position = '';

  bool fieldsValid = true;

  void submitHandler(context) {
    if (name.trim().length == 0) {
      setState(() {
        fieldsValid = false;
      });
    } else {
      widget.addEmployeePressHandler(
          context, name, surname, patronym, birthday, position);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        height: 400,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Имя'),
              onChanged: (value) {
                setState(() {
                  fieldsValid = true;
                  name = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Фамилия'),
              onChanged: (value) {
                setState(() {
                  fieldsValid = true;
                  surname = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Отчество'),
              onChanged: (value) {
                setState(() {
                  fieldsValid = true;
                  patronym = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Дата рождения'),
              onChanged: (value) {
                setState(() {
                  fieldsValid = true;
                  birthday = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Должность'),
              onChanged: (value) {
                setState(() {
                  fieldsValid = true;
                  position = value;
                });
              },
            ),
            !fieldsValid
                ? Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      'Пожалуйста, заполните все поля',
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                : Container(),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.amber)),
              onPressed: () => submitHandler(context),
              child: Container(
                width: double.infinity,
                child: Text('Добавить сотрудника'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
