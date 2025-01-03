import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // TODO: Fungsi untuk mendaftar akun
  void _signUp() async {
    final prefs = await SharedPreferences.getInstance();
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    // Simpan data pengguna
    prefs.setString('username', username);
    prefs.setString('password', password);

    // Navigasi ke halaman login setelah sign up
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/signin');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: _signUp,
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
