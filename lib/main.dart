import 'package:flutter/material.dart';
import 'package:task_manager/screens/task_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // 🔴 Oculta la etiqueta de Debug
      title: 'Gestión de Tareas',
      theme: ThemeData(
        primaryColor: Colors.blue,
        primarySwatch: Colors.lightBlue,
      ),
      home: TaskListScreen(),
    );
  }
}
