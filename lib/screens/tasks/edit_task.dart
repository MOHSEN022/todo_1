import 'package:flutter/material.dart';
import 'package:todo_1/screens/tasks/task_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../components/components.dart';
import '../../database/database.dart';
import '../../styles/my_theme.dart';

class EditTask extends StatefulWidget {
  static const String routName = 'edit_task';

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  DateTime sellectedDate = DateTime.now();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var task = ModalRoute.of(context)?.settings.arguments as TaskData;
      titleController.text=task.title;
      descriptionController.text=task.title;
      sellectedDate=DateTime.fromMicrosecondsSinceEpoch(task.date);
      setState(() {});
    });


  }
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    var task = ModalRoute.of(context)?.settings.arguments as TaskData;

    return Scaffold(resizeToAvoidBottomInset: false,
      appBar: AppBar(backgroundColor: Theme.of(context).primaryColor,
        title: Text('TODO'),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                color: Theme.of(context).primaryColor,
                height: screenSize.height * 0.1,
              ),
              Container(
                height: screenSize.height * 0.7,
                width: screenSize.width * 0.8,
                margin: EdgeInsets.symmetric(horizontal: screenSize.width*0.1,),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(18),
                  color: Colors.white,
                ),
                child: Container(height: MediaQuery.of(context).size.height*0.9,
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.edit_task,
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,),
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
                              height: 30,
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
                                    task.title=titleController.text;
                                    task.description=descriptionController.text;
                                    task.date=sellectedDate.microsecondsSinceEpoch;
                                    showLoading(context, AppLocalizations.of(context)!.loading);
                                    updateTaskInFirebase(task).then((value) {
                                      hideLoading(context);
                                      showMessage(context,
                                          AppLocalizations.of(context)!.changes_saved,
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

                                child: Text(AppLocalizations.of(context)!.save_changes))
                          ]))
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
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
  }}



/*****************cgfbfgngh*************/
// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:todo_1/screens/tasks/task_model.dart';
//
// import '../../components/components.dart';
// import '../../database/database.dart';
// import '../../styles/my_theme.dart';
//
// class EditTask extends StatefulWidget {
//
//   static const String routeName = 'edit_task';
//
//   @override
//   State<EditTask> createState() => _EditTaskState();
// }
//
// class _EditTaskState extends State<EditTask> {
//
//
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//
//   DateTime sellectedDate = DateTime.now();
//
//   @override
//   Widget build(BuildContext context) {
//     var task = ModalRoute.of(context)!.settings.arguments as TaskData;
//     var titleController = TextEditingController(text: task.title);
//
//     var descriptionController = TextEditingController(text: task.description);
//     return Scaffold(
//       appBar: AppBar(),
//       body: Container(
//         child: SingleChildScrollView(
//           child: Container(
//             height: MediaQuery.of(context).size.height * 0.9,
//             padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Text(
//                   AppLocalizations.of(context)!.edit_task,
//                   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Form(
//                     key: formKey,
//                     child: Column(children: [
//                       TextFormField(
//                         validator: (text) {
//                           if (text == '') {
//                             return AppLocalizations.of(context)!
//                                 .enter_valid_title;
//                           }
//                           return null;
//                         },
//                         controller: titleController,
//                         decoration: InputDecoration(
//                             hintText: AppLocalizations.of(context)!.task_title,
//                             border: OutlineInputBorder(
//                                 borderSide:
//                                     BorderSide(color: MyTheme.allBlack))),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       TextFormField(
//                         validator: (text) {
//                           if (text == '') {
//                             return AppLocalizations.of(context)!
//                                 .enter_valid_description;
//                           }
//                           return null;
//                         },
//                         maxLines: 3,
//                         controller: descriptionController,
//                         decoration: InputDecoration(
//                             hintText:
//                                 AppLocalizations.of(context)!.task_description,
//                             border: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                     color: Theme.of(context).primaryColor))),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         AppLocalizations.of(context)!.select_time,
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 20),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       InkWell(
//                         onTap: () {
//                           showPicker(context);
//                         },
//                         child: Text(
//                           '${sellectedDate.day}/${sellectedDate.month}/${sellectedDate.year}',
//                           style: TextStyle(
//                               color: MyTheme.allBlue,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 30),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       ElevatedButton(
//                           onPressed: () {
//                             if (formKey.currentState!.validate()) {
//                               TaskData task = TaskData(
//                                   title: titleController.text,
//                                   date: DateUtils.dateOnly(sellectedDate)
//                                       .microsecondsSinceEpoch,
//                                   description: descriptionController.text);
//                               showLoading(context,
//                                   AppLocalizations.of(context)!.loading);
//                               addTaskToFirebaseFirestore(task).then((value) {
//                                 hideLoading(context);
//                                 showMessage(
//                                     context,
//                                     AppLocalizations.of(context)!.task_added,
//                                     AppLocalizations.of(context)!.ok, () {
//                                   Navigator.pop(context);
//                                   Navigator.pop(context);
//                                 },
//                                     negBtn:
//                                         AppLocalizations.of(context)!.cancel,
//                                     negAction: () {});
//                               }).catchError((error) {
//                                 print(error);
//                               });
//                             }
//                           },
//                           child: Text(AppLocalizations.of(context)!.add_task))
//                     ]))
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void showPicker(BuildContext context) async {
//     DateTime? choosenDate = await showDatePicker(
//         context: context,
//         initialDate: sellectedDate,
//         firstDate: DateTime.now(),
//         lastDate: DateTime.now().add(Duration(days: 365)));
//     if (choosenDate == null) return;
//     sellectedDate = choosenDate;
//     // setState(() {});
//   }
// }
