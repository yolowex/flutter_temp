import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar({Key? key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    void noAction() {}
    ;

    return AppBar(
        title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: noAction, icon: Icon(Icons.list_outlined)),
        Text("Todo App"),
        IconButton(onPressed: noAction, icon: Icon(Icons.search)),
      ],
    ));
  }
}
