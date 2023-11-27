import 'package:flutter/material.dart';

class AddFoodScreen extends StatefulWidget {
  final Function(String) onSave;

  const AddFoodScreen({required this.onSave});

  @override
  _AddFoodScreenState createState() => _AddFoodScreenState();
}

class _AddFoodScreenState extends State<AddFoodScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Food'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Food Name'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final foodItem = _controller.text;
                if (foodItem.isNotEmpty) {
                  widget.onSave(foodItem);
                  Navigator.pop(context);
                }
              },
              child: Text('Save Food'),
            ),
          ],
        ),
      ),
    );
  }
}
