import 'package:flutter/material.dart';
import 'widgets/sign_in_screen.dart';
import 'widgets/signup_screen.dart';
import 'widgets/reset_password_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auth App',

      theme: ThemeData(

        useMaterial3: false, // 🔥 важливо! щоб кнопки не були круглі

        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,

        // 🔹 Стандартне оформлення TextField
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        ),

        // 🔹 Стандартна синя кнопка (Login / Reset / Sign up)
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero, // 🔥 прямокутні кнопки
            ),
          ),
        ),

        // 🔹 Стандартний Outlined (як Sign up у прикладі)
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(double.infinity, 48),
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero, // 🔥 прямокутні кнопки
            ),
          ),
        ),

        // 🔹 TextButton (Reset password)
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            minimumSize: const Size(double.infinity, 40),
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero, // 🔥 прямокутні
            ),
          ),
        ),
      ),

      home: const SignInScreen(),
    );
  }
}