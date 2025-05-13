import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/product': (context) => const ProductPage(),
        '/profile': (context) => const ProfilePage(),
        '/about': (context) => const AboutPage(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: 350,
              height: 450,
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Masukkan Data Login',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const CircleAvatar(
                          radius: 75,
                          backgroundColor: Colors.blue,
                          child: Icon(
                            Icons.account_circle,
                            size: 140,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: usernameController,
                          decoration: const InputDecoration(
                            labelText: 'Username',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Username tidak boleh kosong'
                              : null,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Email tidak boleh kosong'
                              : null,
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                String username = usernameController.text;
                                String email = emailController.text;

                                Navigator.pushReplacementNamed(
                                  context,
                                  '/home',
                                  arguments: {
                                    'username': username,
                                    'email': email,
                                  },
                                );
                              }
                            },
                            child: const Text('Login'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>?;
    final username = args?['username'] ?? 'User';
    final email = args?['email'] ?? 'Email tidak ditemukan';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Beranda'),
        foregroundColor: Colors.white,
      ),
      drawer: buildDrawer(context, username, email),
      body: Center(
        child: Text(
          'Halo, $username!\nEmail: $email',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Produk'),
        foregroundColor: Colors.white,
      ),
      drawer: buildDrawer(context, null),
      body: const Center(child: Text('Halaman Produk')),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Profil'),
        foregroundColor: Colors.white,
      ),
      drawer: buildDrawer(context, null),
      body: const Center(child: Text('Halaman Profil')),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Tentang Aplikasi'),
        foregroundColor: Colors.white,
      ),
      drawer: buildDrawer(context, null),
      body: const Center(child: Text('Versi 1.0 - Dibuat oleh Tim Flutter')),
    );
  }
}

Drawer buildDrawer(BuildContext context, String? username, [String? email]) {
  return Drawer(
    child: ListView(
      children: [
        UserAccountsDrawerHeader(
          accountName: Text(username ?? 'Pengguna'),
          accountEmail: Text(email ?? 'example@email.com'),
          currentAccountPicture: const CircleAvatar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.blue,
            child: Icon(Icons.person, size: 40),
          ),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Beranda'),
          onTap: () => Navigator.pushReplacementNamed(context, '/home'),
        ),
        ListTile(
          leading: const Icon(Icons.shopping_cart),
          title: const Text('Product'),
          onTap: () => Navigator.pushReplacementNamed(context, '/product'),
        ),
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text('Profil'),
          onTap: () => Navigator.pushReplacementNamed(context, '/profile'),
        ),
        ListTile(
          leading: const Icon(Icons.info),
          title: const Text('Tentang App'),
          onTap: () => Navigator.pushReplacementNamed(context, '/about'),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: () => Navigator.pushReplacementNamed(context, '/'),
        ),
      ],
    ),
  );
}
