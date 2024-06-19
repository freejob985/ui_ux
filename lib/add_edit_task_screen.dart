import 'package:flutter/material.dart';
import 'package:ui_ux/Task.dart';
import 'task_list_screen.dart';

class AddEditTaskScreen extends StatefulWidget {


  @override
  _AddEditTaskScreenState createState() => _AddEditTaskScreenState();
}

class _AddEditTaskScreenState extends State<AddEditTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _noteController;
  late TextEditingController _linkController;
late  TextEditingController _taskController;


  @override
  void initState() {
    super.initState();
    _noteController = TextEditingController();
    _linkController = TextEditingController();
    _taskController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _noteController,
                decoration: InputDecoration(labelText: 'Note'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a note';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField(
                value: "Pending",
                items: ['Pending', 'In Progress', 'Completed']
                    .map((status) => DropdownMenuItem(
                          child: Text(status),
                          value: status,
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    // _status = value!;
                  });
                },
                decoration: InputDecoration(labelText: 'Status'),
                validator: (value) {
                  if (value == null) {
                    return 'Please select a status';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _linkController,
                decoration: InputDecoration(labelText: 'Link'),
                keyboardType: TextInputType.url,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a link';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _taskController,
                decoration: InputDecoration(labelText: 'Task'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a task';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Save'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                 
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _noteController.dispose();
    _linkController.dispose();
    _taskController.dispose();
    super.dispose();
  }
}
