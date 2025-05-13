import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/product': (context) => const Product(),
        '/profil': (context) => const Profil(),
      },
    );
  }
}

Widget buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      children: <Widget>[
        ListTile(
          title: Text('Home'),
          leading: Icon(Icons.home),
          onTap: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        Divider(),
        ListTile(
          title: Text('Product'),
          leading: Icon(Icons.add_shopping_cart),
          onTap: () {
            Navigator.pushNamed(context, '/product');
          },
        ),
        Divider(),
        ListTile(
          title: Text('Profile'),
          leading: Icon(Icons.person),
          onTap: () {
            Navigator.pushNamed(context, '/profil');
          },
        ),
      ],
    ),
  );
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(context),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Home'),
      ),
      body: const Center(
        child: Text('Halaman Home'),
      ),
    );
  }
}

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(context),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Product'),
      ),
      body: const Center(
        child: Text('Halaman product'),
      ),
    );
  }
}

class Profil extends StatelessWidget {
  const Profil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(context),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Profil'),
      ),
      body: const Center(
        child: Text('Halaman profil'),
      ),
    );
  }
}
