import 'package:flutter/material.dart';
import 'package:nsb_remit/providers/user_details_provider.dart';
import 'package:nsb_remit/screens/auth/login/log_in_screen.dart';
import 'package:nsb_remit/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'routes/route_generator.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserDetailsProvider()),
      ],
      child: const MyApp(),
    ),
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
      onGenerateRoute: RouteGenerator.generateRoute,
      home: 
      // HomeScreen(),
      LogInScreen(),
        );
  }
}
