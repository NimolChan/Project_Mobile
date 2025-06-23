import 'package:flutter/material.dart';
import '../home/index.dart';

class LoginScreen extends StatefulWidget {
  final String? prefillEmail;
  final String? prefillPassword;

  const LoginScreen({super.key, this.prefillEmail, this.prefillPassword});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: widget.prefillEmail ?? '');
    passwordController = TextEditingController(
      text: widget.prefillPassword ?? '',
    );
  }

  void handleLogin() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter both email and password'),
        ),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Text(
              'StylishCloset',
              style: TextStyle(fontSize: 28, fontFamily: 'Merienda'),
            ),
            const SizedBox(height: 16),
            Image.asset('assets/images/logo.png', height: 100),
            const SizedBox(height: 32),
            const Text('Log In', style: TextStyle(fontSize: 26)),
            const SizedBox(height: 24),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email or Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Password',
                suffixIcon: Icon(Icons.remove_red_eye_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: handleLogin,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade700,
                minimumSize: const Size(double.infinity, 50),
                foregroundColor: Colors.white,
              ),
              child: const Text('Log In'),
            ),
          ],
        ),
      ),
    );
  }
}
