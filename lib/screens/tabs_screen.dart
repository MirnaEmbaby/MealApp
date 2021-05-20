import 'package:flutter/material.dart';
import 'package:meal_app/modules/meal.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favourites_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeal;

  const TabsScreen(this.favouriteMeal);



  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

 @override
 void initState(){
   _pages  = [
     {
       'page': CategoriesScreen(),
       'title': 'Categories',
     },
     {
       'page': FavouritesScreen(widget.favouriteMeal),
       'title': 'Your Favourites',
     },
   ] ;

   super.initState();
 }

  void _selectPage(int value) {
    setState(() {
      _selectedPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favurites'),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
