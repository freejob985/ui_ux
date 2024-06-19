import 'package:flutter/material.dart';
import 'task_list_screen.dart';

class TaskDialog extends StatefulWidget {
  final Task task;
  final Function(String note, String status, String link, String taskText) onSave;

  TaskDialog({required this.task, required this.onSave});

  @override
  _TaskDialogState createState() => _TaskDialogState();
}

class _TaskDialogState extends State<TaskDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _noteController;
  late TextEditingController _linkController;
  late TextEditingController _taskController;
  late String _status;

  @override
  void initState() {
    super.initState();
    _noteController = TextEditingController(text: widget.task?.note ?? '');
    _linkController = TextEditingController(text: widget.task?.link ?? '');
    _taskController = TextEditingController(text: widget.task?.task ?? '');
    _status = widget.task?.status ?? 'Pending';
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.task == null ? 'Add Task' : 'Edit Task'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                value: _status,
                items: ['Pending', 'In Progress', 'Completed']
                    .map((status) => DropdownMenuItem(
                          child: Text(status),
                          value: status,
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _status = value!;
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
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Save'),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              widget.onSave(
                _noteController.text,
                _status,
                _linkController.text,
                _taskController.text,
              );
              Navigator.of(context).pop();
            }
          },
        ),
      ],
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
