import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_1/screens/settings/settings_tab.dart';
import 'package:todo_1/screens/tasks/add_task_botttom_sheet.dart';
import 'package:todo_1/screens/tasks/tasks_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../styles/my_theme.dart';

class HomeLayout extends StatefulWidget {
  static const String routName = 'home';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int selectedIndexTab =0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.app_title),
          ),
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 8,
            child: BottomNavigationBar(
              currentIndex: selectedIndexTab,
              onTap: (index){
                selectedIndexTab=index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.list),label: AppLocalizations.of(context)!.tasks_list),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: AppLocalizations.of(context)!.settings),
              ],
            ),
          ),

          floatingActionButton: FloatingActionButton(
            elevation: 0,
            shape:StadiumBorder(side: BorderSide(color: MyTheme.allWhite, width: 3)),
            onPressed: () {
              showAddTaskBottomSheet();
            },
            child: Icon(Icons.add),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          body: tabs[selectedIndexTab],

    ));
  }

  var tabs =[TasksTab(),SettingsTab()];

  void showAddTaskBottomSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context, builder: (buildContext){
      return AddTask();
    });
  }
}
