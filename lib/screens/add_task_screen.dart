import 'package:flutter/material.dart';
import 'package:task_manager/models/task.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  void _submitTask(BuildContext context) {
    if (_titleController.text.isEmpty || _descriptionController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Campos Vacíos'),
          content: Text('Por favor, ingrese un título y una descripción.'),
          actions: [
            TextButton(onPressed: () => Navigator.of(ctx).pop(), child: Text('OK')),
          ],
        ),
      );
      return;
    }

    final newTask = Task(
      title: _titleController.text,
      description: _descriptionController.text,
    );

    Navigator.pop(context, newTask);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Agregar Tarea')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Descripción'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _submitTask(context),
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontSize: 18),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                backgroundColor: Theme.of(context).primaryColor,
              ),
              child: Text(
                'Agregar',
                style: TextStyle(color: Colors.white), // Cambia el color del texto
              ),
            ),
          ],
        ),
      ),
    );
  }
}
