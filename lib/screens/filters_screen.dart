import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  FiltersScreen( this.currentFilters,this.saveFilters);

  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String,bool> currentFilters;

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _GlutenFree = false;
  bool _LactoseFree = false;
  bool _Vegan = false;
  bool _Vegetarian = false;

  @override
  initState(){
    _GlutenFree = widget.currentFilters['gluten'];
    _LactoseFree = widget.currentFilters['lactose'];
    _Vegan = widget.currentFilters['vegan'];
    _Vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){
              final Map<String,bool> selectedFilters = {
                'gluten': _GlutenFree,
                'lactose': _LactoseFree,
                'vegan': _Vegan,
                'vegetarian': _Vegetarian,
              };
              widget.saveFilters(selectedFilters);
              },
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your Meal Selection.',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  'Gluten-free',
                  'Only Include Gluten-free Meals.',
                  _GlutenFree,
                  (newValue) {
                    setState(() {
                      _GlutenFree = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Lactose-free',
                  'Only Include Lactose-free Meals.',
                  _LactoseFree,
                  (newValue) {
                    setState(() {
                      _LactoseFree = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Vegetarian',
                  'Only Include Vegetarian Meals.',
                  _Vegetarian,
                  (newValue) {
                    setState(() {
                      _Vegetarian = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Vegan',
                  'Only Include Vegan Meals.',
                  _Vegan,
                  (newValue) {
                    setState(() {
                      _Vegan = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
