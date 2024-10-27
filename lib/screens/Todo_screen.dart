import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '/constants/text_styles.dart';
import '/views/gradient_container.dart';
import '/models/todo.dart';
import '/services/database_service.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final DatabaseService _databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height - 150,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'To Do in Case of Typhoon',
                  style: TextStyles.h1,
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 40),
              Expanded(child: _buildTodoList()),
            ],
          ),
        ),
        FloatingActionButton(
          onPressed: _displayTextInputDialog,
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 8.0, // Increased elevation for better visibility
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildTodoList() {
    return StreamBuilder<QuerySnapshot<Todo>>(
      stream: _databaseService.getTodos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        List<Todo> todos = snapshot.data?.docs.map((doc) => doc.data()).toList() ?? [];
        if (todos.isEmpty) {
          return const Center(
            child: Text(
              "Add a todo!",
              style: TextStyles.h1,
              textAlign: TextAlign.center,
            ),
          );
        }
        return ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            Todo todo = todos[index];
            String todoId = snapshot.data!.docs[index].id; // Get the document ID
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Card( // Use Card for better styling
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 4.0, // Add shadow to the card
                child: ListTile(
                  tileColor: Colors.grey[200], // Change the tile color to a lighter grey
                  title: Text(
                    todo.task,
                    style: TextStyles.h2.copyWith(color: Colors.black), // Ensure title is black for readability
                  ),
                  subtitle: Text(
                    DateFormat("dd-MM-yyyy h:mm a").format(todo.updatedOn.toDate()),
                    style: TextStyle(color: Colors.black54), // Use a darker color for subtitle
                  ),
                  trailing: Checkbox(
                    value: todo.isDone,
                    onChanged: (value) {
                      Todo updatedTodo = todo.copyWith(
                        isDone: !todo.isDone,
                        updatedOn: Timestamp.now(),
                      );
                      _databaseService.updateTodo(todoId, updatedTodo);
                    },
                  ),
                  onLongPress: () {
                    _databaseService.deleteTodo(todoId);
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _displayTextInputDialog() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Add a todo',
            style: TextStyles.h1,
          ),
          content: Container(
            padding: const EdgeInsets.all(8.0), // Add padding to the content
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: "Enter your todo here...",
                hintStyle: TextStyles.h2.copyWith(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              color: Theme.of(context).colorScheme.primary,
              textColor: Colors.white,
              child: const Text('Ok'),
              onPressed: () {
                Todo todo = Todo(
                  task: _textEditingController.text,
                  isDone: false,
                  createdOn: Timestamp.now(),
                  updatedOn: Timestamp.now(),
                );
                _databaseService.addTodo(todo);
                Navigator.pop(context);
                _textEditingController.clear();
              },
            ),
          ],
        );
      },
    );
  }
}