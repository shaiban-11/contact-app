import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_2/theme_settings.dart';

class Shaiban extends StatefulWidget {
  const Shaiban({super.key, required this.title});

  final String title;

  @override
  State<Shaiban> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Shaiban> {
  int _counter = 0;

  void _incrementCounter() {
    final settings = context.read<ThemeSettings>();
    settings.toggletheme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementCounter();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
