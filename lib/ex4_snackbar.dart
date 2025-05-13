import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contoh Snackbar',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Mencoba Widget - Snackbar'),
      ),
      body: Center(
        child: Builder(
          builder: (BuildContext context1) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: const Text('Tampilkan Snackbar'),
              onPressed: () {
                const snackBar = SnackBar(
                  content: Text('Pesan ditampilkan dengan cara pertama'),
                  duration: Duration(seconds: 2),
                );
                ScaffoldMessenger.of(context1).showSnackBar(snackBar);
              },
            );
          },
        ),
      ),
    );
  }
}
