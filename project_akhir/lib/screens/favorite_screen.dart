import 'package:flutter/material.dart';
import 'package:project_akhir/models/task.dart';


class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  // TODO: Deklarasi list tugas favorit
  List<Task> favoriteTasks = [];

  @override
  void initState() {
    super.initState();
    // TODO: Load favorit tugas dari SharedPreferences atau database
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas Favorit'),
      ),
      body: favoriteTasks.isEmpty? 
      const Center(child: Text('Tidak ada tugas favorit.')): ListView.builder(
        itemCount: favoriteTasks.length,
        itemBuilder: (context, index) {
          final task = favoriteTasks[index];
          return ListTile(
            title: Text(task.taskName),
            subtitle: Text(task.dueDate.toString()),
          );
        },
      ),
    );
  }
}
