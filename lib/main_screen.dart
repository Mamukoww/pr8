import 'package:flutter/material.dart';
import 'column_screen.dart';
import 'listview_screen.dart';
import 'listview_separated_screen.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  List<String> products = ['Помидор', 'Огурец', 'Апельсин', 'Мандарин'];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addProduct(String productName) {
    setState(() {
      products.add(productName);
    });
  }

  Future<void> _removeProduct(int index) {
    return Future.delayed(Duration(seconds: 1)).then((_) {
      setState(() {
        products.removeAt(index);
      });
    });
  }

  List<Widget> get _widgetOptions => <Widget>[
    ColumnScreen(products: products, addProduct: _addProduct, removeProduct: _removeProduct),
    ListViewScreen(products: products, addProduct: _addProduct, removeProduct: _removeProduct),
    ListViewSeparatedScreen(products: products, addProduct: _addProduct, removeProduct: _removeProduct),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.view_column),
            label: 'Column',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            label: 'ListView',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            label: 'ListView Separated',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
