import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddChildDialog extends StatefulWidget {
  final Function addChildHandler;

  const AddChildDialog({Key key, @required this.addChildHandler})
      : super(key: key);

  @override
  _AddChildDialogState createState() => _AddChildDialogState();
}

class _AddChildDialogState extends State<AddChildDialog> {
  String name = '';
  String surname = '';
  String patronym = '';
  String birthday = '';
  DateTime selectedDate = DateTime.now();

  bool fieldsValid = true;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate)
      setState(() {
        birthday = dateParser(picked);
      });
  }

  String dateParser(DateTime date) {
    final dateString = date.toString().substring(0, 10);
    final dateArr = dateString.split('-');

    return '${dateArr[2]}.${dateArr[1]}.${dateArr[0]}';
  }

  void submitHandler(context) {
    if (name.trim().length == 0 ||
        surname.trim().length == 0 ||
        patronym.trim().length == 0 ||
        birthday.trim().length == 0) {
      setState(() {
        fieldsValid = false;
      });
    } else {
      widget.addChildHandler(context, name, surname, patronym, birthday);
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
            Container(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Выбрать дату рождения')),
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
                child: Text('Добавить ребенка'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
