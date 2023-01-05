import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_1/screens/tasks/task_model.dart';
import 'package:todo_1/styles/my_theme.dart';
import '../../database/database.dart';
import '../../providers/setting_provider.dart';
import 'edit_task.dart';

class TaskItem extends StatelessWidget {
  TaskData task;

  TaskItem(this.task);

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);

    return Container(
      padding: const EdgeInsets.all(10),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 0.4,
          motion: DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (buildContext) {
                deleteTaskFromFirestore(task);
              },
              backgroundColor: MyTheme.allRed,
              icon: Icons.delete,
              label: AppLocalizations.of(context)!.delete,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12)),
              foregroundColor: MyTheme.allWhite,
            ),
            SlidableAction(
              onPressed: (buildContext) => Navigator.of(context).pushNamed(EditTask.routName,arguments: task),
              backgroundColor: MyTheme.allBlue,
              icon: Icons.edit,
              label: AppLocalizations.of(context)!.edit,
              foregroundColor: MyTheme.allWhite,
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          // margin: EdgeInsets.all(10),
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12)),
            color: MyTheme.allWhite,
          ),
          child: Row(
            children: [
              Container(
                height: 90,
                width: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: task.isDone
                      ? MyTheme.allGreen
                      : MyTheme.allBlue,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          task.title,
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: task.isDone
                                  ? MyTheme.allGreen
                                  : MyTheme.allBlue),
                        ),
                        Text(
                          task.description,
                          style: Theme.of(context).textTheme.headline4,
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                        onTap: () {
                          settingsProvider.editIsDone(task);
                        },
                        child: task.isDone
                            ? Text(
                          AppLocalizations.of(context)!.done,
                          style: TextStyle(color: MyTheme.allGreen,fontSize: 30,fontWeight: FontWeight.bold),
                        )
                            : Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: task.isDone
                                    ? MyTheme.allGreen
                                    : MyTheme.allBlue,
                                borderRadius: BorderRadius.circular(8)),
                            child: Icon(
                              Icons.done,
                              color: MyTheme.allWhite,
                              size: 40,
                            )))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }



}


/*
                deleteTaskFromFirestore(task);

                                    showLoading(context, AppLocalizations.of(context)!.loading);
                                    updateTaskInFirebase(task).then((value) {
                                      hideLoading(context);
                                      showMessage(context,
                                          AppLocalizations.of(context)!.changes_saved,
                                          AppLocalizations.of(context)!.ok,
                                              () {
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          }



 */