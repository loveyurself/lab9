import 'package:flutter/material.dart';
import './signup_screen.dart';
import './reset_password_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
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
    if (_formKey.currentState!.validate()) {
      showMessage();
    }
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

                  const SizedBox(height: 16),

                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const SignUpScreen()),
                        );
                      },
                      child: const Text("Sign up"),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 48,
                          child: ElevatedButton(
                            onPressed: submit,
                            child: const Text("Login"),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: SizedBox(
                          height: 48,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const ResetPasswordScreen(),
                                ),
                              );
                            },
                            child: const Text("Reset password"),
                          ),
                        ),
                      ),
                    ],
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