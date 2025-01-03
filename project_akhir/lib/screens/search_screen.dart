import 'package:flutter/material.dart';
import 'package:project_akhir/models/task.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // TODO: Deklarasi list tugas dan controller pencarian
  List<Task> allTasks = [];
  List<Task> searchedTasks = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // TODO: Load all tasks dari SharedPreferences atau database
  }

  void _searchTasks(String query) {
    setState(() {
      searchedTasks = allTasks.where((task) {
        return task.taskName.contains(query) ||
            task.subject.contains(query) ||
            task.dueDate.toString().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pencarian Tugas'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: _searchTasks,
              decoration: const InputDecoration(
                labelText: 'Cari tugas...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchedTasks.length,
              itemBuilder: (context, index) {
                final task = searchedTasks[index];
                return ListTile(
                  title: Text(task.taskName),
                  subtitle: Text(task.dueDate.toString()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
