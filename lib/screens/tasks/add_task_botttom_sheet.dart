import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_1/screens/tasks/task_model.dart';
import 'package:todo_1/styles/my_theme.dart';

import '../../components/components.dart';
import '../../database/database.dart';

class AddTask extends StatefulWidget {
  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var titleController = TextEditingController();

  var descriptionController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  DateTime sellectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add New Task',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Form(
                key: formKey,
                child: Column(children: [
                  TextFormField(
                    validator: (text) {
                      if (text == '') {
                        return 'Please Enter title';
                      }
                      return null;
                    },
                    controller: titleController,
                    decoration: InputDecoration(
                        hintText: 'Task title',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: MyTheme.allBlack))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (text) {
                      if (text == '') {
                        return 'Please Enter description';
                      }
                      return null;
                    },
                    maxLines: 3,
                    controller: descriptionController,
                    decoration: InputDecoration(
                        hintText: 'Task description',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Select Date',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      showPicker(context);
                    },
                    child: Text(
                      '${sellectedDate.day}/${sellectedDate.month}/${sellectedDate.year}',
                      style: TextStyle(
                          color: MyTheme.allBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(

                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          TaskData task = TaskData(
                              title: titleController.text,
                              date: DateUtils.dateOnly(sellectedDate).microsecondsSinceEpoch,
                              id: 'dsgvbsdgb',
                              description: descriptionController.text);
                          showLoading(context, 'Loading.....');
                          addTaskToFirebaseFirestore(task).then((value) {
                            hideLoading(context);
                            showMessage(context, 'Task Added ', 'OK', () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            }, negBtn: 'Cancel', negAction: () {});
                          }).catchError((error) {
                            print(error);
                          });
                        }
                      },

                      child: Text('Add Task'))
                ]))
          ],
        ),
      ),
    );
  }

  void showPicker(BuildContext context) async {
    DateTime? choosenDate = await showDatePicker(
        context: context,
        initialDate: sellectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (choosenDate == null) return;
    sellectedDate = choosenDate;
    setState(() {});
  }
}
