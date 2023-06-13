import 'package:flutter/material.dart';
import 'screens.dart/screens.dart';


main()  {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const teachOrStu(),
          // ignore: prefer_const_constructors
          'Student': (context) => loginPage(),
          // ignore: prefer_const_constructors
          'Teacher': (context) => teacherLogin(),
          // ignore: prefer_const_constructors
          'Parent': (context) => parentLogin(),
          // ignore: prefer_const_constructors
          'ForgotPassword': (context) => ForgotPassword(),
        });
  }
}