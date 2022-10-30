import 'package:cooking_a_meal/widgets/drawer_option.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  final Function filterSave;
  Map<String, bool> currentFilters;
  FilterScreen(this.currentFilters, this.filterSave);
  static const filter = 'filterscreen';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetrain = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegetrain = widget.currentFilters['vegetrain']!;
    _vegan = widget.currentFilters['vegan']!;

    // TODO: implement initState
    super.initState();
  }

  Widget filtermeals(
      String title, String subtitle, Function fun, bool filters) {
    return SwitchListTile(
      value: filters,
      title: Text(title),
      subtitle: Text(subtitle),
      onChanged: (newvalue) {
        fun(newvalue);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetrain': _vegetrain,
              };

              widget.filterSave(selectedFilters);
            },
            icon: Icon(Icons.save_alt),
          ),
        ],
      ),
      drawer: DrawerOption(),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(15),
            alignment: Alignment.center,
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                filtermeals(
                  'Gluten-free',
                  'Only include gluten-free meals',
                  (newvalue) {
                    setState(() {
                      _glutenFree = newvalue;
                    });
                  },
                  _glutenFree,
                ),
                filtermeals(
                  'Lactose-free',
                  'Only include Lactose-free meals',
                  (newvalue) {
                    setState(() {
                      _lactoseFree = newvalue;
                    });
                  },
                  _lactoseFree,
                ),
                filtermeals(
                  'Vegetrain',
                  'Only include vegetrain meals',
                  (newvalue) {
                    setState(() {
                      _vegetrain = newvalue;
                    });
                  },
                  _vegetrain,
                ),
                filtermeals(
                  'Vegan',
                  'Only include vegan meals',
                  (newvalue) {
                    setState(() {
                      _vegan = newvalue;
                    });
                  },
                  _vegan,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
