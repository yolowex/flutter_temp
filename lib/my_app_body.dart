import 'package:flutter/material.dart';
import 'package:joma/main.dart';
import 'package:provider/provider.dart';

import 'main_task.dart';

class MyAppBody extends StatefulWidget {
  @override
  State<MyAppBody> createState() => _MyAppBodyState();
}

class _MyAppBodyState extends State<MyAppBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Generator(),
          Expanded(
            flex: 9,
            child: TaskList(),
          ),
        ],
      ),
    );
  }
}

class Generator extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  void onGenerate(BuildContext context) {
    var appState = Provider.of<AppState>(context, listen: false);
    if (controller.text != "") {
      appState.addTask(Task(controller.text));
      controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              child: TextField(

            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Input task to be done"),
          )),
          SizedBox(
            width: 25,
          ),
          IconButton(
              onPressed: () => onGenerate(context), icon: Icon(Icons.done))
        ],
      ),
    );
  }
}



class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context);

    List<Widget> taskList = [];

    if (appState.navBarSelectedIndex == 0){
      taskList = appState.taskList;
    }
    else if (appState.navBarSelectedIndex == 1){
      taskList = appState.taskList.where((i) => i.isChecked == true).toList();
    }
    else{
      taskList = appState.taskList.where((i) => i.isChecked == false).toList();
    }




    return Container(color: Colors.black26,child: ListView(children: taskList));
  }
}
