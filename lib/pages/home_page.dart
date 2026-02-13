import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/utils/dialogbox.dart';
import 'package:todo_app/utils/to_do_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // get the box
  final box = Hive.box('mybox');

  TodoDatabase database = TodoDatabase();

  @override
  void initState() {
    super.initState();

    // check if the box is empty
    if (box.get("TODOLIST") == null) {
      database.createInitialData();
    } else {
      database.loadData();
    }
  }

  // text editing controller
  final _controller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      database.todos[index]["completed"] = value;
    });
    database.updateData();
  }

  // save new task
  void saveNewTask() {
    setState(() {
      database.todos.add({"task": _controller.text, "completed": false});
      _controller.clear();
    });
    Navigator.of(context).pop();
    database.updateData();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      database.todos.removeAt(index);
    });
    database.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(title: Text("TO DO LIST")),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black87,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: database.todos.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: database.todos[index]["task"],
            taskCompleted: database.todos[index]["completed"],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteTask: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
