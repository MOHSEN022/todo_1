import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_1/screens/tasks/task_Item.dart';
import 'package:todo_1/screens/tasks/task_model.dart';
import '../../database/database.dart';
import '../../providers/setting_provider.dart';
import '../../styles/my_theme.dart';

class TasksTab extends StatefulWidget {
  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  DateTime currentDate = DateTime.now() ;

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);

    return Container(
      child: Column(
        children: [
          Stack(
              children: [
                Container(color: MyTheme.allBlue,height: 65,),
                CalendarTimeline(
                  initialDate: currentDate,
                  firstDate: DateTime.now().subtract(Duration(days: 365)),
                  lastDate: DateTime.now().add(Duration(days: 365)),
                  onDateSelected: (date) {
                    currentDate = date;
                    setState(() {});
                  },
                  leftMargin: 20,
                  monthColor: MyTheme.allWhite,
                  dayColor: MyTheme.allGrey,
                  activeDayColor: MyTheme.allBlue,
                  activeBackgroundDayColor: MyTheme.allWhite,
                  selectableDayPredicate: (date) => true,
                  locale: settingsProvider.currentLanguage,
                ),
              ]),
          SizedBox(height: 10,),
          Expanded(
            child:StreamBuilder<QuerySnapshot<TaskData>>(
                stream: getTasksFromFirestore(currentDate),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Something went wrong'));
                  }
                  var tasks =
                      snapshot.data?.docs.map((doc) => doc.data()).toList() ?? [];
                  print(tasks);
                  if (tasks.isEmpty) {
                    return Center(child: Text('No tasks for this day'));
                  }
                  return Container(
                    child: ListView.builder(
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          return TaskItem(tasks[index]);
                        }),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
