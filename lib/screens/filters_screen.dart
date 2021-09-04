import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function savefilters;
  final Map<String ,bool> currentFilters;


  FiltersScreen(this.currentFilters , this.savefilters, );


  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  initState()
  {
     _glutenFree = widget.currentFilters['gluten'];
     _lactoseFree = widget.currentFilters['lactose'];
     _vegan = widget.currentFilters['vegan'];
     _vegetarian = widget.currentFilters['vegetarian'];
     super.initState();
  }

  Widget BuildSwitchListView(String title, String discription,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
        value: currentValue,
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text(discription, style: TextStyle(color: Colors.white)),
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: [
          IconButton(icon: Icon(Icons.save), onPressed: (){
            final Map<String,bool> selectedFilters = {
              'gluten':_glutenFree,
              'lactose':_lactoseFree,
              'vegan':_vegan,
              'vegetarian':_vegetarian,
            };
            widget.savefilters(selectedFilters);
          }),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust Your Meal Selection",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              BuildSwitchListView(
                "Gluten_free",
                "Only include gluten free meals",
                _glutenFree,
                (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                },
              ),
              BuildSwitchListView(
                "Lactose_free",
                "Only include lactose free meals",
                _lactoseFree,
                    (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                },
              ),
              BuildSwitchListView(
                "Vegetarian",
                "Only include Vegetarian meals",
                _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                },
              ),
              BuildSwitchListView(
                "Vegan",
                "Only include Vegan meals",
                _vegan,
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                },
              ),

            ],
          )),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
