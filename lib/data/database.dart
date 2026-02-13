import 'package:hive/hive.dart';

class TodoDatabase {
  List<Map<String, dynamic>> todos = [];
  // reference the box
  final box = Hive.box('mybox');

  void createInitialData() {
    todos = [
      {"task": "My first todo item", "completed": false},
      {"task": "My second todo item", "completed": true},
      {"task": "My third todo item", "completed": false},
    ];
  }

  // load the data from db
  void loadData() {
    final data = box.get("TODOLIST");
    if (data != null) {
      todos = List<Map<String, dynamic>>.from(
        (data as List).map((item) => Map<String, dynamic>.from(item as Map)),
      );
    } else {
      todos = [];
    }
  }

  // update the data in the db
  void updateData() {
    box.put("TODOLIST", todos);
  }

  void addTodo(String task) {
    box.add(task);
  }
}
