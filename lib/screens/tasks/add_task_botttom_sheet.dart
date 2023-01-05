import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_1/screens/tasks/task_model.dart';
import 'package:todo_1/styles/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      child: Container(height: MediaQuery.of(context).size.height*0.9,
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppLocalizations.of(context)!.add_new_task,
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
                        return AppLocalizations.of(context)!.enter_valid_title;
                      }
                      return null;
                    },
                    controller: titleController,
                    decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.task_title,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: MyTheme.allBlack))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (text) {
                      if (text == '') {
                        return AppLocalizations.of(context)!.enter_valid_description;
                      }
                      return null;
                    },
                    maxLines: 3,
                    controller: descriptionController,
                    decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.task_description,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    AppLocalizations.of(context)!.select_time,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
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
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(

                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          TaskData task = TaskData(
                              title: titleController.text,
                              date: DateUtils.dateOnly(sellectedDate).microsecondsSinceEpoch,
                              description: descriptionController.text);
                          showLoading(context, AppLocalizations.of(context)!.loading);
                          addTaskToFirebaseFirestore(task).then((value) {
                            hideLoading(context);
                            showMessage(context,
                                AppLocalizations.of(context)!.task_added,
                                AppLocalizations.of(context)!.ok,
                                    () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            }, negBtn: AppLocalizations.of(context)!.cancel, negAction: () {});
                          }).catchError((error) {
                            print(error);
                          });
                        }
                      },

                      child: Text(AppLocalizations.of(context)!.add_task))
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
