import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
  };

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App',
      debugShowCheckedModeBanner: false,
      home: TodoPage(),
    );
  }
}

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TextEditingController _taskController = TextEditingController();

  void _addTask(String task) {
    if (task.trim().isEmpty) return;
    FirebaseFirestore.instance.collection('tasks').add({'task': task});
    _taskController.clear();
  }

  void _deleteTask(String docId) {
    FirebaseFirestore.instance.collection('tasks').doc(docId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mis Tareas")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _taskController,
              decoration: InputDecoration(
                labelText: "Nueva Tarea",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => _addTask(_taskController.text),
                ),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('tasks').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text("No hay tareas aún"));
                }

                final tasks = snapshot.data!.docs;
                return ListView(
                  children: tasks.map((task) {
                    return ListTile(
                      title: Text(task['task']),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteTask(task.id),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
