import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class Task extends StatefulWidget {
  String text;
  bool isBeingEdited = false;
  Task(this.text);
  TextEditingController editingController = TextEditingController();
  bool? isChecked = false;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  void onEdit(BuildContext context) {
    setState(() {
      widget.isBeingEdited = true;
      widget.editingController.text = widget.text;
    });
  }

  void onEditSubmit(BuildContext context) {
    setState(() {
      widget.text = widget.editingController.text;
      widget.isBeingEdited = false;
    });

    if (widget.text == "") {
      onDelete(context);
    }
  }

  void onEditCancel(BuildContext context) {
    setState(() {
      widget.isBeingEdited = false;
    });
  }

  void onDelete(BuildContext context) {
    var appState = Provider.of<AppState>(context, listen: false);
    appState.remTask(widget);
  }

  Widget editView(BuildContext context) {
    var textStyle = Theme.of(context).textTheme.bodyMedium!.copyWith();

    return Container(
      color: Colors.green.shade400,
      child: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: TextField(
              style: textStyle,
              controller: widget.editingController,
            )),
            SizedBox(
              width: 15,
            ),
            IconButton(
                onPressed: () => onEditCancel(context),
                icon: Icon(Icons.cancel)),
            SizedBox(
              width: 15,
            ),
            IconButton(
                onPressed: () => onEditSubmit(context), icon: Icon(Icons.done)),
          ],
        ),
      ),
    );
  }

  Widget defaultView(BuildContext context) {
    var textStyle = Theme.of(context).textTheme.bodyMedium!.copyWith();

    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(
              value: widget.isChecked,
              onChanged: (newValue) {
                setState(() {
                  widget.isChecked = !widget.isChecked!;
                });
              }),
          SizedBox(
            width: 15,
          ),
          Expanded(child: SelectableText(widget.text, style: textStyle)),
          SizedBox(
            width: 15,
          ),
          IconButton(
              onPressed: () => onDelete(context), icon: Icon(Icons.delete)),
          SizedBox(
            width: 15,
          ),
          IconButton(onPressed: () => onEdit(context), icon: Icon(Icons.edit)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isBeingEdited) {
      return editView(context);
    }
    return defaultView(context);
  }
}
