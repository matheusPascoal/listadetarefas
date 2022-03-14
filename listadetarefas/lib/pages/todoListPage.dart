import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  TextEditingController todosController = TextEditingController();
  List<String> todos = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      ),
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
                          todos.add(text);
                        });
                        todosController.clear();
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
              Flexible(
                  child: ListView(
                shrinkWrap: true,
                children: [
                  // ESSE FOR DIZ QUE QUER AS INFOS DE TAREFA ATE AS TAREFAS
                  // DE PONTA A PONTA
                  for (String todo in todos)
                    ListTile(
                      //CHAMA O TEXTO QUE ESTA DENTRO DA LISTA
                      title: Text('Tarefa: $todo'),
                      leading: Icon(Icons.save),
                    )
                ],
              )),
              Row(
                children: [
                  Expanded(child: Text('Você possui 0 tarefas pendentes')),
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
        ),
      ),
    );
  }
}
