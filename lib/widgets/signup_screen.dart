import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  bool isValidEmail(String value) {
    return RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$').hasMatch(value);
  }

  void showMessage() {
    showDialog(
      context: context,
      builder: (_) => const AlertDialog(
        title: Text("Message"),
        content: Text("Need to implement"),
      ),
    );
  }

  void submit() {
    if (_formKey.currentState!.validate()) showMessage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Center(
                    child: Image.asset(
                      'assets/images/flutter_logo.png',
                      width: 200,
                    ),
                  ),

                  const SizedBox(height: 24),

                  const Center(
                    child: Text(
                      "Sign up",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),

                  const SizedBox(height: 24),

                  const Text("Name:"),
                  const SizedBox(height: 4),
                  TextFormField(
                    controller: _nameCtrl,
                    validator: (v) =>
                    v == null || v.isEmpty ? "Name is required" : null,
                  ),

                  const SizedBox(height: 16),

                  const Text("Email:"),
                  const SizedBox(height: 4),
                  TextFormField(
                    controller: _emailCtrl,
                    validator: (v) {
                      if (v == null || v.isEmpty) return "Email is required";
                      if (!isValidEmail(v)) return "Invalid email";
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  const Text("Password:"),
                  const SizedBox(height: 4),
                  TextFormField(
                    obscureText: true,
                    controller: _passCtrl,
                    validator: (v) {
                      if (v == null || v.isEmpty) return "Password is required";
                      if (v.length < 7) return "Password must be at least 7 characters";
                      return null;
                    },
                  ),

                  const SizedBox(height: 24),

                  SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: submit,
                      child: const Text("Sign up"),
                    ),
                  ),

                  const SizedBox(height: 16),

                  SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Back"),
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}