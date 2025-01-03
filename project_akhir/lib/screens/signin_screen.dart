import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project_akhir/screens/home_screen.dart';
import 'package:project_akhir/screens/signup_screen.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = "";

  // Handle sign-in logic
  void _signIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    String? storedUsername = prefs.getString('username');
    String? storedPassword = prefs.getString('password');

    if (storedUsername == null || storedPassword == null) {
      setState(() {
        _errorMessage = "Username or password is incorrect";
      });
      return;
    }

    // If credentials match, navigate to HomeScreen
    if (username == storedUsername && password == storedPassword) {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      setState(() {
        _errorMessage = "Username or password is incorrect";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: const OutlineInputBorder(),
                    errorText: _errorMessage.isNotEmpty ? _errorMessage : null,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _signIn,
                  child: const Text('Sign In'),
                ),
                const SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.deepPurple,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign Up!',
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
