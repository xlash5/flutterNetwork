import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _averageTime = 0.0;

  // send 100 requests to the API and calculate the average time
  void _makeApiRequestToDummJson100Times() async {
    double totalTime = 0.0;
    for (int i = 0; i < 100; i++) {
      final Stopwatch stopwatch = Stopwatch()..start();
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
      totalTime += stopwatch.elapsedMilliseconds;
    }
    setState(() {
      _averageTime = (totalTime / 100.0).roundToDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Your average time for API request: $_averageTime ms',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _makeApiRequestToDummJson100Times,
        child: const Icon(Icons.add),
      ),
    );
  }
}
