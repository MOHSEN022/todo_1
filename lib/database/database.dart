import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../screens/tasks/task_model.dart';

CollectionReference<TaskData> getTasksCollection() {
  return FirebaseFirestore.instance.collection("tasks").withConverter<TaskData>(
      fromFirestore: (snapshot, SP) => TaskData.fromJson(snapshot.data()!),
      toFirestore: (task, sp) => task.toJson());
}

Future<void> addTaskToFirebaseFirestore(TaskData) {
  var collection = getTasksCollection();
  var docRef = collection.doc();
  print('$docRef');
  TaskData.id = docRef.id;
  return docRef.set(TaskData);
}

Stream<QuerySnapshot<TaskData>> getTasksFromFirestore(DateTime dateTime) {
  return getTasksCollection()
      .where('date',
      isEqualTo: DateUtils.dateOnly(dateTime).microsecondsSinceEpoch)
      .snapshots();
}

Future<void> deleteTaskFromFirestore(TaskData task){
  return getTasksCollection().doc(task.id).delete();
}

Future<void> editIsdoneInFirebase(TaskData task){
  return getTasksCollection().doc(task.id).update({'isDone': !task.isDone,});
}

Future<void> updateTaskInFirebase(TaskData task){
  return getTasksCollection().doc(task.id).update(task.toJson());
}

Future<void> deleteTaskInFirebase(TaskData task){
  return getTasksCollection().doc(task.id).delete();
}

