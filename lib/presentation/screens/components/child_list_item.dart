import 'package:ekf_test_task/domain/entities/employee.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChildListItem extends StatelessWidget {
  final Child child;

  const ChildListItem({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.symmetric(
              horizontal: BorderSide(color: Colors.grey.shade300))),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3),
                child: Text(
                  'Фамилия: ${child.surname}',
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3),
                child: Text(
                  'Имя: ${child.name}',
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3),
                child: Text(
                  'Отчество: ${child.patronym}',
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3),
                child: Text(
                  'Дата рождения: ${child.birthday}',
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
