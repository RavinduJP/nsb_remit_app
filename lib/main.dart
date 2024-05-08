import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsb_remit/providers/user_details_provider.dart';
import 'package:nsb_remit/screens/auth/login/log_in_screen.dart';
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
    //------------------------------------------------
    // print('Width : ' +
    //     MediaQuery.of(context).size.width.toString());
    // print('Height : ' +
    //     MediaQuery.of(context).size.height.toString());
    //------------------------------------------------
    return const  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      home:
          LogInScreen(),
    );
  }
}
