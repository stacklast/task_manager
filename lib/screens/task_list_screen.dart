import 'package:flutter/material.dart';
import 'package:task_manager/models/task.dart';
import 'package:task_manager/screens/add_task_screen.dart';
import 'package:task_manager/widgets/task_item.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<Task> tasks = [];

  void _addTask(Task task) {
    setState(() {
      tasks.add(task);
    });
  }

  void _removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Tarea eliminada'), duration: Duration(seconds: 2)),
    );
  }

  void _toggleTaskCompletion(int index) {
    setState(() {
      tasks[index].isCompleted = !tasks[index].isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gestión de Tareas',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white, // Color personalizado para el título
          ),
        ),
        centerTitle: true, // Centra el título
        backgroundColor: Theme.of(context).primaryColor, // Color del fondo de la AppBar acorde al tema
      ),
      body: tasks.isEmpty
          ? Center(child: Text('No hay tareas aún', style: Theme.of(context).textTheme.bodyMedium))
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) => TaskItem(
                task: tasks[index],
                onDelete: () => _removeTask(index),
                onToggleComplete: () => _toggleTaskCompletion(index),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTask = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );
          if (newTask != null) {
            _addTask(newTask);
          }
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
         child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary, // Color del icono del botón
        ), // Color de fondo del botón acorde al tema,
      ),
    );
  }
}
