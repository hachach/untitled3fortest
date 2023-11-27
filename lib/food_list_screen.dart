import 'package:flutter/material.dart';
import 'add_food_screen.dart';
import 'image.dart';

class FoodListScreen extends StatefulWidget {
  @override
  _FoodListScreenState createState() => _FoodListScreenState();
}

class _FoodListScreenState extends State<FoodListScreen> {
  List<String> foodItems = [];

  void _addFood(String foodItem) {
    setState(() {
      foodItems.add(foodItem);
    });
  }

  void _deleteFood(int index) {
    setState(() {
      foodItems.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: foodItems.length,
            itemBuilder: (context, index) {
              return Center(
                child: ListTile(
                  title: Text(foodItems[index], textAlign: TextAlign.center),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _deleteFood(index);
                      IconButton(    //start build lal icon + !!
                          onPressed: (){ //push to the next page!!
                            Navigator.of(context).push(MaterialPageRoute(settings: RouteSettings(arguments: foodItems[index]),
                                builder: (context) => const ShowImage()));
                          },
                          icon: const Icon(Icons.zoom_in));
                      // Function to open a Google page
                      //_launchGooglePage() async {
                        //const url = 'https://www.google.com';
                        //await launch(url);
                      //}
                    },
                  ),
                ),
              );
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddFoodScreen(onSave: _addFood)),
            );
          },
          child: Text('Add Food'),
        ),
      ],
    );
  }
}
