import 'package:flutter/material.dart';
import 'package:todo_1/database/database.dart';

import '../screens/tasks/task_model.dart';

class SettingsProvider extends ChangeNotifier{
  ThemeMode currentTheme = ThemeMode.light;
  String currentLanguage='en';

  void changeTheme(ThemeMode newMode){
    currentTheme=newMode;
    notifyListeners();
  }

  bool isDarkMode(){
    return currentTheme == ThemeMode.dark;
  }

  void changeLocale(String newLanguage){
    currentLanguage=newLanguage;
    notifyListeners();

  }

  void editIsDone(TaskData task){
    editIsdoneInFirebase(task);
  }

}