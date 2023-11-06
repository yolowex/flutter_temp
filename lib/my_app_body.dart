
import 'package:flutter/material.dart';
import 'package:joma/main.dart';
import 'package:provider/provider.dart';

class MyAppBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
              child: Generator()
          ),
          Expanded(
              child: TaskList(),
          )
        ],
      ),
    );
  }
}

class Generator extends StatelessWidget {

  final TextEditingController controller = TextEditingController();

  void onGenerate(BuildContext context) {
    var appState = Provider.of<AppState>(context, listen: false);
    if (controller.text != ""){
      appState.addTask(Task(controller.text));
      print(appState.taskList);
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
            minLines: 1,
            maxLines: 3,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "Input task to be done"),
          )),
          SizedBox(
            width: 25,
          ),
          IconButton(onPressed: () => onGenerate(context), icon: Icon(Icons.done))
        ],
      ),
    );
  }
}

class Task extends StatelessWidget {
  final String text;
  Task(this.text);

  void onEdit(BuildContext context) {
    }

  void onDelete(BuildContext context) {
    var appState = Provider.of<AppState>(context,listen: false);
    appState.remTask(this);
  }

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme.bodyMedium!.copyWith();

    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Text(text, style: textStyle)),
          SizedBox(
            width: 15,
          ),
          IconButton(onPressed: () => onDelete(context), icon: Icon(Icons.delete)),
          SizedBox(
            width: 15,
          ),
          IconButton(onPressed: () => onEdit(context), icon: Icon(Icons.edit)),
        ],
      ),
    );
  }
}

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var taskList = Provider.of<AppState>(context).taskList;
    return Container(
      color: Colors.black54,
      child: ListView(
        children: taskList
      ),
    );
  }
}
