import 'package:flutter/material.dart';
import 'package:todo_app/widgets/todo.dart';

import '../Model/todo_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ToDoModel> todos = [];

  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        centerTitle: true,
      ),
      body: Column(
          children: [
           Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    return
                        InkWell(
                          onTap: (){
                            todos[index].check = !todos[index].check;
                            setState(() {

                            });
                          },
                          child: Row(
                            children: [
                              Expanded(
                                child: Todo(
                                    title: todos[index].title,
                                    desc: todos[index].desc,
                                    done: todos[index].check
                                ),
                              ),
                              IconButton(onPressed: (){
                                todos.removeAt(index);
                                setState(() {

                                });
                              }, icon: const Icon(Icons.delete),),
                            ],
                          ),
                        );
                  },),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: title,
                        decoration:
                        const InputDecoration(hintText: 'Title'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: desc,
                        decoration: const InputDecoration(hintText: 'desc'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (title.text.isNotEmpty && desc.text.isNotEmpty) {
                        todos.add(
                          ToDoModel(title.text, desc.text, false),
                        );
                        setState(() {});
                      }
                    },
                    child: const Text('Add Todo'),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
