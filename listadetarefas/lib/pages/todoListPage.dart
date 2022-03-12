import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController emailControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  // O CONTROLLER VINCULA O CAMPO DE TEXTO COM O CONTROLER
                  controller: emailControler,
                  decoration: InputDecoration(labelText: 'Email'),
                  onChanged: onChanged,
                ),
                ElevatedButton(onPressed: login, child: Text('entrar'))
              ],
            ),
          ),
        ));
  }

  login() {
    String text = emailControler.text;
    print('text');
  }

  onChanged(String text) {
    print('text');
  }
}
