import 'package:flutter/material.dart';
import 'package:nsb_remit/screens/auth/login/sign_in_screen.dart';
import 'package:nsb_remit/screens/initial/spalsh_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
        );
  }
}
