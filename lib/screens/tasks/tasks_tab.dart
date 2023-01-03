import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_1/screens/tasks/task_Item.dart';

import '../../styles/my_theme.dart';

class TasksTab extends StatelessWidget {
  static const String routName='settings tab';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Stack(
              children: [
                Container(color: MyTheme.allBlue,height: 65,),
                CalendarTimeline(
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2022, 1, 1),
                  lastDate: DateTime(2025, 11, 20),
                  onDateSelected: (date) => print(date),
                  leftMargin: 20,
                  monthColor: MyTheme.allWhite,
                  dayColor: MyTheme.allBlack,
                  activeDayColor: MyTheme.allBlue,
                  activeBackgroundDayColor: MyTheme.allWhite,
                  dotsColor: MyTheme.allWhite,
                  selectableDayPredicate: (date) => true,
                  locale: 'en_ISO',
                ),
              ]),
          SizedBox(height: 10,),
          Expanded(child: ListView.builder(
            itemBuilder: (_, context) {
              return TaskItem();
            },
            itemCount: 10,
          ),),

        ],
      ),
    );
  }
}
