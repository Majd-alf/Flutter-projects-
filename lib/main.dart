import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(PommePoireAnanasApp());
}

class PommePoireAnanasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomme Poire Ananas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PommePoireAnanasHomePage(),
    );
  }
}

class PommePoireAnanasHomePage extends StatefulWidget {
  @override
  _PommePoireAnanasHomePageState createState() =>
      _PommePoireAnanasHomePageState();
}

class _PommePoireAnanasHomePageState extends State<PommePoireAnanasHomePage> {
  int _counter = 0;
  List<int> _items = [];

  Color _getBackgroundColor(int value) {
    return value % 2 == 0 ? Colors.indigo : Colors.cyan;
  }

  Color _getFloatingActionButtonColor() {
    return _counter == 0 ? Colors.orange : Colors.blue;
  }

  bool _isPrime(int n) {
    if (n <= 1) {
      return false;
    }
    for (int i = 2; i <= sqrt(n); i++) {
      if (n % i == 0) {
        return false;
      }
    }
    return true;
  }

  String _getItemType(int value) {
    if (_isPrime(value)) {
      return 'nombre premier';
    } else if (value % 2 == 0) {
      return 'pair';
    } else {
      return 'impair';
    }
  }

  IconData _getIcon(int value) {
    if (_isPrime(value)) {
      return Icons.eco; // Utilisation de l'icône eco pour représenter l'ananas
    } else if (value % 2 == 0) {
      return Icons.android; // Utilisation de l'icône android pour représenter la poire
    } else {
      return Icons.apple;
    }
  }

  String _getImageAsset(int value) {
    if (_isPrime(value)) {
      return 'images/ananas.png';
    } else if (value % 2 == 0) {
      return 'images/poire.png';
    } else {
      return 'images/pomme.png';
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      _items.add(_counter);
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$_counter (${_getItemType(_counter)})'),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          int value = _items[index];
          return Container(
            color: _getBackgroundColor(value),
            child: ListTile(
              title: Row(
                children: [
                  Icon(_getIcon(value), color: Colors.white),
                  SizedBox(width: 8),
                  Image.asset(
                    _getImageAsset(value),
                    width: 60,
                    height: 60,
                    
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Item $value',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: _getFloatingActionButtonColor(),
        child: Icon(Icons.add),
      ),
    );
  }
}
