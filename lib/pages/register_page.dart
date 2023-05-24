import 'package:flutter/material.dart';
import 'package:learn_test/shared/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late Auth _auth;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _auth = Auth();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Test'),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              key: const Key('email_key'),
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              key: const Key('password_key'),
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              key: const Key('register_button_key'),
              onPressed: () {
                final String? result = _auth.register(
                  _emailController.text.trim(),
                  _passwordController.text.trim(),
                );

                if (result != null) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(result),
                    backgroundColor: Colors.red,
                  ));
                }
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  const RoundedRectangleBorder(),
                ),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
              child: const Text('Register'),
            )
          ],
        ),
      ),
    );
  }
}
