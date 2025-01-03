import 'package:flutter/material.dart';
import 'package:project_akhir/models/task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // TODO: Deklarasi list tugas
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    // TODO: Load tasks dari SharedPreferences atau database
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugasin'),
      ),
      body: tasks.isEmpty? const Center(child: Text('Tidak ada tugas.')): ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return ListTile(
            title: Text(task.taskName),
            subtitle: Text(task.dueDate.toString()),
            trailing: IconButton(
              icon: Icon(
                task.isFavorite? 
                Icons.favorite: 
                Icons.favorite_border,),
                onPressed: () {
                  // TODO: Toggle favorit task
                  setState(() {
                  task.isFavorite = !task.isFavorite;
                  }
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigasi ke halaman tambah tugas
          Navigator.pushNamed(context, '/add_task');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
