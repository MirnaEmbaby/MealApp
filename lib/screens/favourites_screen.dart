import 'package:flutter/material.dart';
import 'package:meal_app/modules/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {

  final List<Meal> favouriteMeal;

  FavouritesScreen(this.favouriteMeal);


  @override
  Widget build(BuildContext context) {
    if (favouriteMeal.isEmpty) {
      return Center(
        child: Text('You Have No Favourites Yet - Start Adding Some!'),
      );
    }
    else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favouriteMeal[index].id,
            imageUrl: favouriteMeal[index].imageUrl,
            title: favouriteMeal[index].title,
            duration: favouriteMeal[index].duration,
            complexity: favouriteMeal[index].complexity,
            affordability: favouriteMeal[index].affordability,
          );
        },
        itemCount: favouriteMeal.length,
      );
    }
  }
}
