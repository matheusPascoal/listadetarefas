import 'dart:convert';

import 'package:listadetarefas/models/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';

//SHARED E SOMENTE PARA ARMAZENAMENTO SIMPLES
const todoListKey = 'todo_list';

class TodoRepository {
  TodoRepository() {
    late SharedPreferences sharedPreferences;
  }

  saveTodoList(List<Todo> todos) async {
    List<String> list_todos = [];
    for (Todo element in todos) {
      final jsonString = json.encode(element.toJson());
      list_todos.add(jsonString);
    }
    final sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setStringList(todoListKey, list_todos);
  }

  Future<List<Todo>> getTodoList() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final List<String>? list_String =
        sharedPreferences.getStringList(todoListKey);
    if (list_String != null) {
      return list_String
          .map<Todo>((e) => Todo.fromJson(json.decode(e)))
          .toList();
    }
    return <Todo>[];
  }
}
