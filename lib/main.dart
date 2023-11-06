import 'package:flutter/material.dart';
import 'package:joma/my_app_body.dart';
import 'package:provider/provider.dart';
import 'package:joma/my_app_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AppState(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: MyAppBar(),
              body: MyAppBody(),
            )));
  }
}

class AppState extends ChangeNotifier {
  List<Task> _taskList = [];
  List<Task> get taskList => List.unmodifiable(_taskList);

  void addTask(Task task) {
    _taskList.add(task);
    notifyListeners();
  }

  void remTask(Task task){
    if (_taskList.contains(task)){
      _taskList.remove(task);
      notifyListeners();
    }
  }

  void callNotifyListeners(){
    notifyListeners();
  }
}
