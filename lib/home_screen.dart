import 'package:flutter/material.dart';
import 'food_list_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nutrition App'),
      ),
      body: FoodListScreen(),
    );
  }
}