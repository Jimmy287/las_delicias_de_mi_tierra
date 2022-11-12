import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Las delicias de mi tierra',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Las delicias de mi tierra'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
