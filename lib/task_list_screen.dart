import 'package:flutter/material.dart';
import 'package:ui_ux/Task.dart';
import 'package:ui_ux/add_edit_task_screen.dart';

class Task {
  String note;
  String status;
  String link;
  String task;

  Task(this.note, this.status, this.link, this.task);
}

class TaskListScreen extends StatelessWidget {
  final List<Task> tasks = [
    Task("Buy groceries", "Pending", "https://example.com", "Buy milk and bread"),
    Task("Call mom", "Completed", "https://example.com", "Ask about her health"),
    Task("Meeting with team", "In Progress", "https://example.com", "Discuss project status"),
  ];

  void _navigateToAddEditTaskScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddEditTaskScreen(), // تأكد من أن الشاشة الأخرى موجودة ومستوردة بشكل صحيح
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return ListTile(
                  title: Text(task.note),
                  subtitle: Text('Status: ${task.status}'),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _navigateToAddEditTaskScreen(context),
      ),
    );
  }
}
