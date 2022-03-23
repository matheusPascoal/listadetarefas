import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:listadetarefas/models/todo.dart';
import 'package:listadetarefas/repositories/todo_repositoy.dart';
import 'package:listadetarefas/widget/TodoListItem.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController todosController = TextEditingController();
  final TodoRepository todoRepository = TodoRepository();
  List<Todo> todos = [];
  Todo? deletedTodo;
  int? deletedeTodoPos;
  getList() async {
    var result = await todoRepository.getTodoList();
    todos = result;
    setState(() {});
  }

  @override
  initState() {
    super.initState();
    getList();
    // todoRepository.getTodoList().then((value) {
    //   setState(() {
    //     todos = value;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Lista de Tarefas',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: todosController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Adicione uma tarefa',
                            hintText: 'Ex. Estudar Flutter'),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          // VE OQUE ESTA DENTRO DO CAMPO COM O CONTROLER
                          String text = todosController.text;
                          setState(() {
                            //OBJETO Todo
                            Todo newTodo = Todo(
                              //DATA E HORA ATUAL
                              dateTime: DateTime.now(),
                              title: text,
                            );
                            //ADICIONADO A VARIAVEL TodoNew QUE CHAMA A CLASS DE TODO QUE FOI CRIADA
                            todos.add(newTodo);
                          });
                          todosController.clear();
                          todoRepository.saveTodoList(todos);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0XFF01EEFF),
                          padding: EdgeInsets.all(12),
                        ),
                        child: Icon(
                          Icons.add,
                          size: 50,
                        )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      // ESSE ForIN DIZ QUE QUER AS INFOS DE TAREFA ATE AS TAREFAS
                      // DE PONTA A PONTA
                      for (Todo todo in todos)
                        Row(
                          children: [
                            TodoListItem(
                              todo: todo,
                              onDelete: onDelete,
                            ),
                          ],
                        ),

                      Row(
                        children: [
                          Expanded(
                              child: Text(
                                  'Você possui ${todos.length} tarefas pendentes')),
                          ElevatedButton(
                              onPressed: () {
                                String text = todosController.text;
                                setState(() {
                                  todos.clear();
                                });
                              },
                              child: Text('Limpar tudo'))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  onDelete(Todo todo) {
    deletedTodo = todo;
    deletedeTodoPos = todos.indexOf(todo);
    setState(() {
      todos.remove(todo);
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        'Tarefa ${todo.title} foi rmovida com sucesso!',
        style: TextStyle(color: Colors.grey),
      ),
      backgroundColor: Colors.white,
      action: SnackBarAction(
          label: 'Desfazer',
          onPressed: () {
            setState(() {
              todos.insert(deletedeTodoPos!, deletedTodo!);
            });
          }),
    ));
  }
}
